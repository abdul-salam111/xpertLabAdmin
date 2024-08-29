import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:velocity_x/velocity_x.dart';
import 'package:xpert_lab_admin/app/commonWidgets/index.dart';
import 'package:xpert_lab_admin/app/modules/index.dart';
import 'package:xpert_lab_admin/app/utils/utils.dart';

import '../../../../appConst/index.dart';

class TestDetails extends GetView<AddCategoryController> {
  const TestDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: controller.testDetails['testName'].toString().text.white.make(),
        backgroundColor: darkBlue,
        automaticallyImplyLeading: true,
        iconTheme: const IconThemeData(color: whitecolor),
      ),
      body: Padding(
        padding: padding20,
        child: Column(
          crossAxisAlignment: crossstart,
          children: [
            Row(
              mainAxisAlignment: mainspbet,
              children: [
                "Test Name".text.fontFamily(montserratBold).size(20.sp).make(),
                IconButton(
                    onPressed: () {
                      firebasefirestore
                          .collection(testCategoriesCollection)
                          .doc(controller.selectedTestCategoryForDelete.value)
                          .collection(testSubCategoryCollection)
                          .doc(controller.testDetails.id)
                          .delete()
                          .then((value) {
                        firebasefirestore
                            .collection(allTestscollection)
                            .doc(controller.testDetails.id)
                            .delete();
                        Get.back();
                        Utils.toast(
                            msg: "Package deleted from database",
                            color: "#008000");
                      });
                    },
                    icon: Icon(
                      Icons.delete,
                      color: redColor,
                      size: 40.sp,
                    )),
              ],
            ),
            10.heightBox,
            controller.testDetails['testName']
                .toString()
                .text
                .fontFamily(montserratMedium)
                .size(20.sp)
                .make(),
            20.heightBox,
            "Test Price".text.fontFamily(montserratBold).size(20.sp).make(),
            10.heightBox,
            " ${controller.testDetails['testPrice']} pkr"
                .toString()
                .text
                .fontFamily(montserratMedium)
                .size(20.sp)
                .make(),
            20.heightBox,
            "Sample Type".text.fontFamily(montserratBold).size(20.sp).make(),
            10.heightBox,
            controller.testDetails['sampleType']
                .toString()
                .text
                .fontFamily(montserratMedium)
                .size(20.sp)
                .make(),
            20.heightBox,
            "Turn around time"
                .text
                .fontFamily(montserratBold)
                .size(20.sp)
                .make(),
            10.heightBox,
            controller.testDetails['turnaroundTime']
                .toString()
                .text
                .fontFamily(montserratMedium)
                .size(20.sp)
                .make(),
            20.heightBox,
            "referenceRange".text.fontFamily(montserratBold).size(20.sp).make(),
            10.heightBox,
            controller.testDetails['referenceRange']
                .toString()
                .text
                .fontFamily(montserratMedium)
                .size(20.sp)
                .make(),
            20.heightBox,
            "Description".text.fontFamily(montserratBold).size(20.sp).make(),
            10.heightBox,
            controller.testDetails['testDescription']
                .toString()
                .text
                .justify
                .fontFamily(montserratMedium)
                .size(20.sp)
                .make(),
            20.heightBox,
            "Sample Collection Instruction"
                .text
                .fontFamily(montserratBold)
                .size(20.sp)
                .make(),
            10.heightBox,
            controller.testDetails['sampleCollectionInstruction']
                .toString()
                .text
                .justify
                .fontFamily(montserratMedium)
                .size(20.sp)
                .make(),
            20.heightBox,
            "Relevant Diseases"
                .text
                .fontFamily(montserratBold)
                .size(20.sp)
                .make(),
            10.heightBox,
            controller.testDetails['relevantDiseases']
                .toString()
                .text
                .justify
                .fontFamily(montserratMedium)
                .size(20.sp)
                .make(),
          ],
        ).box.outerShadow.white.padding(padding16).rounded.make(),
      ),
    );
  }
}
