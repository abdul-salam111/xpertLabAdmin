import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xpert_lab_admin/app/utils/utils.dart';

import '../../../../../appConst/firebaseConst.dart';
import '../../../../routes/app_pages.dart';

class SignInController extends GetxController {

  var isloading=false.obs;
  var isVisible = false.obs;
  var emailcontroller = TextEditingController();
  var passwordcontroller = TextEditingController();
  signin({email, password}) async {
    try {
      isloading.value=true;
      await firebaseauth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) {
            isloading.value=false;
        Get.offAllNamed(Routes.HOME_PAGE);
        isloading.value=false;
      });
    } catch (e) {
      Utils.toast(msg: e.toString(), color: "#FF0000");
      isloading.value=false;
    }
  }
 
}
