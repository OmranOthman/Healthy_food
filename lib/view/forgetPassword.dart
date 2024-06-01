// ignore_for_file: use_super_parameters, prefer_const_constructors, unused_local_variable, use_key_in_widget_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:healthy_food/components/customButton.dart';
import 'package:healthy_food/components/textFormField.dart';
import 'package:healthy_food/controller/login_controller.dart';
import 'package:healthy_food/core/const/app_assets.dart';
import 'package:healthy_food/core/const/app_colors.dart';


class ForgetPassword extends StatelessWidget {
  ForgetPassword({Key? key}) : super(key: key);

  final LoginController loginController = Get.put(LoginController());
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
                  SizedBox(height: 120.h,),
                  CustomButton(text:'Send' ,color: AppColors.color_button,
                      onPressed: () {
                    loginController.onForget();


                      }),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
