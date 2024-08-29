import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../../../../appConst/index.dart';
import '../../../../commonWidgets/index.dart';
import '../../../index.dart';

class SignIn extends GetView<SignInController> {
  const SignIn({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final _formkey = GlobalKey<FormState>();
    return backgroundWidget(
      child: WillPopScope(
        onWillPop: () async {
          return controller.isloading.value == true ? false : true;
        },
        child: Scaffold(
            backgroundColor: transparent,
            body: Stack(
              children: [
                Padding(
                  padding: padding20,
                  child: Column(
                    crossAxisAlignment: crosscenter,
                    children: [
                      20.heightBox,
                      appMainLogo(),
                      100.heightBox,
                      "𝐖𝐞𝐥𝐜𝐨𝐦𝐞 𝐭𝐨 𝐗𝐩𝐞𝐫𝐭 𝐋𝐚𝐛"
                          .text
                          .white
                          .size(50.sp)
                          .make(),
                      30.heightBox,
                      SizedBox(
                        width: 180.w,
                        child: Form(
                            key: _formkey,
                            child: Column(
                              children: [
                                customTextFields(
                                    texteditingController:
                                        controller.emailcontroller,
                                    hintText: "example@gmail.com",
                                    Label: "Email*",
                                    prefixicon: Icons.email,
                                    borderType: "rect"),
                                20.heightBox,
                                passWordTextField(
                                    texteditingcontroller:
                                        controller.passwordcontroller,
                                    hintText: "********",
                                    Label: "Password*",
                                    prefixicon: Icons.lock,
                                    borderType: "rect"),
                         
                                
                                20.heightBox,
                                customButton(
                                    onPress: () async {
                                      if (_formkey.currentState!.validate()) {
                                        controller.signin(
                                            email: controller
                                                .emailcontroller.text
                                                .toString(),
                                            password: controller
                                                .passwordcontroller.text
                                                .toString());
                                      }
                                    },
                                    btnName: "SignIn",
                                    bgColor: bluecolor,
                                    textcolor: whitecolor,
                                    btnSize: Size(double.infinity, 70.h))
                              ],
                            )),
                      )
                    ],
                  ),
                ),
                Obx(() => loadingWidget(controller.isloading.value))
              ],
            )),
      ),
    );
  }

  Widget passWordTextField(
      {texteditingcontroller,
      String? hintText,
      String? Label,
      IconData? prefixicon,
      String? borderType = "round"}) {
    return Obx(
      () => Column(
        crossAxisAlignment: crossstart,
        children: [
          Text(
            Label!,
            style: textfieldlabelStyle,
          ),
          5.heightBox,
          TextFormField(
            controller: texteditingcontroller,
            obscureText: controller.isVisible.value,
            style: textfieldinputstyle,
            validator: (val) {
              return val!.isEmpty ? "Required" : null;
            },
            decoration: InputDecoration(
              prefixIcon: Icon(
                prefixicon,
                color: whitecolor,
              ),
              contentPadding: textfieldpadding,
              hintText: hintText,
              hintStyle: const TextStyle(color: whitecolor),
              suffixIcon: Icon(
                controller.isVisible.value
                    ? Icons.visibility_off
                    : Icons.visibility,
                color: whitecolor,
              ).box.make().onTap(() {
                controller.isVisible.value == true
                    ? controller.isVisible.value = false
                    : controller.isVisible.value = true;
              }),
              alignLabelWithHint: true,
              enabledBorder:
                  borderType == "round" ? enableborder : enableborderRec,
              focusedBorder:
                  borderType == "round" ? focusborder : focusborderRec,
              border: borderType == "round" ? enableborder : enableborderRec,
            ),
          ),
        ],
      ),
    );
  }
}
