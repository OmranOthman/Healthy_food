// ignore_for_file: use_super_parameters, prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print, unnecessary_null_comparison
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:healthy_food/components/customButton.dart';
import 'package:healthy_food/components/textFormField.dart';
import 'package:healthy_food/controller/passwordVisible_controller.dart';
import 'package:healthy_food/controller/signup_controller.dart';
import 'package:healthy_food/core/const/app_assets.dart';
import 'package:healthy_food/core/const/app_colors.dart';
import 'package:healthy_food/core/const/app_fonts.dart';
import 'package:healthy_food/view/login_screen.dart';


class SignupScreen extends StatelessWidget {
  SignupScreen({Key? key}) : super(key: key);

  final SignupController signupController = Get.put(SignupController());
  final PasswordVisibleController passwordController = Get.put(PasswordVisibleController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.color_background,
      body: ListView(
        physics: BouncingScrollPhysics(
            decelerationRate: ScrollDecelerationRate.fast),
        children: [
          Column(
            children: [
              Image.asset(
                AppAssets.logo,
                height: 160.h,
              ),
              GestureDetector(
                onTap: signupController.getImage,
                child: Obx(() => CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.grey[200],
                  backgroundImage: signupController.image.value != null
                      ? FileImage(signupController.image.value!)
                      : null,
                  child: signupController.image.value == null
                      ? Icon(Icons.add_a_photo_outlined, size: 40)
                      : null,
                )),
              ),
              SizedBox(height: 20.h),
              Form(
                key: signupController.formKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 26.w),
                  child: Column(
                    children: [
                    ComponentTextFormField(
                    textAlign: TextAlign.start,
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.next,
                    obscureText: false,
                    hintText: 'Username',
                    suffixIcon: Icon(Icons.perm_identity_rounded,
                        color: AppColors.color_hintText),
                    controllers: signupController.userNameController,
                    validator: signupController.validateUserName,
                  ),
                  SizedBox(height: 20.h),
                  ComponentTextFormField(
                    textAlign: TextAlign.start,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    obscureText: false,
                    hintText: 'Email',
                    suffixIcon: Icon(
                        Icons.email, color: AppColors.color_hintText),
                    controllers: signupController.emailController,
                    validator: signupController.validateEmail,
                  ),
                  SizedBox(height: 20.h),
                  ComponentTextFormField(
                    textAlign: TextAlign.start,
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.next,
                    obscureText: false,
                    hintText: 'Mobile Number',
                    suffixIcon: Icon(
                        Icons.numbers, color: AppColors.color_hintText),
                    controllers: signupController.numberController,
                    validator: signupController.validateNumber,
                  ),
                  SizedBox(height: 20.h),
                  Obx(() =>
                      ComponentTextFormField(
                        textAlign: TextAlign.start,
                        keyboardType: TextInputType.name,
                        textInputAction: TextInputAction.next,
                        obscureText: !passwordController.isPasswordVisible
                            .value,
                        hintText: 'Password',
                        suffixIcon: GestureDetector(
                          onTap: () {
                            passwordController.togglePasswordVisibility();
                          },
                          child: Obx(() =>
                              Icon(
                                  passwordController.isPasswordVisible.value
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: AppColors.color_hintText
                              )),
                        ),
                        controllers: signupController.passwordController,
                        validator: signupController.validatePassword,
                      )),
                  SizedBox(height: 20.h),
                  Obx(() =>
                      ComponentTextFormField(
                        textAlign: TextAlign.start,
                        keyboardType: TextInputType.name,
                        textInputAction: TextInputAction.next,
                        obscureText: !passwordController.isPasswordVisible.value,
                        hintText: 'Password',
                        suffixIcon: GestureDetector(
                          onTap: () {
                            passwordController.togglePasswordVisibility();
                          },
                          child: Obx(() =>
                              Icon(
                                  passwordController.isPasswordVisible.value
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: AppColors.color_hintText
                              )),
                        ),
                        controllers: signupController.confirmPasswordController,
                        validator: signupController.validatePassword,
                      ),
                  )],),
                ),),
              SizedBox(height: 25.h),
              ElevatedButton.icon(
                onPressed: signupController.pickAndUploadPdf,
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      side: BorderSide(color: AppColors.color_hintText),
                      borderRadius: BorderRadius.circular(10.r)),
                  elevation: 0,
                  backgroundColor: AppColors.color_ComponentTextFormField,
                ),
                label: Directionality(
                  textDirection: TextDirection.ltr,
                  child: Text(
                    'Certificate PDF file ',
                    style: TextStyle(color: AppColors.color_hintText,fontFamily: AppFonts.secondly_font),
                  ),
                ),
                icon: Icon(
                  Icons.upload,
                  color: AppColors.color_hintText,
                ),
              ),
              SizedBox(height: 40.h),
              CustomButton(
                onPressed: () => signupController.onSignup(),
                color: AppColors.color_button,
                text: 'Sign up',
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have an account?',
                    style: TextStyle(
                        color: AppColors.color_font, fontSize: 12.sp,fontFamily: AppFonts.secondly_font),
                  ),
                  TextButton(
                    onPressed: () {
                      Get.to(LoginScreen());
                    },
                    child: Text(
                      'Log in',
                      style: TextStyle(
                          color: AppColors.color_button, fontSize: 12.sp,fontFamily: AppFonts.secondly_font),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 70.h,),
            ],
          ),
        ],
      ),
    );
  }
}



