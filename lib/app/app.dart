// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healthy_food/core/const/app_colors.dart';
import 'package:healthy_food/core/const/app_fonts.dart';
import 'package:healthy_food/view/authenticated_screen.dart';
import 'package:healthy_food/view/userDetails_screen.dart';
import 'package:healthy_food/view/forgetPassword.dart';
import 'package:healthy_food/view/home_screen.dart';
import 'package:healthy_food/view/login_screen.dart';
import 'package:healthy_food/view/signup_screen.dart';
import 'package:healthy_food/view/splash-screen.dart';
import 'package:get/get.dart';


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(393, 852),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            fontFamily: AppFonts.primary_font,
          ),
          home:SplashScreen(),
        );
      },
    );
  }
}

