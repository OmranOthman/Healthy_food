// ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api, camel_case_types, prefer_const_constructors, prefer_typing_uninitialized_variables, non_constant_identifier_names, must_be_immutable, file_names, use_super_parameters

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healthy_food/core/const/app_colors.dart';
import 'package:healthy_food/core/const/app_fonts.dart';

class ComponentTextFormField extends StatelessWidget {
  ComponentTextFormField({
    Key? key,
    this.textAlign,
    this.keyboardType,
    this.textInputAction,
    this.hintText,
    this.suffixIcon,
    this.validator,
    this.onChanged,
    this.onSaved,
    this.controllers,
    required this.obscureText,
  }) : super(key: key);

  var textAlign;
  var keyboardType;
  var textInputAction;
  var hintText;
  final Widget? suffixIcon;
  var controllers;
  bool obscureText;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;
  final void Function(String?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(

      textAlign: textAlign,
      cursorWidth: 0.5,
      obscureText: obscureText,
      controller: controllers,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      validator: validator,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      cursorErrorColor: Colors.red,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        filled: true,
        fillColor: Colors.white,
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.r),
            borderSide: BorderSide(color: Color(0xFFD7DDDB))),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.r),
            borderSide: BorderSide(color: Color(0xFFD7DDDB))),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.r),
            borderSide: BorderSide(color: Colors.red)),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.r),
          borderSide: BorderSide(color: Color(0xFFD7DDDB)),
        ),
        hintText: hintText,
        hintStyle: TextStyle(color: AppColors.color_hintText,
            fontFamily: AppFonts.secondly_font),
        contentPadding: EdgeInsets.symmetric(horizontal: 12),
      ),
      style: TextStyle(
          fontWeight: FontWeight.normal,
          color: AppColors.color_font,
          fontSize: 16.sp,
          fontFamily: AppFonts.secondly_font),
    );
  }
}
