// ignore_for_file: prefer_const_constructors, must_be_immutable, use_key_in_widget_constructors, library_private_types_in_public_api, prefer_const_constructors_in_immutables, file_names, prefer_typing_uninitialized_variables
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healthy_food/core/const/app_colors.dart';
import 'package:healthy_food/core/const/app_fonts.dart';

class CustomButton extends StatefulWidget {
  CustomButton({
     this.onPressed,
     this.color,
     this.text,
  });

  var onPressed;
  var color;
  var text;

  @override
  _CustomButtonState createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 38.h,
      width: 318.w,
      child: MaterialButton(
        onPressed: widget.onPressed,
        color: widget.color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
            side:
            BorderSide(color: AppColors.color_hintText),
        ),
        elevation: 0,

        child: Text(
          widget.text,
          style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
              color: AppColors.color_font,
          fontFamily: AppFonts.primary_font),
        ),
      ),
    );
  }
}
