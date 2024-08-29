import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:xpert_lab_admin/app/commonWidgets/builderconditions.dart';
import 'package:xpert_lab_admin/app/modules/addCategory/views/subCategories.dart';
import '../../../../appConst/index.dart';
import '../../../commonWidgets/index.dart';
import '../../index.dart';

class AddCategoryView extends GetView<AddCategoryController> {
  const AddCategoryView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          backgroundColor: darkBlue,
          title: const Text(addnewcategory),
          centerTitle: true,
        ),
        body: Row(
          mainAxisSize: masimin,
          mainAxisAlignment: mainstart,
          crossAxisAlignment: crossstart,
          children: [
            20.widthBox,
            SizedBox(
              width: 200.w,
              child: Stack(
                children: [
                  Padding(
                    padding: padding20,
                    child: Column(
                      mainAxisAlignment: maincenter,
                      crossAxisAlignment: crossstart,
                      children: [
                        addnewcategory.text
                            .size(25.sp)
                            .color(fullgrey)
                            .fontFamily(montserratBold)
                            .makeCentered(),
                        50.heightBox,
                        customTextFieldsForTests(
                            texteditingController:
                                controller.categoryController,
                            Label: categoryname,
                            hintText: categorynamehint),
                        20.heightBox,
                        categoryimage.text
                            .fontFamily(montserratBold)
                            .color(fullgrey)
                            .size(15.sp)
                            .make(),
                        10.heightBox,
                        GetBuilder<AddCategoryController>(
                          builder: (_) => SizedBox(
                            height: 300.h,
                            child: controller.image != null
                                ? Image.memory(
                                    controller.image!,
                                    fit: BoxFit.cover,
                                  )
                                : selectcatimg.text
                                    .fontFamily(montserratRegular)
                                    .color(fullgrey)
                                    .makeCentered(),
                          )
                              .box
                              .roundedSM
                              .outerShadow
                              .color(verylightgrey)
                              .make()
                              .onTap(() => controller.pickImage()),
                        ),
                        20.heightBox,
                        Center(
                          child: customButton(
                              onPress: () async {
                                if (controller.image != null) {
                                  controller.addCategoryToFirebase(
                                      CategoryName: controller
                                          .categoryController.text
                                          .toString());
                                }
                              },
                              btnName: addnewcategory,
                              bgColor: darkBlue,
                              textcolor: whitecolor,
                              btnSize: Size(70.w, 70.h)),
                        ),
                      ],
                    ).box.padding(padding16).rounded.outerShadow.white.make(),
                  ),
                  Obx(() => loadingWidget(controller.isloading.value))
                ],
              ),
            ),
            StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection(testCategoriesCollection)
                  .snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) {
                  return error();
                } else if (!snapshot.hasData) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.data!.docs.isEmpty) {
                  return emptycollection();
                }

                // Process the data here and return your desired UI
                return Padding(
                  padding: padding20,
                  child: SizedBox(
                    height: double.infinity,
                    width: 400.w,
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          mainAxisExtent: 300.h, crossAxisCount: 4),
                      shrinkWrap: true,
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        final categoryData = snapshot.data!.docs[index];

                        return Column(
                          mainAxisSize: masimin,
                          crossAxisAlignment: crossstart,
                          children: [
                            CachedNetworkImage(
                              imageUrl: categoryData['category_Image'],
                              height: 150.h,
                              width: 100.w,
                            ),
                            20.heightBox,
                            categoryData['category_Name']
                                .toString()
                                .text
                                .color(fullgrey)
                                .fontFamily(montserratBold)
                                .size(25.sp)
                                .make(),
                          ],
                        )
                            .box
                            .padding(defaultPadding)
                            .white
                            .outerShadow
                            .margin(defaultPadding)
                            .roundedSM
                            .make()
                            .onTap(() {
                          controller.selectedTestCategoryForDelete.value =
                              categoryData['category_Name'].toString();
                              Get.to(()=>SubCategories());
                        });
                      },
                    ),
                  ),
                );
              },
            ),
            10.widthBox
          ],
        ));
  }
}
