import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:xpert_lab_admin/app/commonWidgets/index.dart';
import 'package:xpert_lab_admin/app/modules/index.dart';
import 'package:xpert_lab_admin/appConst/index.dart';

class ViewFullFeedback extends GetView<FeedbacksController> {
  const ViewFullFeedback({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:"Feedback Screen".text.white.make(),
        automaticallyImplyLeading: true,
        backgroundColor: darkBlue,
        iconTheme: const IconThemeData(color: whitecolor),
      ),
      body: Padding(
        padding: padding20,
        child: Column(
          crossAxisAlignment: crossstart ,
          children: [
            "Email:"
                .toString()
                .text
                .fontFamily(montserratBold)
                .size(20.sp)
                .make(),
            10.heightBox,
            controller.feedbackDetails!['rated_By_Email']
                .toString()
                .text
                .fontFamily(montserratMedium)
                .size(20.sp)
                .make(),
            20.heightBox,
            "Feedback"
                .toString()
                .text
                .fontFamily(montserratBold)
                .size(20.sp)
                .make(),
            10.heightBox,
            controller.feedbackDetails!['addition_Remarks']
                .toString()
                .text
                .fontFamily(montserratMedium)
                .size(20.sp)
                .make(),
            20.heightBox,
            "Ratings:"
                .toString()
                .text
                .fontFamily(montserratBold)
                .size(20.sp)
                .make(),
            10.heightBox,
            RatingBar.builder(
              initialRating: controller.feedbackDetails!['rating'],
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
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
        ).box.padding(padding20).white.outerShadow.rounded.make(),
      ),
    );
  }
}
