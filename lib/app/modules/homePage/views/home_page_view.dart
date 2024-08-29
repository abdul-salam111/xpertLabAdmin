import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../appConst/index.dart';
import '../../../commonWidgets/index.dart';
import '../../../routes/app_pages.dart';
import '../../index.dart';

class HomePageView extends GetView<HomePageController> {
  const HomePageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: SizedBox(
          width: 90.w,
          child: Drawer(
            child: Column(
              children: [
                appMainLogoForDrawer(),
                Divider(
                  height: 50.h,
                ),
                dNButton(iconName: homeicon, tabname: "Home", onPressed: () {}),
                 dNButton(
                    iconName: bookingicon,
                    tabname: "Active Bookings",
                    onPressed: () {
                      Get.toNamed(Routes.ACTIVE_BOOKINGS);
                    }),
                dNButton(
                    iconName: addtest,
                    tabname: "Add New Test",
                    onPressed: () {
                      Get.toNamed(Routes.ADDNEWTEST);
                    }),
                dNButton(
                    iconName: addnewtestCategory,
                    tabname: "Add Category",
                    onPressed: () {
                      Get.toNamed(Routes.ADD_CATEGORY);
                    }),
               
              
                dNButton(
                    iconName: feedbacks,
                    tabname: "Feedbacks",
                    onPressed: () {
                      Get.toNamed(Routes.FEEDBACKS);
                    }),
                Expanded(child: Container()),
                
                dNButton(iconName: logout, tabname: "Logout", onPressed: () {
                  Get.offAndToNamed(Routes.SIGNIN);
              
                }),
                20.heightBox
              ],
            ),
          ),
        ).box.clip(Clip.antiAlias).rightRounded(value: 20.r).make(),
        backgroundColor: whitecolor,
        appBar: AppBar(
          elevation: 2,
          title: Row(
            children: [
              appMainLogo(color: darkBlue, height: 90.h),
              Expanded(child: Container()),
              TextField(
                cursorHeight: 25.h,
                style: const TextStyle(color: greenColor),
                cursorColor: greyColor,
                decoration: InputDecoration(
                    suffixIcon: const Icon(
                      Icons.search,
                      color: greyColor,
                    ),
                    isDense: true,
                    hintText: "What are you looking for?",
                    hintStyle: const TextStyle(color: greyColor),
                    fillColor: whitecolor,
                    filled: true,
                    hoverColor: whitecolor,
                    border: InputBorder.none,
                    focusColor: greyColor,
                    focusedBorder: enableborderforsearch,
                    enabledBorder: enableborderforsearch),
              )
                  .box
                  .outerShadowMd
                  .clip(Clip.antiAlias)
                  .width(200.w)
                  .height(50.h)
                  .rounded
                  .make(),
              Expanded(child: Container()),
            ],
          ),
          actions: [
            Padding(
              padding: defaultPadding,
              child: CircleAvatar(
                child: Image.asset(applogo),
              ),
            )
          ],
          iconTheme: const IconThemeData(color: darkBlue),
          backgroundColor: whitecolor,
        ),
        body: Padding(
          padding: const EdgeInsets.all(50),
          child: Column(
            crossAxisAlignment: crossstart,
            children: [
              20.heightBox,
              "Welcome Back"
                  .text
                  .fontFamily(montserratRegular)
                  .size(30.sp)
                  .make(),
              5.heightBox,
              "Danish!".text.fontFamily(montserratBold).size(35.sp).make(),
              20.heightBox,
            ]))
    );
  }
}
