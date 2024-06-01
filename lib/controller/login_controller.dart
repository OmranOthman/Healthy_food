// ignore_for_file: file_names, avoid_print, prefer_const_constructors


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:healthy_food/components/fuls.dart';
import 'package:healthy_food/view/authenticated_screen.dart';
import 'package:healthy_food/view/home_screen.dart';


class LoginController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final numberController = TextEditingController();
  final passwordController = TextEditingController();
  final Fuls fuls = Get.put(Fuls());

  String? validateEmail(String? email) {
    if (!GetUtils.isEmail(email ?? '')) {
      return 'Email is not valid';
    }
    return null;
  }
  String? validateNumber(String? number) {
    if (!GetUtils.isPhoneNumber(number ?? '')) {
      return 'Number is not valid';
    }
    return null;
  }
  String? validatePassword(String? password) {
    if (password == null || password.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }
  void onLogin() {
    if (formKey.currentState!.validate()) {
      Get.to(HomeScreen());
    } else {
      fuls.showMyDailogFuls();
    }
  }
    void onForget() {
      if (formKey.currentState!.validate()) {
        Get.snackbar('Success', 'The verification code was sent to email');
        Future.delayed(Duration(seconds: 3),(){
          Get.to(AuthenticatedScreen());
        });
      } else {
        Get.snackbar('Failed', 'Please enter appropriate');
      }
    }
  }
