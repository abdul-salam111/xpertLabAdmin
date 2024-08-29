import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:xpert_lab_admin/app/utils/utils.dart';
import 'package:xpert_lab_admin/appConst/firebaseConst.dart';

import '../../../data/addCategoryModel.dart';

class AddCategoryController extends GetxController {



  //selected test category for delete
  var selectedTestCategoryForDelete="".obs;
  var categoryController = TextEditingController();
  late QueryDocumentSnapshot testDetails;
  Uint8List? image;
  String? imageUrl;
  String? imageforfirebase;
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

  var isloading = false.obs;

  Future uploadImageToFirebase() async {
    try {
      if (image != null) {
        Reference ref =
            firebasestorage.ref().child("category_Images/$imageforfirebase");
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

  addCategoryToFirebase({required CategoryName}) async {
    isloading.value = true;
    try {
      uploadImageToFirebase().then((value) async {
        await firebasefirestore
            .collection("testCategories")
            .doc(CategoryName)
            .set(AddCategory(
                    category_Image: imageUrl, category_Name: CategoryName)
                .toJson())
            .then((value) {
          isloading.value = false;
          image = null;
          categoryController.clear();
          Utils.toast(msg: "Category has been added!", color: "#008000");
          update();
        });
      });
    } catch (e) {
      print(e);
      isloading.value = false;
    }
  }
}
