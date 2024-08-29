import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xpert_lab_admin/app/data/addPackageModel.dart';
import 'package:xpert_lab_admin/app/data/addnewtestmodel.dart';
import 'package:xpert_lab_admin/app/utils/utils.dart';
import 'package:xpert_lab_admin/appConst/index.dart';

class AddnewtestController extends GetxController {
  var testNamecontrollre = TextEditingController();
  var referenceRangecontrollre = TextEditingController();
  var testPricecontrollre = TextEditingController();
  var testDescriptioncontrollre = TextEditingController();
  var sampleCollectionInstructioncontrollre = TextEditingController();
  var sampleTypecontrollre = TextEditingController();
  var relevantDiseasescontrollre = TextEditingController();
  var turnaroundTimecontrollre = TextEditingController();
  //variable for storing category to delete test
  var selectedcategoryforDelete = "".obs;

  RxList<String?> testCategories = <String>[].obs;
  var selectedCategory = "Select Category".obs;

  var isloading = false.obs;
  //package details variable
  late QueryDocumentSnapshot packageDetails;
  //addnew test method
  addNewTest(
      {required testname,
      required testDescription,
      required testPrice,
      required sampleType,
      required sampleCollectionInstruction,
      required referenceRange,
      required relevantDiseases,
      required turnaroundTime}) async {
    try {
      isloading.value = true;
      await firebasefirestore
          .collection(testCategoriesCollection)
          .doc(selectedCategory.value)
          .collection(testSubCategoryCollection)
          .doc(testNamecontrollre.text.toString())
          .set(TestModel(
            testName: testname,
            testDescription: testDescription,
            testPrice: testPrice,
            sampleType: sampleType,
            sampleCollectionInstruction: sampleCollectionInstruction,
            referenceRange: referenceRange,
            relevantDiseases: relevantDiseases,
            turnaroundTime: turnaroundTime,
          ).toJson())
          .then((value) async {
        await firebasefirestore
            .collection(allTestscollection)
            .doc(testNamecontrollre.text.toString())
            .set(TestModel(
              testName: testname,
              testDescription: testDescription,
              testPrice: testPrice,
              sampleType: sampleType,
              sampleCollectionInstruction: sampleCollectionInstruction,
              referenceRange: referenceRange,
              relevantDiseases: relevantDiseases,
              turnaroundTime: turnaroundTime,
            ).toJson());

        isloading.value = false;

        testNamecontrollre.clear();
        testDescriptioncontrollre.clear();
        testPricecontrollre.clear();
        referenceRangecontrollre.clear();
        sampleCollectionInstructioncontrollre.clear();
        sampleTypecontrollre.clear();
        turnaroundTimecontrollre.clear();
        relevantDiseasescontrollre.clear();

        Utils.toast(msg: "Test added", color: "	#008000");
      });
    } catch (e) {
      isloading.value = false;
      Utils.toast(msg: e.toString(), color: "#FF0000");
    }
  }

  //test Details for test details page
  QueryDocumentSnapshot? testDetails;

//used to fetch the categories for drop down of select categories

  fetAllCategories() async {
    await firebasefirestore
        .collection(testCategoriesCollection)
        .get()
        .then((value) {
      testCategories.value =
          value.docs.map((e) => e['category_Name'] as String).toList();
      return testCategories;
    });
  }

  var searchcontroller = TextEditingController();
  //code for adding new packages
  RxList<String> seletedTestslist = <String>[].obs;
  var ischecked = false.obs;
  var selectedTest = "Select tests".obs;
  RxList<String> testList = <String>[].obs;
  var piscountedPriceController = TextEditingController();
  var actualPriceController = TextEditingController();
  fetchAlltest() async {
    await firebasefirestore.collection(allTestscollection).get().then((value) =>
        testList.value =
            value.docs.map((e) => e['testName'] as String).toList());
  }

  //Add new Package

  @override
  void onInit() {
    // TODO: implement onReady
    super.onInit();
    fetAllCategories();
    fetchAlltest();
  }

  Future pickImage() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image,
    );

    if (result != null) {
      PlatformFile file = result.files.first;
      if (file.bytes != null) {
        image = file.bytes!;
        imageforfirebase = result.files.first.name;

        update();
      }
    }
  }

  Future uploadImageToFirebase() async {
    try {
      if (image != null) {
        Reference ref =
            firebasestorage.ref().child("package_Images/$imageforfirebase");
        final metadata = SettableMetadata(contentType: "image/jpeg");
        UploadTask uploadTask = ref.putData(image!, metadata);
        TaskSnapshot snapshot = await uploadTask;
        imageUrl = await snapshot.ref.getDownloadURL();
      } else {
        Utils.toast(msg: "Select an image", color: "#FF0000");
      }
    } catch (e) {
      print(e);
    }
  }

  Uint8List? image;
  String? imageUrl;
  String? imageforfirebase;
  // addpackage
  addPackageToFirebase(
      {required packageName,
      required testActualPrice,
      required discountedPrice,
      required testDescription,
      required turnaroundTime,
      required samplecollectioninstruction,
      required sampleType}) async {
    isloading.value = true;
    try {
      uploadImageToFirebase().then((value) async {
        await firebasefirestore
            .collection(offerandDealscollection)
            .doc(packageName)
            .set(AddPackageModel(
              packageImage: imageUrl,
              testActualPrice: testActualPrice,
              discountedPrice: discountedPrice,
              testDescription: testDescription,
              testNames: seletedTestslist,
              turnaroundTime: turnaroundTime,
              sampleCollectionInstruction: samplecollectioninstruction,
              sampleType: sampleType,
              packageName: packageName,
            ).toJson());
        isloading.value = false;
        seletedTestslist.clear();
        image = null;
        testNamecontrollre.clear();
        actualPriceController.clear();
        testDescriptioncontrollre.clear();
        piscountedPriceController.clear();
        referenceRangecontrollre.clear();
        sampleCollectionInstructioncontrollre.clear();
        sampleTypecontrollre.clear();
        turnaroundTimecontrollre.clear();
        relevantDiseasescontrollre.clear();

        Utils.toast(msg: "Package is created", color: "#008000");
      });
    } catch (e) {
      isloading.value = false;
      Utils.toast(msg: e.toString(), color: "#FF0000");
    }
  }
}
