// ignore_for_file: use_super_parameters, prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:healthy_food/Core/const/app_assets.dart';
import 'package:healthy_food/core/const/app_colors.dart';

import '../core/const/app_fonts.dart';


class Fuls extends GetxController {
  void showMyDailogFuls() {
    Get.dialog(
      Dialog(
        child: SizedBox(
          width: 341.w,
          height: 254.h,
          child: Column(
              children: [SizedBox(height: 10.h,),
                Image.asset(
                  AppAssets.frame,
                ),
                SizedBox(height: 18.h,),
                Text('Sorry!',style: TextStyle(fontSize: 32.sp,fontFamily: AppFonts.secondly_font),),
                Text('Incorrect password or email',style: TextStyle(fontSize: 20.sp ,fontFamily: AppFonts.secondly_font),),
              ]
          ),
        ),
      ),
    );
  }
}

