// ignore_for_file: use_super_parameters, prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:healthy_food/Core/const/app_assets.dart';
import 'package:healthy_food/core/const/app_colors.dart';
import 'package:healthy_food/view/home_screen.dart';

import '../core/const/app_fonts.dart';

class Success extends GetxController {
  void showMyBottomSheet() {
    Get.bottomSheet(
      isDismissible: false,
      Container(
        width: 393.w,
        height: 375.h,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.r), topRight: Radius.circular(20.r)),
        ),
        child: Column(
          children: [
            SizedBox(
              height: 14.h,
            ),
            Image.asset(AppAssets.success),
            Text(
              'Success!',
              style:
                  TextStyle(fontSize: 22.sp, color: AppColors.color_background,fontFamily: AppFonts.secondly_font),
            ),
            SizedBox(
              height: 22.h,
            ),
            Text(textAlign: TextAlign.center,
              'Congratulations! You have been\nsuccessfully authenticated',
              style: TextStyle(
                fontSize: 18.sp,fontFamily: AppFonts.secondly_font,
                color: Color(0xFFB6B6B6),
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
            SizedBox(
              width: 168.w,
              height: 33.h,
              child: ElevatedButton(
                onPressed: () {
                  Get.to(HomeScreen());
                },
                child: Text(
                  'Continue',
                  style: TextStyle(color: AppColors.color_font),
                ),
                style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.color_button),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
