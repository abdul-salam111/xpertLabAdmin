import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../appConst/index.dart';

Widget customButton(
    {required onPress,
    required String btnName,
    Color bgColor = bluecolor,
    Color textcolor = whitecolor,
    Size? btnSize}) {
  return ElevatedButton(
    onPressed: onPress,
    style: ElevatedButton.styleFrom(
        shape: const StadiumBorder(),
        backgroundColor: bgColor,
        minimumSize: btnSize),
    child: btnName.text
        .color(textcolor)
        .letterSpacing(0.5)
        .wordSpacing(0.5)
        .size(17)
        .semiBold
        .make(),
  );
}

Widget customButtonOutlined(
    {required onPress,
    required String btnName,
    Color textcolor = whitecolor,
    int? textSize = 17,
    Size? btnSize}) {
  return OutlinedButton(
    onPressed: onPress,
    style: OutlinedButton.styleFrom(minimumSize: btnSize),
    child: btnName.text
        .color(textcolor)
        .letterSpacing(0.5)
        .wordSpacing(0.5)
        .size(15)
        .semiBold
        .make(),
  );
}

Widget customButtonRec(
    {required onPress,
    required String btnName,
    Color bgColor = bluecolor,
    Color textcolor = whitecolor,
    Size? btnSize}) {
  return ElevatedButton(
    onPressed: onPress,
    style: ElevatedButton.styleFrom(
        backgroundColor: bgColor, minimumSize: btnSize),
    child: btnName.text.color(textcolor).size(15).make(),
  );
}
