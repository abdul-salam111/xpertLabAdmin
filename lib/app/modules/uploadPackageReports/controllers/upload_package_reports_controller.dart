import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../appConst/index.dart';
import '../../../data/uploadSimpleReportsModel.dart';
import '../../../utils/utils.dart';
import '../../uploadReports/controllers/upload_reports_controller.dart';

class UploadPackageReportsController extends GetxController {
  var nameController = TextEditingController();
  var genderController = TextEditingController();
  var testnameController = TextEditingController();
  var bookingDateController = TextEditingController();
  var bookingAddress = TextEditingController();
  var bookingTime = TextEditingController();
  var totalBillcontroller = TextEditingController();
  var bookingIdController = TextEditingController();
  var additionalCommentsController = TextEditingController();
  var uploadReportsController = TextEditingController();
  var phonecontroller = TextEditingController();
  var unitsController = TextEditingController();
  var rangeController = TextEditingController();
  var packageName = TextEditingController();
  //TODO: Implement UploadPackageReportsController
  QueryDocumentSnapshot? packageDetails;
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
    packageDetails = Get.arguments as QueryDocumentSnapshot;
    nameController.text = packageDetails!['booked_By_Name'];
    bookingAddress.text = packageDetails!['booked_By_Address'];
    totalBillcontroller.text = packageDetails!['total_Bill'];
    bookingIdController.text = packageDetails!['bookingId'];
    bookingTime.text = packageDetails!['bookingTime'];
    bookingDateController.text = DateFormat.yMEd()
        .format(DateTime.parse(packageDetails!['bookingDate']));
    phonecontroller.text = packageDetails!['booked_By_Phone'];
    genderController.text = packageDetails!['gender'];
    packageName.text = packageDetails!['package_Name'];
    testList.value = packageDetails!['Package_Tests'];
  }

  var isLoading = false.obs;
  uploadPackageReportsToTheUser({testReports}) async {
    isLoading.value = true;
    try {
      await firebasefirestore
          .collection("packageReports")
          .doc(bookingIdController.text)
          .set(UploadSimpleReportsModel(
                  // reports: testsreports,
                  userId: packageDetails!['booked_By_Id'],
                  reports: testReports,
                  packageName: packageName.text,
                  gender: genderController.text.toString(),
                  patientName: nameController.text.toString(),
                  phoneNo: phonecontroller.text.toString(),
                  bookingDate: packageDetails!['bookingDate'],
                  bookingId: bookingIdController.text.toString(),
                  bookingTime: bookingTime.text.toString(),
                  reportGenerateDateTime:
                      "${DateFormat.yMEd().format(DateTime.now())} ${DateFormat.jm().format(DateTime.now())}",
                  totalBill: totalBillcontroller.text.toString(),
                  additionalRemarks:
                      additionalCommentsController.text.toString(),
                  address: bookingAddress.text.toString())
              .toJson())
          .then((value) async {
        await firebasefirestore
            .collection(packageBookingscollection)
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
