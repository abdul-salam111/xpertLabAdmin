import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../appConst/index.dart';
import 'index.dart';


Widget loadingWidget(value){
  return 
                 Visibility(
                    visible: value,
                    child: Center(
                      child: SizedBox(
                        height: 200.h,
                        width: 50.w,
                        child: Column(
                          mainAxisAlignment: maincenter,
                          crossAxisAlignment: crosscenter,
                          children: [
                            "Please Wait".text.fontFamily(montserratRegular).make(),
                            5.heightBox,
                            const CircularProgressIndicator(
                              color: darkBlue,
                            )
                          ],
                        ).box.outerShadow.white.border().padding(defaultPadding).roundedSM.make(),
                      ),
                    )
              );
}