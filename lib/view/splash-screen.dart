// ignore_for_file: prefer_const_constructors, use_super_parameters

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthy_food/core/const/app_assets.dart';
import '../controller/splash-controller.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({Key? key}) : super(key: key);

  final SplashController controller = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Image(
          image: AssetImage(AppAssets.logo),
        ),
      ),
    );
  }
}
