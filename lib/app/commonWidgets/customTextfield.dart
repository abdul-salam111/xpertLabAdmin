import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../appConst/index.dart';
import 'index.dart';

Widget customTextFields(
    {TextEditingController? texteditingController,
    String? hintText,
    String? Label,
    IconData? prefixicon,
    TextInputType? keyboradType,
    String? borderType = "round"}) {
  return Column(
    crossAxisAlignment: crossstart,
    children: [
      Label!.text.white.size(15).make(),
      5.heightBox,
      TextFormField(
        controller: texteditingController,
        keyboardType: keyboradType,
        validator: (val) {
          if (val!.isEmpty) {
            return "Required*";
          }
          return null;
        },
        style: textfieldinputstyle,
        cursorColor: whitecolor,
        decoration: InputDecoration(
            prefixIcon: Icon(
              prefixicon,
              color: whitecolor,
            ),
            hintText: hintText,
            hintStyle: const TextStyle(color: whitecolor),
            alignLabelWithHint: true,
            enabledBorder:
                borderType == "round" ? enableborder : enableborderRec,
            focusedBorder: borderType == "round" ? focusborder : focusborderRec,
            errorBorder: borderType == "round" ? errorborder : errorBorderRec,
            border: borderType == "round" ? enableborder : errorBorderRec),
      ),
    ],
  );
}

Widget customTextFieldsForTests(
    {TextEditingController? texteditingController,
    String? hintText,
    String? Label,
    Widget? prefixicon,
    TextInputType? keyboradType,
    String? borderType = "rect"}) {
  return Column(
    crossAxisAlignment: crossstart,
    children: [
      Label!.text
          .color(fullgrey)
          .size(18.sp)
          .fontFamily(montserratSemibold)
          .make(),
      10.heightBox,
      TextFormField(
        controller: texteditingController,
        keyboardType: keyboradType,
        validator: (val) {
          if (val!.isEmpty) {
            return "Required*";
          }
          return null;
        },
        
        style: TextStyle(
            color: fullgrey,
            fontSize: 18.sp,
            letterSpacing: 0.5,
            fontFamily: montserratMedium),
        cursorColor: fullgrey,
        decoration: InputDecoration(
            fillColor: verylightgrey,
            filled: true,
            suffixIcon: prefixicon,
            hintText: hintText,
            hintStyle: TextStyle(
                color: fullgrey, fontSize: 15.sp, fontFamily: montserratMedium),
            enabledBorder:
                borderType == "round" ? enableborder : enableborderRec,
            focusedBorder: borderType == "round" ? focusborder : focusborderRec,
            errorBorder: borderType == "round" ? errorborder : errorBorderRec,
            border: borderType == "round" ? enableborder : errorBorderRec),
      ).box.outerShadow.clip(Clip.antiAlias).roundedSM.make(),
    ],
  );
}

Widget phoneTextField({texteditingController, String? borderType = "round"}) {
  return Column(
    crossAxisAlignment: crossstart,
    children: [
      Padding(
          padding: const EdgeInsets.only(left: 12, bottom: 5),
          child: Text(
            "phoneLabel",
            style: textfieldlabelStyle,
          )),
      SizedBox(
        height: 53,
        child: TextFormField(
          controller: texteditingController,
          maxLength: 11,
          keyboardType: TextInputType.phone,
          validator: (val) {
            if (val!.isEmpty) {
              return "Required*";
            }
            return null;
          },
          style: textfieldinputstyle,
          decoration: InputDecoration(
            prefixIcon: const Icon(
              Icons.phone,
              color: whitecolor,
            ),
            contentPadding: textfieldpadding,
            hintText: "phoneHint",
            alignLabelWithHint: true,
            enabledBorder:
                borderType == "round" ? enableborder : enableborderRec,
            focusedBorder: borderType == "round" ? focusborder : focusborderRec,
            errorBorder: borderType == "round" ? errorborder : errorBorderRec,
            border: borderType == "round" ? enableborder : enableborderRec,
          ),
        ),
      ),
    ],
  );
}

Widget commentBox(
    {TextEditingController? texteditingController,
    String? hintText,
    String? Label,
    TextInputType? keyboradType,
    String? borderType = "round"}) {
  return Column(
    crossAxisAlignment: crossstart,
    children: [
      Padding(
          padding: const EdgeInsets.only(left: 12, bottom: 5),
          child: Text(
            Label!,
            style: textfieldlabelStyle,
          )),
      TextFormField(
        minLines: 5,
        maxLines: 7,
        controller: texteditingController,
        keyboardType: keyboradType,
        validator: (val) {
          if (val!.isEmpty) {
            return "Required*";
          }
          return null;
        },
        style: textfieldinputstyle,
        decoration: InputDecoration(
            hintText: hintText,
            alignLabelWithHint: true,
            enabledBorder:
                borderType == "round" ? enableborder : enableborderRec,
            focusedBorder: borderType == "round" ? focusborder : focusborderRec,
            errorBorder: borderType == "round" ? errorborder : errorBorderRec,
            border: borderType == "round" ? enableborder : errorBorderRec),
      ),
    ],
  );
}

Widget customTextFieldsForReportsOnlyRead(
    {TextEditingController? texteditingController,

    String? Label,
    Widget? prefixicon,
    TextInputType? keyboradType,
    String? borderType = "rect"}) {
  return Column(
    crossAxisAlignment: crossstart,
    children: [
      Label!.text
          .color(fullgrey)
          .size(18.sp)
          .fontFamily(montserratSemibold)
          .make(),
      10.heightBox,
      TextFormField(
        controller: texteditingController,
        keyboardType: keyboradType,
        validator: (val) {
          if (val!.isEmpty) {
            return "Required*";
          }
          return null;
        },
        readOnly: true,
        style: TextStyle(
            color: darkBlue,
            fontSize: 18.sp,
            letterSpacing: 0.5,
            fontFamily: montserratMedium),
        cursorColor: fullgrey,
        decoration: InputDecoration(
            fillColor: verylightgrey,
            filled: true,
            suffixIcon: prefixicon,
           
            enabledBorder:
                borderType == "round" ? enableborder : enableborderRec,
            focusedBorder: borderType == "round" ? focusborder : focusborderRec,
            errorBorder: borderType == "round" ? errorborder : errorBorderRec,
            border: borderType == "round" ? enableborder : errorBorderRec),
      ).box.outerShadow.clip(Clip.antiAlias).roundedSM.make(),
    ],
  );
}
