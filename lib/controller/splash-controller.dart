import 'dart:async';
import 'package:get/get.dart';
import 'package:healthy_food/view/login_screen.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    navigateToLogin();
  }

  void navigateToLogin() {
    Timer(const Duration(seconds: 4), () => Get.to(LoginScreen()));
  }
}
