import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:xpert_lab_admin/app/data/uploadSimpleReportsModel.dart';
import 'package:xpert_lab_admin/app/utils/utils.dart';
import 'package:xpert_lab_admin/appConst/index.dart';

class ReportModel {
  final testname, units,normalRange, testreport;

  ReportModel({this.testname, this.testreport,this.normalRange,this.units});
}

class UploadReportsController extends GetxController {
  var nameController = TextEditingController();
  var genderController = TextEditingController();
  var testnameController = TextEditingController();
  var bookingDateController = TextEditingController();
  var bookingAddress = TextEditingController();
  var bookingTime = TextEditingController();
  var unitsController=TextEditingController();
  var normalRangeController=TextEditingController();
  var totalBillcontroller = TextEditingController();
  var bookingIdController = TextEditingController();
  var additionalCommentsController = TextEditingController();
  var uploadReportsController = TextEditingController();
  var phonecontroller = TextEditingController();

  QueryDocumentSnapshot? queryDocumentSnapshot;

  var seletedTestslist = "".obs;
  var ischecked = false.obs;
  var selectedTest = "Select tests".obs;
  RxList testList = [].obs;
  var testsreports = <ReportModel>[].obs;
  var showreport = false.obs;
  @override
  void onInit() {
    // TODO: implement onReady
    super.onInit();
    queryDocumentSnapshot = Get.arguments as QueryDocumentSnapshot;
    nameController.text = queryDocumentSnapshot!['added_By_Name'];
    bookingAddress.text = queryDocumentSnapshot!['booked_By_Address'];
    totalBillcontroller.text = queryDocumentSnapshot!['totalBill'];

    bookingIdController.text = queryDocumentSnapshot!['testBookingId'];
    bookingTime.text = queryDocumentSnapshot!['bookingTime'];
    bookingDateController.text = DateFormat.yMEd()
        .format(DateTime.parse(queryDocumentSnapshot!['bookingDate']));
    phonecontroller.text = queryDocumentSnapshot!['booked_By_Phone'];
    genderController.text = queryDocumentSnapshot!['gender'];
    testList.value = queryDocumentSnapshot!['testNames'];
    testnameController.text = queryDocumentSnapshot!['testNames'].toString();
  }

  @override
  void onClose() {
    //
    //TODO: implement onClose
    testList.clear();
    super.onClose();
  }

  var isLoading = false.obs;

  uploadReportsToTheUser({String? testReports}) async {
    isLoading.value = true;
    try {
      await firebasefirestore
          .collection("simpleReports")
          .doc(bookingIdController.text)
          .set(UploadSimpleReportsModel(
                  reports: testReports,
        
                  userId: queryDocumentSnapshot!['booked_By_Id'],
                  gender: genderController.text.toString(),
                  patientName: nameController.text.toString(),
                  phoneNo: phonecontroller.text.toString(),
                  bookingDate: queryDocumentSnapshot!['bookingDate'],
                  reportGenerateDateTime:  "${DateFormat.yMEd().format(DateTime.now())} ${DateFormat.jm().format(DateTime.now())}",
                  bookingId: bookingIdController.text.toString(),
                  bookingTime: bookingTime.text.toString(),
                  totalBill: totalBillcontroller.text.toString(),
                  additionalRemarks:
                      additionalCommentsController.text.toString(),
                  address: bookingAddress.text.toString())
              .toJson())
          .then((value) async {
        await firebasefirestore
            .collection(bookingsCollection)
            .doc(bookingIdController.text)
            .delete();
        isLoading.value = false;
        Utils.toast(msg: "Reports Uploaded!", color: "#008000");
        Get.back();
      });
    } catch (e) {
      isLoading.value = false;
      Utils.toast(msg: e.toString(), color: '#FF0000');
    }
  }

  
}
