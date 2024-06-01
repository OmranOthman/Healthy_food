

// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:healthy_food/view/userDetails_screen.dart';


Widget textFieldOTP({required bool first, last}) {
  return Container(
    height: 39.h,
    width: 42.w,
    decoration: BoxDecoration(
      color: Colors.grey[200],
      shape: BoxShape.circle,
      border: Border.all(color: Colors.grey),
    ),
    child: AspectRatio(
      aspectRatio: 0.9,
      child: TextFormField(
        onFieldSubmitted: (value) { //عند الضغط على زر enter في الكيبورد يذهب الى HomeScreen
          Get.to(UserDetailsScreen());
        },
        autofocus: true,
        onChanged: (value) {
          if (value.length == 1 && last == false) {
            Get.focusScope?.nextFocus();
          }
          if (value.length == 0 && first == false) {
            Get.focusScope?.previousFocus();
          }
        },
        showCursor: false,
        readOnly: false,
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
        keyboardType: TextInputType.text,
        maxLength: 1,
        decoration: InputDecoration(
          border: InputBorder.none,
          counter: Offstage(),
          contentPadding: EdgeInsets.symmetric(vertical: 9.h,),
        ),
      ),
    ),
  );
}
