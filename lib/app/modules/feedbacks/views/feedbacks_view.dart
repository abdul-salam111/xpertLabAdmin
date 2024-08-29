import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:xpert_lab_admin/app/commonWidgets/builderconditions.dart';
import 'package:xpert_lab_admin/app/commonWidgets/index.dart';
import 'package:xpert_lab_admin/app/modules/feedbacks/views/viewFullFeedback.dart';
import 'package:xpert_lab_admin/appConst/index.dart';

import '../controllers/feedbacks_controller.dart';

class FeedbacksView extends GetView<FeedbacksController> {
  const FeedbacksView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          backgroundColor: darkBlue,
          title: const Text('Feedbacks'),
          centerTitle: true,
        ),
        body: FutureBuilder(
            future: controller.getAllFeedBacks(),
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
                return emptycollection(text: "No feedbacks is submitted yet.");
              } else {
                return GridView.builder(
                    physics: bouncing,
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 5, mainAxisExtent: 400.h),
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      var data = snapshot.data!.docs[index];
                      return Column(
                        crossAxisAlignment: crossstart,
                        children: [
                          Align(
                              alignment: Alignment.topRight,
                              child: OutlinedButton(
                                  onPressed: () {
                                    Get.put(FeedbacksController())
                                        .feedbackDetails = data;
                                    Get.to(() => const ViewFullFeedback());
                                  },
                                  child: const Text("View feedback"))),
                          "Email:"
                              .text
                              .fontFamily(montserratBold)
                              .color(fullgrey)
                              .size(20.sp)
                              .make(),
                          10.heightBox,
                          data['rated_By_Email']
                              .toString()
                              .text
                              .fontFamily(montserratMedium)
                              .size(20.sp)
                              .color(fullgrey)
                              .make(),
                          15.heightBox,
                          "Feedback:"
                              .text
                              .fontFamily(montserratBold)
                              .color(fullgrey)
                              .size(20.sp)
                              .make(),
                          10.heightBox,
                          data['addition_Remarks']
                              .toString()
                              .text
                              .fontFamily(montserratMedium)
                              .size(20.sp)
                              .color(fullgrey)
                              .maxLines(4)
                              .overflow(TextOverflow.ellipsis)
                              .make(),
                          15.heightBox,
                          "Ratings:"
                              .text
                              .fontFamily(montserratBold)
                              .color(fullgrey)
                              .size(20.sp)
                              .make(),
                          5.heightBox,
                          RatingBar.builder(
                            initialRating: data['rating'],
                            minRating: 1,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemPadding:
                                const EdgeInsets.symmetric(horizontal: 4.0),
                            itemBuilder: (context, _) => const Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            itemSize: 20,
                            glow: false,
                            tapOnlyMode: true,
                            onRatingUpdate: (rating) {},
                          )
                        ],
                      )
                          .box
                          .padding(padding16)
                          .margin(defaultPadding)
                          .white
                          .outerShadow
                          .rounded
                          .make();
                    });
              }
            }));
  }
}
