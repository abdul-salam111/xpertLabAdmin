import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:velocity_x/velocity_x.dart';
import 'package:xpert_lab_admin/app/commonWidgets/index.dart';
import 'package:xpert_lab_admin/app/modules/index.dart';

import '../../../../appConst/index.dart';
import '../../../utils/utils.dart';

class PackageDetailsScreen extends GetView<AddnewtestController> {
  const PackageDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: controller.packageDetails['packageName']
            .toString()
            .text
            .white
            .make(),
        backgroundColor: darkBlue,
        automaticallyImplyLeading: true,
        iconTheme: const IconThemeData(color: whitecolor),
      ),
      body: Padding(
        padding: padding20,
        child: Column(
          crossAxisAlignment: crossstart,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: crossstart,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CachedNetworkImage(
                  imageUrl: controller.packageDetails['packageImage'],
                  height: 300.h,
                  width: 200.w,
                ),
                IconButton(
                    onPressed: () {
                      firebasefirestore
                          .collection(offerandDealscollection)
                          .doc(controller.packageDetails.id)
                          .delete()
                          .then((value) {
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
            20.heightBox,
            "Test included in package"
                .text
                .fontFamily(montserratBold)
                .size(20.sp)
                .make(),
            10.heightBox,
            controller.packageDetails['testNames']
                .toString()
                .text
                .fontFamily(montserratMedium)
                .size(20.sp)
                .make(),
            20.heightBox,
            Row(
              children: [
                "Package Price:"
                    .text
                    .fontFamily(montserratBold)
                    .size(20.sp)
                    .make(),
                "${controller.packageDetails['discountedPrice']} pkr"
                    .toString()
                    .text
                    .fontFamily(montserratMedium)
                    .size(20.sp)
                    .make(),
                10.widthBox,
                "${controller.packageDetails['testActualPrice']} pkr "
                    .toString()
                    .text
                    .color(redColor)
                    .lineThrough
                    .fontFamily(montserratMedium)
                    .size(20.sp)
                    .make(),
              ],
            ),
            20.heightBox,
            "Sample Type".text.fontFamily(montserratBold).size(20.sp).make(),
            10.heightBox,
            controller.packageDetails['sampleType']
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
            controller.packageDetails['turnaroundTime']
                .toString()
                .text
                .fontFamily(montserratMedium)
                .size(20.sp)
                .make(),
            20.heightBox,
            "Description".text.fontFamily(montserratBold).size(20.sp).make(),
            10.heightBox,
            controller.packageDetails['testDescription']
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
            controller.packageDetails['sampleCollectionInstruction']
                .toString()
                .text
                .justify
                .fontFamily(montserratMedium)
                .size(20.sp)
                .make(),
            20.heightBox,
          ],
        ).box.outerShadow.white.padding(padding16).rounded.make(),
      ),
    );
  }
}
