import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:xpert_lab_admin/app/commonWidgets/builderconditions.dart';
import 'package:xpert_lab_admin/app/routes/app_pages.dart';
import '../../../../appConst/index.dart';
import '../../../commonWidgets/index.dart';
import '../controllers/active_bookings_controller.dart';

class ActiveBookingsView extends GetView<ActiveBookingsController> {
  const ActiveBookingsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              labelColor: darkBlue,
              tabs: [
                Tab(
                  icon: Image.asset(
                    addtest,
                    width: 40.w,
                    height: 40.h,
                    color: darkBlue,
                  ),
                  text: 'Active Bookings',
                ),
                Tab(
                    icon: Image.asset(
                      addpackageicon,
                      width: 40.w,
                      height: 40.h,
                      color: darkBlue,
                    ),
                    text: 'Active Packges'),
              ],
            ),
            automaticallyImplyLeading: true,
            actionsIconTheme: const IconThemeData(color: darkBlue),
            elevation: 2,
            title: Row(
              children: [
                appMainLogo(color: darkBlue, height: 90.h),
                Expanded(child: Container()),
                TextField(
                  cursorHeight: 25.h,
                  onChanged: (val) {
                    controller.searchingText.value = val;
                  },
                  style: const TextStyle(color: greenColor),
                  cursorColor: greyColor,
                  decoration: InputDecoration(
                      suffixIcon: const Icon(
                        Icons.search,
                        color: greyColor,
                      ),
                      isDense: true,
                      hintText: "Search By Id",
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
            padding: padding20,
            child: TabBarView(
              children: [
                Column(
                  crossAxisAlignment: crossstart,
                  children: [
                    "Active Bookings"
                        .text
                        .size(25.sp)
                        .fontFamily(montserratBold)
                        .color(fullgrey)
                        .make(),
                    20.heightBox,
                    StreamBuilder(
                        stream: firebasefirestore
                            .collection(bookingsCollection)
                            .snapshots(),
                        builder:
                            (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                          if (!snapshot.hasData) {
                            return const Center(child: CircularProgressIndicator(color: darkBlue,),);
                          } else if (snapshot.data!.docs.isEmpty) {
                            return emptycollection(
                                text: "No Bookings Available");
                          }
                          return GridView.builder(
                              physics: bouncing,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 5),
                              shrinkWrap: true,
                              itemCount: snapshot.data!.docs.length,
                              itemBuilder: (contxt, index) {
                                var data = snapshot.data!.docs[index];
                                return Obx(() {
                                  if (controller.searchingText.value.isEmpty) {
                                    return Column(
                                      mainAxisSize: masimin,
                                      crossAxisAlignment: crossstart,
                                      children: [
                                        Align(
                                          alignment: Alignment.topRight,
                                          child: OutlinedButton(
                                              onPressed: () {
                                                // var controller = Get.put(
                                                //     UploadReportsController());
                                                // controller
                                                //         .queryDocumentSnapshot =
                                                //     data;
                                                Get.toNamed(
                                                    Routes.UPLOAD_REPORTS,arguments: data);
                                              },
                                              child:
                                                  "View Booking".text.make()),
                                        ),
                                        20.heightBox,
                                        Row(
                                          children: [
                                            "Test Id:"
                                                .text
                                                .color(fullgrey)
                                                .size(20.sp)
                                                .fontFamily(montserratBold)
                                                .make(),
                                            5.widthBox,
                                            data['testBookingId']
                                                .toString()
                                                .text
                                                .color(fullgrey)
                                                .size(20.sp)
                                                .fontFamily(montserratMedium)
                                                .make(),
                                          ],
                                        ),
                                        10.heightBox,
                                        "Patient Name:"
                                            .text
                                            .color(fullgrey)
                                            .size(20.sp)
                                            .fontFamily(montserratBold)
                                            .make(),
                                        5.heightBox,
                                        data['added_By_Name']
                                            .toString()
                                            .text
                                            .color(fullgrey)
                                            .size(20.sp)
                                            .fontFamily(montserratMedium)
                                            .make(),
                                        10.heightBox,
                                        Row(
                                          children: [
                                            "Phone No:"
                                                .text
                                                .color(fullgrey)
                                                .size(20.sp)
                                                .fontFamily(montserratBold)
                                                .make(),
                                            5.widthBox,
                                            data['booked_By_Phone']
                                                .toString()
                                                .text
                                                .color(fullgrey)
                                                .size(20.sp)
                                                .fontFamily(montserratMedium)
                                                .make(),
                                          ],
                                        ),
                                        10.heightBox,
                                        "Booking Date & Time:"
                                            .text
                                            .color(fullgrey)
                                            .size(20.sp)
                                            .fontFamily(montserratBold)
                                            .make(),
                                        5.heightBox,
                                        "Date: ${DateFormat.yMEd().format(DateTime.parse(data['bookingDate']))} & Time ${data['bookingTime'].toString()}"
                                            .text
                                            .color(fullgrey)
                                            .size(20.sp)
                                            .fontFamily(montserratMedium)
                                            .make(),
                                      ],
                                    )
                                        .box
                                        .white
                                        .outerShadow
                                        .rounded
                                        .padding(padding16)
                                        .margin(defaultPadding)
                                        .make();
                                  }
                                  if (data['testBookingId'].toString().contains(
                                      controller.searchingText.value)) {
                                    return Column(
                                      mainAxisSize: masimin,
                                      crossAxisAlignment: crossstart,
                                      children: [
                                        Align(
                                          alignment: Alignment.topRight,
                                          child: OutlinedButton(
                                              onPressed: () {
                                                   Get.toNamed(
                                                    Routes.UPLOAD_REPORTS,arguments: data);
                                              },
                                              child:
                                                  "View Booking".text.make()),
                                        ),
                                        20.heightBox,
                                        Row(
                                          children: [
                                            "Test Id:"
                                                .text
                                                .color(fullgrey)
                                                .size(20.sp)
                                                .fontFamily(montserratBold)
                                                .make(),
                                            5.widthBox,
                                            data['testBookingId']
                                                .toString()
                                                .text
                                                .color(fullgrey)
                                                .size(20.sp)
                                                .fontFamily(montserratMedium)
                                                .make(),
                                          ],
                                        ),
                                        10.heightBox,
                                        "Patient Name:"
                                            .text
                                            .color(fullgrey)
                                            .size(20.sp)
                                            .fontFamily(montserratBold)
                                            .make(),
                                        5.heightBox,
                                        data['added_By_Name']
                                            .toString()
                                            .text
                                            .color(fullgrey)
                                            .size(20.sp)
                                            .fontFamily(montserratMedium)
                                            .make(),
                                        10.heightBox,
                                        Row(
                                          children: [
                                            "Phone No:"
                                                .text
                                                .color(fullgrey)
                                                .size(20.sp)
                                                .fontFamily(montserratBold)
                                                .make(),
                                            5.widthBox,
                                            data['booked_By_Phone']
                                                .toString()
                                                .text
                                                .color(fullgrey)
                                                .size(20.sp)
                                                .fontFamily(montserratMedium)
                                                .make(),
                                          ],
                                        ),
                                        10.heightBox,
                                        "Booking Date & Time:"
                                            .text
                                            .color(fullgrey)
                                            .size(20.sp)
                                            .fontFamily(montserratBold)
                                            .make(),
                                        5.heightBox,
                                        "Date: ${DateFormat.yMEd().format(DateTime.parse(data['bookingDate']))} & Time ${data['bookingTime'].toString()}"
                                            .text
                                            .color(fullgrey)
                                            .size(20.sp)
                                            .fontFamily(montserratMedium)
                                            .make(),
                                      10.heightBox,
                                     
                                      ],
                                    )
                                        .box
                                        .white
                                        .outerShadow
                                        .rounded
                                        .padding(padding16)
                                        .margin(defaultPadding)
                                        .make();
                                  } else {
                                    return const Center();
                                  }
                                });
                              });
                        }),
                  ],
                ),
                //second tab
                Column(
                  crossAxisAlignment: crossstart,
                  children: [
                    "Active Packages"
                        .text
                        .size(25.sp)
                        .fontFamily(montserratBold)
                        .color(fullgrey)
                        .make(),
                    20.heightBox,
                    StreamBuilder(
                        stream: controller.getAllPackages(),
                        builder:
                            (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                          if (!snapshot.hasData) {
                            return const Center(child: CircularProgressIndicator(color: darkBlue,),);
                          } else if (snapshot.data!.docs.isEmpty) {
                            return emptycollection(
                                text: "No Bookings Available");
                          }
                          return GridView.builder(
                              physics: bouncing,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 5),
                              shrinkWrap: true,
                              itemCount: snapshot.data!.docs.length,
                              itemBuilder: (contxt, index) {
                                var data = snapshot.data!.docs[index];
                                return Obx(() {
                                  if (controller.searchingText.value.isEmpty) {
                                    return Column(
                                      mainAxisSize: masimin,
                                      crossAxisAlignment: crossstart,
                                      children: [
                                        Align(
                                          alignment: Alignment.topRight,
                                          child: OutlinedButton(
                                              onPressed: () {
                                                 Get.toNamed(
                                                    Routes.UPLOAD_PACKAGE_REPORTS,arguments: data);
                                              },
                                              child:
                                                  "View Booking".text.make()),
                                        ),
                                        20.heightBox,
                                        Row(
                                          children: [
                                            "Test Id:"
                                                .text
                                                .color(fullgrey)
                                                .size(20.sp)
                                                .fontFamily(montserratBold)
                                                .make(),
                                            5.widthBox,
                                            data['bookingId']
                                                .toString()
                                                .text
                                                .color(fullgrey)
                                                .size(20.sp)
                                                .fontFamily(montserratMedium)
                                                .make(),
                                          ],
                                        ),
                                        10.heightBox,
                                        "Patient Name:"
                                            .text
                                            .color(fullgrey)
                                            .size(20.sp)
                                            .fontFamily(montserratBold)
                                            .make(),
                                        5.heightBox,
                                        data['booked_By_Name']
                                            .toString()
                                            .text
                                            .color(fullgrey)
                                            .size(20.sp)
                                            .fontFamily(montserratMedium)
                                            .make(),
                                        10.heightBox,
                                        Row(
                                          children: [
                                            "Phone No:"
                                                .text
                                                .color(fullgrey)
                                                .size(20.sp)
                                                .fontFamily(montserratBold)
                                                .make(),
                                            5.widthBox,
                                            data['booked_By_Phone']
                                                .toString()
                                                .text
                                                .color(fullgrey)
                                                .size(20.sp)
                                                .fontFamily(montserratMedium)
                                                .make(),
                                          ],
                                        ),
                                        10.heightBox,
                                        "Booking Date & Time:"
                                            .text
                                            .color(fullgrey)
                                            .size(20.sp)
                                            .fontFamily(montserratBold)
                                            .make(),
                                        5.heightBox,
                                        "Date: ${DateFormat.yMEd().format(DateTime.parse(data['bookingDate']))} & Time ${data['bookingTime'].toString()}"
                                            .text
                                            .color(fullgrey)
                                            .size(20.sp)
                                            .fontFamily(montserratMedium)
                                            .make(),
                                      ],
                                    )
                                        .box
                                        .white
                                        .outerShadow
                                        .rounded
                                        .padding(padding16)
                                        .margin(defaultPadding)
                                        .make();
                                  }
                                  if (data['bookingId'].toString().contains(
                                      controller.searchingText.value)) {
                                    return Column(
                                      mainAxisSize: masimin,
                                      crossAxisAlignment: crossstart,
                                      children: [
                                        Align(
                                          alignment: Alignment.topRight,
                                          child: OutlinedButton(
                                              onPressed: () {
                                                   Get.toNamed(
                                                    Routes.UPLOAD_PACKAGE_REPORTS,arguments: data);
                                              },
                                              child:
                                                  "View Booking".text.make()),
                                        ),
                                        20.heightBox,
                                        Row(
                                          children: [
                                            "Test Id:"
                                                .text
                                                .color(fullgrey)
                                                .size(20.sp)
                                                .fontFamily(montserratBold)
                                                .make(),
                                            5.widthBox,
                                            data['bookingId']
                                                .toString()
                                                .text
                                                .color(fullgrey)
                                                .size(20.sp)
                                                .fontFamily(montserratMedium)
                                                .make(),
                                          ],
                                        ),
                                        10.heightBox,
                                        "Patient Name:"
                                            .text
                                            .color(fullgrey)
                                            .size(20.sp)
                                            .fontFamily(montserratBold)
                                            .make(),
                                        5.heightBox,
                                        data['booked_By_Name']
                                            .toString()
                                            .text
                                            .color(fullgrey)
                                            .size(20.sp)
                                            .fontFamily(montserratMedium)
                                            .make(),
                                        10.heightBox,
                                        Row(
                                          children: [
                                            "Phone No:"
                                                .text
                                                .color(fullgrey)
                                                .size(20.sp)
                                                .fontFamily(montserratBold)
                                                .make(),
                                            5.widthBox,
                                            data['booked_By_Phone']
                                                .toString()
                                                .text
                                                .color(fullgrey)
                                                .size(20.sp)
                                                .fontFamily(montserratMedium)
                                                .make(),
                                          ],
                                        ),
                                        10.heightBox,
                                        "Booking Date & Time:"
                                            .text
                                            .color(fullgrey)
                                            .size(20.sp)
                                            .fontFamily(montserratBold)
                                            .make(),
                                        5.heightBox,
                                        "Date: ${DateFormat.yMEd().format(DateTime.parse(data['bookingDate']))} & Time ${data['bookingTime'].toString()}"
                                            .text
                                            .color(fullgrey)
                                            .size(20.sp)
                                            .fontFamily(montserratMedium)
                                            .make(),
                                      ],
                                    )
                                        .box
                                        .white
                                        .outerShadow
                                        .rounded
                                        .padding(padding16)
                                        .margin(defaultPadding)
                                        .make();
                                  } else {
                                    return const Center();
                                  }
                                });
                              });
                        }),
                  ],
                ),
              ],
            ),
          )),
    );
  }
}
