// ignore_for_file: use_super_parameters, prefer_const_constructors, unused_local_variable, use_key_in_widget_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:healthy_food/components/customButton.dart';
import 'package:healthy_food/components/textFormField.dart';
import 'package:healthy_food/controller/login_controller.dart';
import 'package:healthy_food/controller/passwordVisible_controller.dart';
import 'package:healthy_food/core/const/app_assets.dart';
import 'package:healthy_food/core/const/app_colors.dart';
import 'package:healthy_food/view/forgetPassword.dart';
import 'package:healthy_food/view/signup_screen.dart';
import 'package:get_storage/get_storage.dart';

import '../core/const/app_fonts.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final LoginController loginController = Get.put(LoginController());
  final PasswordVisibleController passwordController = Get.put(PasswordVisibleController());
  var storage = GetStorage();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.color_background,
      body: ListView(
        physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        children: [
          Image.asset(AppAssets.logo),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 26.w),
            child: Form(
              key: loginController.formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                children: [
                  ComponentTextFormField(
                    textAlign: TextAlign.start,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    obscureText: false,
                    hintText: 'email',
                    suffixIcon: Icon(
                      Icons.note_alt_outlined,
                      color: AppColors.color_hintText,
                    ),
                    controllers: loginController.emailController,
                    validator: loginController.validateEmail,
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  ComponentTextFormField(
                    textAlign: TextAlign.start,
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.next,
                    obscureText: false,
                    hintText: 'Mobile Number',
                    suffixIcon: Icon(
                      Icons.numbers,
                      color: AppColors.color_hintText,
                    ),
                    controllers: loginController.numberController,
                    validator: loginController.validateNumber,
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
              Obx(() => ComponentTextFormField(
                textAlign: TextAlign.start,
                keyboardType: TextInputType.name,
                textInputAction: TextInputAction.next,
                obscureText: !passwordController.isPasswordVisible.value,
                hintText: 'Password',
                suffixIcon: GestureDetector(
                  onTap: () {
                    passwordController.togglePasswordVisibility();
                  },
                  child: Obx(() => Icon(
                      passwordController.isPasswordVisible.value
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: AppColors.color_hintText
                  )),
                ),
                controllers: loginController.passwordController,
                validator: loginController.validatePassword,
              ),
              ),
                  SizedBox(
                    height: 25.h,
                  ),
                  CustomButton(
                      onPressed: () => loginController.onLogin(),
                      color: AppColors.color_button,
                      text: 'Log in'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            backgroundColor:
                                AppColors.color_background,
                          ),
                          onPressed: () {},
                          icon: Icon(
                            Icons.check_circle_outline,
                            color: AppColors.color_font,
                          ),
                          label: Text(
                            'Remember me',
                            style: TextStyle(
                                color: AppColors.color_font, fontSize: 13.sp),
                          )),
                      TextButton(
                          onPressed: () {
                            Get.to(ForgetPassword());
                          },
                          child: Text(
                            'Forget Password?',
                            style: TextStyle(
                                color: AppColors.color_font, fontSize: 14.sp,fontFamily: AppFonts.secondly_font),
                          ))
                    ],
                  ),
                  SizedBox(
                    height: 80.h,
                  ),
                  CustomButton(
                    onPressed: () {
                      Get.to(SignupScreen());
                    },
                    color: AppColors.color_ComponentTextFormField,
                    text: 'Create new account',
                  ),
                  SizedBox(height: 70.h,),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
