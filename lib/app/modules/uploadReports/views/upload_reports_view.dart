import 'dart:convert';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:xpert_lab_admin/app/commonWidgets/index.dart';
import 'package:xpert_lab_admin/appConst/index.dart';

import '../controllers/upload_reports_controller.dart';

class UploadReportsView extends GetView<UploadReportsController> {
  const UploadReportsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.back();
        return false;
      },
      child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: true,
            backgroundColor: darkBlue,
            centerTitle: true,
          ),
          body: Stack(
            alignment: Alignment.center,
            children: [
              Padding(
                padding: padding20,
                child: Center(
                  child: SingleChildScrollView(
                    physics: bouncing,
                    child: Row(
                      crossAxisAlignment: crossstart,
                      mainAxisAlignment: maincenter,
                      children: [
                        Column(
                          mainAxisAlignment: mainspar,
                          crossAxisAlignment: crosscenter,
                          children: [
                            "Enter Details Of Report"
                                .text
                                .fontFamily(montserratBold)
                                .size(25.sp)
                                .color(fullgrey)
                                .makeCentered(),
                            30.heightBox,
                            Row(
                              mainAxisAlignment: maincenter,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SizedBox(
                                  width: 200.w,
                                  child: customTextFieldsForReportsOnlyRead(
                                    Label: "Beneficiary Name",
                                    texteditingController:
                                        controller.nameController,
                                  ),
                                ),
                                30.widthBox,
                                SizedBox(
                                  width: 200.w,
                                  child: customTextFieldsForReportsOnlyRead(
                                      Label: "Gender",
                                      texteditingController:
                                          controller.genderController),
                                ),
                              ],
                            ),
                            20.heightBox,
                            Row(
                              mainAxisAlignment: maincenter,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SizedBox(
                                  width: 200.w,
                                  child: customTextFieldsForReportsOnlyRead(
                                    Label: "Test Name",
                                    texteditingController:
                                        controller.testnameController,
                                  ),
                                ),
                                30.widthBox,
                                SizedBox(
                                  width: 200.w,
                                  child: customTextFieldsForReportsOnlyRead(
                                      Label: "Booking Id",
                                      texteditingController:
                                          controller.bookingIdController),
                                ),
                              ],
                            ),
                            20.heightBox,
                            Row(
                              mainAxisAlignment: maincenter,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SizedBox(
                                  width: 200.w,
                                  child: customTextFieldsForReportsOnlyRead(
                                    Label: "Booking Date",
                                    texteditingController:
                                        controller.bookingDateController,
                                  ),
                                ),
                                30.widthBox,
                                SizedBox(
                                  width: 200.w,
                                  child: customTextFieldsForReportsOnlyRead(
                                      Label: "Booking Time",
                                      texteditingController:
                                          controller.bookingTime),
                                ),
                              ],
                            ),
                            20.heightBox,
                            Row(
                              mainAxisAlignment: maincenter,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SizedBox(
                                  width: 200.w,
                                  child: customTextFieldsForReportsOnlyRead(
                                    Label: "Phone No",
                                    texteditingController:
                                        controller.phonecontroller,
                                  ),
                                ),
                                30.widthBox,
                                SizedBox(
                                  width: 200.w,
                                  child: customTextFieldsForReportsOnlyRead(
                                      Label: "Total Bill",
                                      texteditingController:
                                          controller.totalBillcontroller),
                                ),
                              ],
                            ),
                            20.heightBox,
                            Row(
                              mainAxisAlignment: maincenter,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SizedBox(
                                  width: 200.w,
                                  child: customTextFieldsForReportsOnlyRead(
                                    Label: "Address",
                                    texteditingController:
                                        controller.bookingAddress,
                                  ),
                                ),
                                30.widthBox,
                                SizedBox(
                                  width: 200.w,
                                  child: customTextFieldsForTests(
                                      hintText: "Additional Remarks",
                                      Label: "Additional Comments",
                                      texteditingController: controller
                                          .additionalCommentsController),
                                ),
                              ],
                            ),
                            20.heightBox,
                            Row(
                              children: [
                                Obx(
                                  () => controller.showreport.value
                                      ? SizedBox(
                                          width: 200.w,
                                          height: 70.h,
                                          child: DropdownButtonHideUnderline(
                                            child: Obx(
                                              () => DropdownButton2<String>(
                                                isExpanded: true,
                                                hint: controller
                                                        .seletedTestslist
                                                        .isNotEmpty
                                                    ? Text(
                                                        controller
                                                            .seletedTestslist
                                                            .value,
                                                        style: TextStyle(
                                                            fontSize: 15.sp,
                                                            color: fullgrey,
                                                            fontFamily:
                                                                montserratBold),
                                                      )
                                                    : Text(
                                                        "Select Tests",
                                                        style: TextStyle(
                                                            fontSize: 15.sp,
                                                            color: fullgrey,
                                                            fontFamily:
                                                                montserratBold),
                                                      ),
                                                items: controller.testList
                                                    .map((item) {
                                                  return DropdownMenuItem<
                                                      String>(
                                                    onTap: () {
                                                      controller
                                                          .seletedTestslist
                                                          .value = item;
                                                    },
                                                    value: item,
                                                    child: Row(
                                                      children: [
                                                        Text(
                                                          item,
                                                          style: TextStyle(
                                                            fontSize: 15.sp,
                                                            fontFamily:
                                                                montserratBold,
                                                            color: fullgrey,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  );
                                                }).toList(),
                                                onChanged: (String? value) {
                                                  controller.selectedTest
                                                      .value = value!;
                                                },
                                                buttonStyleData:
                                                    ButtonStyleData(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 16),
                                                  height: 40.h,
                                                  width: 140.w,
                                                ),
                                              )
                                                  .box
                                                  .border(color: whitecolor)
                                                  .color(verylightgrey)
                                                  .roundedSM
                                                  .outerShadow
                                                  .make(),
                                            ),
                                          ))
                                      : const SizedBox.shrink(),
                                ),
                                20.widthBox,
                                Obx(
                                  () => controller.showreport.value
                                      ? SizedBox(
                                          width: 200.w,
                                          child: customTextFieldsForTests(
                                              prefixicon: Obx(
                                                () => controller
                                                        .showreport.value
                                                    ? IconButton(
                                                        onPressed: () {
                                                          if (controller
                                                              .uploadReportsController
                                                              .text
                                                              .isNotEmpty) {
                                                            controller
                                                                .showreport
                                                                .value = false;
                                                            controller.testsreports.add(ReportModel(
                                                                testname: controller
                                                                    .seletedTestslist
                                                                    .value
                                                                    .toString(),
                                                                units: controller
                                                                    .unitsController
                                                                    .text,
                                                                normalRange:
                                                                    controller
                                                                        .normalRangeController
                                                                        .text,
                                                                testreport:
                                                                    controller
                                                                        .uploadReportsController
                                                                        .text));

                                                            controller
                                                                .uploadReportsController
                                                                .clear();
                                                            controller
                                                                .unitsController
                                                                .clear();
                                                            controller
                                                                .normalRangeController
                                                                .clear();
                                                            controller
                                                                .seletedTestslist
                                                                .value = "";
                                                          }
                                                        },
                                                        icon: Icon(Icons.add))
                                                    : SizedBox.shrink(),
                                              ),
                                              texteditingController: controller
                                                  .uploadReportsController,
                                              Label: "Report results",
                                              hintText: "Enter results here"),
                                        )
                                      : const SizedBox.shrink(),
                                ),
                              ],
                            ),
                            20.heightBox,
                            Obx(() => controller.showreport.value
                                ? Row(
                                    mainAxisAlignment: maincenter,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      SizedBox(
                                        width: 200.w,
                                        child: customTextFieldsForTests(
                                            hintText: "Normal Range",
                                            Label: "Normal Range",
                                            texteditingController: controller
                                                .normalRangeController),
                                      ),
                                      30.widthBox,
                                      SizedBox(
                                        width: 200.w,
                                        child: customTextFieldsForTests(
                                            hintText: "Units",
                                            Label: "Units",
                                            texteditingController:
                                                controller.unitsController),
                                      ),
                                    ],
                                  )
                                : SizedBox.shrink()),
                            20.heightBox,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text("Add Test Reports"),
                                IconButton(
                                    onPressed: () {
                                      controller.showreport.value = true;
                                    },
                                    icon: Icon(Icons.add))
                              ],
                            ),
                          ],
                        ),
                        50.widthBox,
                        30.heightBox,
                        Obx(() => controller.testsreports.isNotEmpty
                            ? SizedBox(
                                width: 100.w,
                                height: 700.h,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    "List of Reports"
                                        .text
                                        .fontFamily(montserratBold)
                                        .size(17.sp)
                                        .make(),
                                    30.heightBox,
                                    Expanded(
                                        child: ListView.builder(
                                            physics: bouncing,
                                            itemCount:
                                                controller.testsreports.length,
                                            itemBuilder: (context, index) {
                                              return ListTile(
                                                title: Text(controller
                                                    .testsreports[index]
                                                    .testname),
                                                subtitle: Column(
                                                  crossAxisAlignment: crossstart,
                                                  children: [
                                                    "Result".text.bold.make(),
                                                   
                                                    Text(controller
                                                        .testsreports[index]
                                                        .testreport),
                                                         5.heightBox,
                                                    "Units".text.bold.make(),
                                                    
                                                    Text(controller
                                                         .testsreports[index]
                                                        .units),
                                                         5.heightBox,
                                                    "Normal range"
                                                        .text
                                                        .bold
                                                        .make(),
                                                    Text(controller
                                                         .testsreports[index]
                                                        .normalRange),
                                                  ],
                                                ),
                                                trailing: IconButton(onPressed: (){
                                                  controller
                                                         .testsreports.removeAt(index);
                                                }, icon: Icon(Icons.delete,color: redColor,)),
                                              );
                                            })),
                                    20.heightBox,
                                    customButton(
                                        onPress: () {
                                          var tomaps = {};
                                          for (var element
                                              in controller.testsreports) {
                                            tomaps.addEntries([
                                              MapEntry(
                                                  element.testname,
                                                  element.testreport +
                                                      "rng" +
                                                      element.normalRange +
                                                      "unit" +
                                                      element.units)
                                            ]);
                                          }
                                          var reports =
                                              jsonEncode(tomaps).toString();
                                          controller.uploadReportsToTheUser(
                                              testReports: reports);
                                        },
                                        btnName: "Upload Reports",
                                        bgColor: darkBlue,
                                        textcolor: whitecolor,
                                        btnSize: Size(50.w, 50.h)),
                                  ],
                                )
                                    .box
                                    .white
                                    .padding(defaultPadding)
                                    .outerShadow
                                    .margin(EdgeInsets.only(top: 80.h))
                                    .roundedSM
                                    .make(),
                              )
                            : SizedBox.shrink()),
                      ],
                    ),
                  ),
                ),
              ),
              Obx(() => loadingWidget(controller.isLoading.value))
            ],
          )),
    );
  }
}
