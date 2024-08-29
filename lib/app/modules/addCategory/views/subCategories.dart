import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:xpert_lab_admin/app/modules/addCategory/views/testDetails.dart';

import 'package:xpert_lab_admin/app/modules/index.dart';

import '../../../../appConst/index.dart';
import '../../../commonWidgets/builderconditions.dart';
import '../../../commonWidgets/index.dart';

class SubCategories extends GetView<AddCategoryController> {
  const SubCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          backgroundColor: darkBlue,
          title: Text(controller.selectedTestCategoryForDelete.value),
          centerTitle: true,
        ),
        body: FutureBuilder(
            future: firebasefirestore
                .collection(testCategoriesCollection)
                .doc(controller.selectedTestCategoryForDelete.value)
                .collection(testSubCategoryCollection)
                .get(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: darkBlue,
                  ),
                );
              } else if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: darkBlue,
                  ),
                );
              } else if (snapshot.data!.docs.isEmpty) {
                return emptycollection(text: "No test added yet.");
              }
              return Padding(
                padding: padding20,
                child: GridView.builder(
                    physics: bouncing,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            mainAxisSpacing: 4,
                            crossAxisSpacing: 4,
                            crossAxisCount: 7),
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
                          "${data['testPrice']} pkr"
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
                        controller.testDetails = data;
                        Get.to(() => TestDetails());
                      });
                    }),
              );
            }));
  }
}
