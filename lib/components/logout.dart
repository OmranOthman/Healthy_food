// ignore_for_file: use_super_parameters, prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:healthy_food/Core/const/app_assets.dart';
import 'package:healthy_food/core/const/app_colors.dart';

import '../core/const/app_fonts.dart';

class Logout extends GetxController {
  void showMyDailogLogout() {
    Get.dialog(
      Dialog(
        backgroundColor: Colors.transparent,
        elevation: 0,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(top: 20.h),
              width: 341.w,
              height: 254.h,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 60.h,
                  ),
                  Text(
                    'Oh no! You’re leaving...\nAre you sure?',
                    style: TextStyle(fontSize: 16.sp,
                        fontFamily: AppFonts.secondly_font),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 35.h,
                  ),
                  SizedBox(
                    width: 140.w,
                    height: 28.h,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        'No',
                        style: TextStyle(color: AppColors.color_font,fontSize: 13.sp,),
                      ),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.color_button),
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  SizedBox(
                    width: 140.w,
                    height: 28.h,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        'Yes,Log Me out',
                        style: TextStyle(color: AppColors.color_font,fontSize: 13.sp,),
                      ),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.color_button),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: -1.h,
              right: 125.w,
              child: Image.asset(
                AppAssets.logout,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
