import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../appConst/index.dart';


Widget appMainLogo({Color color=whitecolor, double width=100, double height=100}) {
  return Align(
    alignment: Alignment.topLeft,
    child: SizedBox(
      child: Image.asset(
        applogo,
        color: color,
      ),
    ).box.width(width.w).height(height.h).make(),
  );
}

Widget appMainLogoForDrawer() {
  return Align(
    alignment: Alignment.topLeft,
    child: SizedBox(
      child: Image.asset(
        drawerlogo,
        width: double.infinity,
      ),
    ).box.height(100.h).make(),
  );
}
