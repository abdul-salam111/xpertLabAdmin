import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:xpert_lab_admin/app/commonWidgets/builderconditions.dart';
import 'package:xpert_lab_admin/app/modules/addnewtest/views/packageDetails.dart';
import 'package:xpert_lab_admin/app/modules/addnewtest/views/testDetails.dart';
import 'package:xpert_lab_admin/app/utils/utils.dart';

import '../../../../appConst/index.dart';
import '../../../commonWidgets/index.dart';
import '../../index.dart';

class AddnewtestView extends GetView<AddnewtestController> {
  AddnewtestView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          iconTheme: const IconThemeData(color: whitecolor),
          backgroundColor: darkBlue,
          bottom: TabBar(
            tabs: [
              Tab(
                  icon: Image.asset(
                    addtest,
                    width: 60.w,
                    height: 60.h,
                    color: whitecolor,
                  ),
                  text: 'Add New Test'),
              Tab(
                  icon: Image.asset(
                    addpackageicon,
                    width: 60.w,
                    height: 60.h,
                    color: whitecolor,
                  ),
                  text: 'Add New Package'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            // Tab 1 content
            Stack(
              alignment: Alignment.center,
              children: [
                Padding(
                  padding: padding20,
                  child: Row(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: crosscenter,
                        children: [
                          10.heightBox,
                          "Enter Test Details"
                              .text
                              .fontFamily(montserratBold)
                              .size(30.sp)
                              .color(darkBlue)
                              .make(),
                          30.heightBox,
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(
                                width: 150.w,
                                child: customTextFieldsForTests(
                                  texteditingController:
                                      controller.testNamecontrollre,
                                  Label: "Test Name",
                                  hintText:
                                      "Name of the test (e.g.Lipid Profile, Urinalysis).",
                                ),
                              ),
                              20.widthBox,
                              SizedBox(
                                width: 150.w,
                                child: customTextFieldsForTests(
                                  texteditingController:
                                      controller.referenceRangecontrollre,
                                  Label: "Reference Range",
                                  hintText:
                                      "e.g., for blood glucose test: 70-100 mg/dL",
                                ),
                              ),
                            ],
                          ),
                          20.heightBox,
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Obx(
                                () => SizedBox(
                                    width: 150.w,
                                    height: 70.h,
                                    child: DropdownButtonHideUnderline(
                                      child: DropdownButton2<String>(
                                        isExpanded: true,
                                        hint: Text(
                                          controller.selectedCategory.value,
                                          style: TextStyle(
                                              fontSize: 15.sp,
                                              color: fullgrey,
                                              fontFamily: montserratBold),
                                        ),
                                        items: controller.testCategories
                                            .map((item) =>
                                                DropdownMenuItem<String>(
                                                  value: item,
                                                  child: Text(
                                                    item!,
                                                    style: TextStyle(
                                                      fontSize: 15.sp,
                                                      fontFamily:
                                                          montserratBold,
                                                      color: fullgrey,
                                                    ),
                                                  ),
                                                ))
                                            .toList(),
                                        onChanged: (String? value) {
                                          controller.selectedCategory.value =
                                              value!;
                                        },
                                        buttonStyleData: ButtonStyleData(
                                          padding: const EdgeInsets.symmetric(
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
                                    )),
                              ),
                              20.widthBox,
                              SizedBox(
                                width: 150.w,
                                child: customTextFieldsForTests(
                                  keyboradType: TextInputType.phone,
                                  texteditingController:
                                      controller.testPricecontrollre,
                                  Label: "Test Price",
                                  hintText: "e.g., 2400 pkr",
                                ),
                              ),
                            ],
                          ),
                          20.heightBox,
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(
                                width: 150.w,
                                child: customTextFieldsForTests(
                                  texteditingController:
                                      controller.turnaroundTimecontrollre,
                                  Label: "Turnaround Time",
                                  hintText: "e.g., 2 hours, or 3 days",
                                ),
                              ),
                              20.widthBox,
                              SizedBox(
                                width: 150.w,
                                child: customTextFieldsForTests(
                                  texteditingController:
                                      controller.relevantDiseasescontrollre,
                                  Label: "Relevant Diseases",
                                  hintText: "Relevant Diseases with commas (,)",
                                ),
                              ),
                            ],
                          ),
                          20.heightBox,
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(
                                  width: 150.w,
                                  child: customTextFieldsForTests(
                                    texteditingController:
                                        controller.sampleTypecontrollre,
                                    Label: "Sample Type",
                                    hintText: "e.g., blood, urine, saliva.",
                                  )),
                              20.widthBox,
                              SizedBox(
                                width: 150.w,
                                child: customTextFieldsForTests(
                                  texteditingController: controller
                                      .sampleCollectionInstructioncontrollre,
                                  Label: "Sample Collection Instructions",
                                  hintText:
                                      "Instructions about sample collection if any...",
                                ),
                              ),
                            ],
                          ),
                          20.heightBox,
                          SizedBox(
                            width: 300.w,
                            child: customTextFieldsForTests(
                              texteditingController:
                                  controller.testDescriptioncontrollre,
                              Label: "Test Description",
                              hintText: "Purpose and siginificance of test",
                            ),
                          ),
                          20.heightBox,
                          customButton(
                              onPress: () {
                                if (controller.selectedCategory.value.isEmpty ||
                                    controller
                                        .testNamecontrollre.text.isEmpty ||
                                    controller
                                        .testPricecontrollre.text.isEmpty ||
                                    controller.relevantDiseasescontrollre.text
                                        .isEmpty ||
                                    controller
                                        .sampleTypecontrollre.text.isEmpty ||
                                    controller.referenceRangecontrollre.text
                                        .isEmpty ||
                                    controller.testDescriptioncontrollre.text
                                        .isEmpty) {
                                  Utils.toast(
                                      msg: "Please fill required fields",
                                      color: "#FF0000");
                                } else {
                                  controller.addNewTest(
                                      testname: controller.testNamecontrollre.text
                                          .toString(),
                                      testDescription: controller
                                          .testDescriptioncontrollre.text
                                          .toString(),
                                      testPrice: controller
                                          .testPricecontrollre.text
                                          .toString(),
                                      sampleType: controller
                                          .sampleTypecontrollre.text
                                          .toString(),
                                      sampleCollectionInstruction: controller
                                          .sampleCollectionInstructioncontrollre
                                          .text
                                          .toString(),
                                      referenceRange: controller
                                          .referenceRangecontrollre.text
                                          .toString(),
                                      relevantDiseases: controller
                                          .relevantDiseasescontrollre.text
                                          .toString(),
                                      turnaroundTime: controller
                                          .turnaroundTimecontrollre.text
                                          .toString());
                                }
                              },
                              btnName: "Add Test",
                              bgColor: darkBlue,
                              textcolor: whitecolor,
                              btnSize: Size(150.w, 80.h))
                        ],
                      )
                          .box
                          .white
                          .outerShadow
                          .rounded
                          .padding(defaultPadding)
                          .make(),
                      50.widthBox,
                      StreamBuilder(
                          stream: firebasefirestore
                              .collection(allTestscollection)
                              .snapshots(),
                          builder:
                              (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                            if (!snapshot.hasData) {
                              return const Center(
                                child: CircularProgressIndicator(
                                  color: darkBlue,
                                ),
                              );
                            } else if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const Center(
                                child: CircularProgressIndicator(
                                  color: darkBlue,
                                ),
                              );
                            } else if (snapshot.data!.docs.isEmpty) {
                              return emptycollection(
                                  text: "No test added yet.");
                            }
                            return Expanded(
                              child: GridView.builder(
                                  physics: bouncing,
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                          mainAxisSpacing: 4,
                                          crossAxisSpacing: 4,
                                          crossAxisCount: 4),
                                  itemCount: snapshot.data!.docs.length,
                                  itemBuilder: (contxt, index) {
                                    var data = snapshot.data!.docs[index];
                                    return Column(
                                      mainAxisAlignment: mainspar,
                                      crossAxisAlignment: crossstart,
                                      children: [
                                        "Test Name:"
                                            .text
                                            .fontFamily(montserratBold)
                                            .size(12.sp)
                                            .make(),
                                        data['testName']
                                            .toString()
                                            .text
                                            .fontFamily(montserratRegular)
                                            .size(12.sp)
                                            .make(),
                                        "Sample Type:"
                                            .text
                                            .fontFamily(montserratBold)
                                            .size(12.sp)
                                            .make(),
                                        data['sampleType']
                                            .toString()
                                            .text
                                            .fontFamily(montserratRegular)
                                            .size(12.sp)
                                            .make(),
                                        "Reference Range:"
                                            .text
                                            .fontFamily(montserratBold)
                                            .size(12.sp)
                                            .make(),
                                        data['referenceRange']
                                            .toString()
                                            .text
                                            .fontFamily(montserratRegular)
                                            .size(12.sp)
                                            .make(),
                                        "Test Price:"
                                            .text
                                            .fontFamily(montserratBold)
                                            .size(12.sp)
                                            .make(),
                                        " ${data['testPrice']} pkr"
                                            .toString()
                                            .text
                                            .fontFamily(montserratRegular)
                                            .size(12.sp)
                                            .make()
                                      ],
                                    )
                                        .box
                                        .outerShadow
                                        .white
                                        .padding(defaultPadding)
                                        .roundedSM
                                        .make()
                                        .onTap(() {
                                      controller.testDetails = data;
                                      Get.to(() => Details());
                                    });
                                  }),
                            );
                          })
                    ],
                  ),
                ),
                Obx(() => loadingWidget(controller.isloading.value))
              ],
            ),
            // Tab 2 content
            Form(
              child: Padding(
                padding: padding20,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SingleChildScrollView(
                          physics: bouncing,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: crosscenter,
                            children: [
                              10.heightBox,
                              "Enter Package Details"
                                  .text
                                  .fontFamily(montserratBold)
                                  .size(30.sp)
                                  .color(darkBlue)
                                  .make(),
                              30.heightBox,
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  SizedBox(
                                    width: 150.w,
                                    child: customTextFieldsForTests(
                                      texteditingController:
                                          controller.testNamecontrollre,
                                      Label: "Package Name",
                                      hintText: "e.g Obesity Profile.",
                                    ),
                                  ),
                                  20.widthBox,
                                  SizedBox(
                                    width: 150.w,
                                    child: customTextFieldsForTests(
                                      texteditingController:
                                          controller.turnaroundTimecontrollre,
                                      Label: "Turnaround Time",
                                      hintText: "e.g., 4 hours, 3 days.",
                                    ),
                                  ),
                                ],
                              ),
                              20.heightBox,
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  SizedBox(
                                      width: 300.w,
                                      height: 70.h,
                                      child: DropdownButtonHideUnderline(
                                        child: Obx(
                                          () => DropdownButton2<String>(
                                            dropdownSearchData:
                                                DropdownSearchData(
                                              searchController:
                                                  controller.searchcontroller,
                                              searchMatchFn: (item, searchValue) {
                                                return item.value
                                                    .toString()
                                                    .toLowerCase()
                                                    .contains(searchValue
                                                        .toLowerCase());
                                              },
                                              searchInnerWidgetHeight: 50,
                                              searchInnerWidget: Container(
                                                height: 50,
                                                padding: const EdgeInsets.only(
                                                  top: 8,
                                                  bottom: 4,
                                                  right: 8,
                                                  left: 8,
                                                ),
                                                child: TextFormField(
                                                  expands: true,
                                                  maxLines: null,
                                                  controller:
                                                      controller.searchcontroller,
                                                  decoration: InputDecoration(
                                                    isDense: true,
                                                    contentPadding:
                                                        const EdgeInsets
                                                            .symmetric(
                                                      horizontal: 10,
                                                      vertical: 8,
                                                    ),
                                                    hintText: 'Search for tests',
                                                    hintStyle: const TextStyle(
                                                        fontSize: 12),
                                                    border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            isExpanded: true,
                                            hint: controller
                                                    .seletedTestslist.isEmpty
                                                ? Text(
                                                    "Select Tests",
                                                    style: TextStyle(
                                                        fontSize: 15.sp,
                                                        color: fullgrey,
                                                        fontFamily:
                                                            montserratBold),
                                                  )
                                                : ListView(
                                                    scrollDirection:
                                                        Axis.horizontal,
                                                    physics: bouncing,
                                                    children: List.generate(
                                                        controller
                                                            .seletedTestslist
                                                            .length,
                                                        (index) => Text(controller
                                                                    .seletedTestslist[
                                                                index])
                                                            .box
                                                            .roundedSM
                                                            .padding(
                                                                const EdgeInsets
                                                                    .all(5))
                                                            .margin(
                                                                const EdgeInsets
                                                                        .only(
                                                                    left: 5))
                                                            .color(whitecolor)
                                                            .makeCentered()),
                                                  ),
                                            items:
                                                controller.testList.map((item) {
                                              return DropdownMenuItem<String>(
                                                onTap: () {
                                                  if (!controller.seletedTestslist
                                                      .contains(item)) {
                                                    controller.seletedTestslist
                                                        .add(item);
                                                  } else {
                                                    // Remove the item from the selectedTestList if the checkbox is unchecked
                                                    controller.seletedTestslist
                                                        .remove(item);
                                                  }
                                                },
                                                value: item,
                                                child: Obx(
                                                  () => Row(
                                                    children: [
                                                      Checkbox(
                                                          value: controller
                                                              .seletedTestslist
                                                              .contains(item),
                                                          onChanged: (val) {
                                                            if (val == true) {
                                                              // Add the item to the selectedTestList if the checkbox is checked
                                                              if (!controller
                                                                  .seletedTestslist
                                                                  .contains(
                                                                      item)) {
                                                                controller
                                                                    .seletedTestslist
                                                                    .add(item);
                                                              }
                                                            } else {
                                                              // Remove the item from the selectedTestList if the checkbox is unchecked
                                                              controller
                                                                  .seletedTestslist
                                                                  .remove(item);
                                                            }
                                                          }),
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
                                                ),
                                              );
                                            }).toList(),
                                            onChanged: (String? value) {
                                              controller.selectedTest.value =
                                                  value!;
                                            },
                                            buttonStyleData: ButtonStyleData(
                                              padding: const EdgeInsets.symmetric(
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
                                      )),
                                  20.widthBox,
                                ],
                              ),
                              20.heightBox,
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  SizedBox(
                                    width: 150.w,
                                    child: customTextFieldsForTests(
                                      texteditingController:
                                          controller.piscountedPriceController,
                                      Label: "Discounted Price",
                                      hintText: "e.g.,2400 pkr",
                                    ),
                                  ),
                                  20.widthBox,
                                  SizedBox(
                                    width: 150.w,
                                    child: customTextFieldsForTests(
                                      texteditingController:
                                          controller.actualPriceController,
                                      Label: "Actual Price",
                                      hintText: "e.g,. 5000 pkr",
                                    ),
                                  ),
                                ],
                              ),
                              20.heightBox,
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  SizedBox(
                                      width: 150.w,
                                      child: customTextFieldsForTests(
                                        texteditingController:
                                            controller.sampleTypecontrollre,
                                        Label: "Sample Type",
                                        hintText: "e.g., blood, urine, saliva.",
                                      )),
                                  20.widthBox,
                                  SizedBox(
                                    width: 150.w,
                                    child: customTextFieldsForTests(
                                      texteditingController: controller
                                          .sampleCollectionInstructioncontrollre,
                                      Label: "Sample Collection Instructions",
                                      hintText:
                                          "Instructions about sample collection if any...",
                                    ),
                                  ),
                                ],
                              ),
                              20.heightBox,
                              SizedBox(
                                height: 300.h,
                                child: Row(
                                  crossAxisAlignment: crossstart,
                                  children: [
                                    Column(
                                      crossAxisAlignment: crossstart,
                                      mainAxisAlignment: mainspbet,
                                      children: [
                                        SizedBox(
                                          width: 200.w,
                                          child: customTextFieldsForTests(
                                            texteditingController: controller
                                                .testDescriptioncontrollre,
                                            Label: "Package Description",
                                            hintText:
                                                "Purpose and siginificance of package",
                                          ),
                                        ),
                                        customButton(
                                            onPress: () {
                                              if (controller.testNamecontrollre
                                                      .text.isEmpty ||
                                                  controller
                                                      .seletedTestslist.isEmpty ||
                                                  controller.actualPriceController
                                                      .text.isEmpty ||
                                                  controller
                                                      .piscountedPriceController
                                                      .text
                                                      .isEmpty ||
                                                  controller
                                                      .sampleCollectionInstructioncontrollre
                                                      .text
                                                      .isEmpty) {
                                                Utils.toast(
                                                    msg:
                                                        "Please fill all the fields",
                                                    color: "#FF0000");
                                              } else {
                                                controller.addPackageToFirebase(
                                                    packageName: controller
                                                        .testNamecontrollre.text
                                                        .toString(),
                                                    testActualPrice: controller
                                                        .actualPriceController
                                                        .text
                                                        .toString(),
                                                    discountedPrice: controller
                                                        .piscountedPriceController
                                                        .text
                                                        .toString(),
                                                    testDescription: controller
                                                        .testDescriptioncontrollre
                                                        .text
                                                        .toString(),
                                                    turnaroundTime: controller
                                                        .turnaroundTimecontrollre
                                                        .text
                                                        .toString(),
                                                    samplecollectioninstruction:
                                                        controller
                                                            .sampleCollectionInstructioncontrollre
                                                            .text
                                                            .toString(),
                                                    sampleType: controller
                                                        .sampleTypecontrollre.text
                                                        .toString());
                                              }
                                            },
                                            btnName: "Add Package",
                                            bgColor: darkBlue,
                                            textcolor: whitecolor,
                                            btnSize: Size(150.w, 80.h))
                                      ],
                                    ),
                                    20.widthBox,
                                    GetBuilder<AddnewtestController>(
                                      builder: (_) => SizedBox(
                                        height: 300.h,
                                        width: 100.w,
                                        child: controller.image != null
                                            ? Image.memory(
                                                controller.image!,
                                                fit: BoxFit.cover,
                                              )
                                            : "Choose Image"
                                                .text
                                                .color(fullgrey)
                                                .fontFamily(montserratBold)
                                                .makeCentered(),
                                      )
                                          .box
                                          .roundedSM
                                          .outerShadow
                                          .clip(Clip.antiAlias)
                                          .color(verylightgrey)
                                          .make()
                                          .onTap(() {
                                        controller.pickImage();
                                      }),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )
                              .box
                              .white
                              .outerShadow
                              .rounded
                              .padding(padding12)
                              .make(),
                        ),
                        50.widthBox,
                        StreamBuilder(
                            stream: firebasefirestore
                                .collection(offerandDealscollection)
                                .snapshots(),
                            builder: (context,
                                AsyncSnapshot<QuerySnapshot> snapshot) {
                              if (!snapshot.hasData) {
                                return const Center(
                                  child: CircularProgressIndicator(
                                    color: darkBlue,
                                  ),
                                );
                              } else if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return const Center(
                                  child: CircularProgressIndicator(
                                    color: darkBlue,
                                  ),
                                );
                              } else if (snapshot.data!.docs.isEmpty) {
                                return emptycollection(
                                    text: "No test added yet.");
                              }
                              return Expanded(
                                child: GridView.builder(
                                    physics: bouncing,
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                            mainAxisSpacing: 4,
                                            crossAxisSpacing: 4,
                                            crossAxisCount: 4),
                                    itemCount: snapshot.data!.docs.length,
                                    itemBuilder: (contxt, index) {
                                      var data = snapshot.data!.docs[index];
                                      return Column(
                                        mainAxisAlignment: mainspar,
                                        crossAxisAlignment: crossstart,
                                        children: [
                                          "Package Name:"
                                              .text
                                              .fontFamily(montserratBold)
                                              .size(12.sp)
                                              .make(),
                                          data['packageName']
                                              .toString()
                                              .text
                                              .fontFamily(montserratRegular)
                                              .size(12.sp)
                                              .make(),
                                          "Sample Type:"
                                              .text
                                              .fontFamily(montserratBold)
                                              .size(12.sp)
                                              .make(),
                                          data['sampleType']
                                              .toString()
                                              .text
                                              .fontFamily(montserratRegular)
                                              .size(12.sp)
                                              .make(),
                                          "Turnaround Time:"
                                              .text
                                              .fontFamily(montserratBold)
                                              .size(12.sp)
                                              .make(),
                                          " ${data['turnaroundTime']}"
                                              .toString()
                                              .text
                                              .fontFamily(montserratRegular)
                                              .size(12.sp)
                                              .make(),
                                          "Price:"
                                              .text
                                              .fontFamily(montserratBold)
                                              .size(12.sp)
                                              .make(),
                                          "${data['discountedPrice']} pkr"
                                              .toString()
                                              .text
                                              .fontFamily(montserratRegular)
                                              .size(12.sp)
                                              .make(),
                                        ],
                                      )
                                          .box
                                          .outerShadow
                                          .white
                                          .padding(defaultPadding)
                                          .roundedSM
                                          .make()
                                          .onTap(() {
                                        controller.packageDetails = data;
                                        Get.to(() =>const PackageDetailsScreen());
                                      });
                                    }),
                              );
                            })
                      ],
                    ),
                    Obx(() => loadingWidget(controller.isloading.value))
                  ],
                ),
              ),
            ),
            // Tab 3 content
          ],
        ),
      ),
    ));
  }
}
