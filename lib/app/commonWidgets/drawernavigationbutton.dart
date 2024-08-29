import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../appConst/index.dart';
import 'index.dart';



Widget dNButton(
    {required String iconName, required String tabname, required onPressed}) {
  return Row(
    children: [
      10.widthBox,
     Image.asset(iconName,height: 30.h,color: darkBlue,),
      10.widthBox,
      tabname.text.size(20.sp).fontFamily(montserratMedium).make()
    ],
  )
      .box
      .white
      .outerShadow
      .withRounded(value: 50.r)
      .padding(defaultPadding)
      .margin(const EdgeInsets.fromLTRB(8, 30, 8,0))
      .make().onTap(onPressed);
     
}
