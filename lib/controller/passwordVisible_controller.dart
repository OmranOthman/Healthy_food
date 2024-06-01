import 'package:get/get.dart';

class PasswordVisibleController extends GetxController {
  var isPasswordVisible = false.obs;

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }
}