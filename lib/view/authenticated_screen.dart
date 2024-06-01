// ignore_for_file: library_private_types_in_public_api, prefer_const_constructors, sized_box_for_whitespace, prefer_is_empty, use_super_parameters, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthy_food/components/textFieldOTP.dart';
import 'package:healthy_food/controller/authenticated_controller.dart';
import '../Core/const/app_assets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class AuthenticatedScreen extends StatelessWidget {

  final AuthenticatedController authenticatedController = Get.put(AuthenticatedController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: GestureDetector(
                  onTap: () {Get.back();},
                  child: Icon(
                    Icons.arrow_back,
                    size: 32,
                    color: Colors.black12,
                  ),
                ),
              ),
              Image.asset(
                AppAssets.logo,
                height: 190.h,
              ),
              SizedBox(
                height: 15.h,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Verification Code',
                  style: TextStyle(
                    fontSize: 24.sp,
                  ),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "We have sent the verification code to your email address",
                  style: TextStyle(
                    fontSize: 22.sp,
                    color: Colors.black38,
                  ),
                ),
              ),
              SizedBox(
                height: 28.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  textFieldOTP(first: true, last: false),
                  SizedBox(
                    width: 4.w,
                  ),
                  textFieldOTP(first: false, last: false),
                  SizedBox(
                    width: 4.w,
                  ),
                  textFieldOTP(first: false, last: false),
                  SizedBox(
                    width: 4.w,
                  ),
                  textFieldOTP(first: false, last: false),
                  SizedBox(
                    width: 4.w,
                  ),
                  textFieldOTP(first: false, last: false),
                  SizedBox(
                    width: 4.w,
                  ),
                  textFieldOTP(first: false, last: true),
                ],
              ),
              SizedBox(
                height: 22.h,
              ),
              Obx(() {
                final minutes = authenticatedController.countdownTime ~/ 60;
                final seconds = authenticatedController.countdownTime % 60;
                return Text(
                  '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}',
                  style: TextStyle(fontSize: 18.sp),
                );
              }),
          Align(
            alignment: Alignment.centerLeft,
            child: TextButton(
              onPressed: () {},
              child: Text(
                "Send again",
                style: TextStyle(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black38,
                ),
              ),
            ),
          ),
            SizedBox(
                height: 18.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
