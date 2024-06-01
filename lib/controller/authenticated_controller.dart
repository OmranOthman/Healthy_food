import 'package:get/get.dart';

class AuthenticatedController extends GetxController {
  RxInt countdownTime = 180.obs;

  void startCountdown() {
    Future.delayed(Duration(seconds: 1), () {
      if (countdownTime > 0) {
        countdownTime--;
        startCountdown();
      }
    });
  }

  @override
  void onInit() {
    super.onInit();
    startCountdown();
  }
}