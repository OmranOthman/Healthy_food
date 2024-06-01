// ignore_for_file: use_super_parameters, prefer_const_constructors, sort_child_properties_last, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:healthy_food/Core/const/app_assets.dart';
import 'package:healthy_food/core/const/app_colors.dart';

class WrongMessage extends GetxController {
  void showMyDialog() {
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
              height: 274.h,
              decoration: BoxDecoration(
                color: Colors.white,
              borderRadius:BorderRadius.circular(20.0),),
              child: Column(
                children: [
                  SizedBox(
                    height: 90.h,
                  ),
                  Text(
                    'Oh no!',
                    style: TextStyle(fontSize: 20.sp),
                  ),
                  Text(
                    textAlign: TextAlign.center,
                    'Something went wrong.\nPlease try again.',
                    style: TextStyle(fontSize: 16.sp),
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  SizedBox(
                    width: 113.w,
                    height: 28.h,
                    child: ElevatedButton(
                      onPressed: () {
                        Get.back();
                      },
                      child: Text(
                        'Try again',
                        style: TextStyle(color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.color_font),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: -1.h,
              right: 125.w,
              child: Image.asset(
                AppAssets.cross,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
