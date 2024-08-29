import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../appConst/index.dart';

Widget error() {
  return Center(
    child:
        errorOcurred.text.size(15.sp).fontFamily(montserratBold).makeCentered(),
  );
}

Widget wait() {
  return Center(
      child: Text(
    "Please wait...",
    style: TextStyle(fontFamily: montserratBold, fontSize: 15.sp),
  ));
}

Widget emptycollection( {String?text=nocategoryFound} ) {
  return Center(
      child:
          text.toString().text.fontFamily(montserratBold).size(15.sp).make());
}
