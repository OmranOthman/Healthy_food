// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:healthy_food/components/customButton.dart';
import 'package:healthy_food/core/const/app_colors.dart';
import 'package:healthy_food/view/home_screen.dart';
import '../controller/userDetails_controller.dart';

class UserDetailsScreen extends StatelessWidget {
  final UserDetailsController detailsController = Get.put(UserDetailsController(),permanent: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'UserDetails:',
                    style:
                        TextStyle(fontSize: 28.sp, fontWeight: FontWeight.bold),
                  )),
              Divider(height: 60.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Your Weight",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.sp,
                        color: AppColors.color_font),
                  ),
                  Obx(() => Text(
                        '${detailsController.weight.value.round()} km',
                        style: TextStyle(
                            fontSize: 15.sp, color: Color(0xFF8D8D8D)),
                      )),
                ],
              ),
              Obx(() => Slider(
                divisions: 170,
                    activeColor: AppColors.color_button,
                    thumbColor: Colors.white,
                    value: detailsController.weight.value,
                    min: 30,
                    max: 200,
                    onChanged: (newValue) {
                      detailsController.weight.value = newValue;
                    },
                  )),
              Divider(height: 90.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Your Length",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.sp,
                        color: AppColors.color_font),
                  ),
                  Obx(() => Text(
                        '${detailsController.length.value.round()} cm',
                        style: TextStyle(
                            fontSize: 15.sp, color: Color(0xFF8D8D8D)),
                      )),
                ],
              ),
              Obx(() => Slider(
                divisions: 120,
                    activeColor: AppColors.color_button,
                    thumbColor: Colors.white,
                    value: detailsController.length.value,
                    min: 120,
                    max: 240,
                    onChanged: (newValue) {
                      detailsController.length.value = newValue;
                    },
                  )),
              Divider(height: 90.h),
              Obx(() => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        height: 60.h,
                        width: 155.w,
                        decoration: BoxDecoration(
                          color: detailsController.isMale.value
                              ? AppColors.color_button
                              : Colors.white,
                          border: Border.all(
                            color: Color(0xFFF2B3B7),
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(15.r),
                          ),
                        ),
                        child: MaterialButton(
                          onPressed: () {
                            detailsController.isMale.value = true;
                          },
                          child: Text(
                            "Male",
                            style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold,
                              color: detailsController.isMale.value
                                  ? Colors.white
                                  : AppColors.color_button,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 60.h,
                        width: 155.w,
                        decoration: BoxDecoration(
                          color: !detailsController.isMale.value
                              ? AppColors.color_button
                              : Colors.white,
                          border: Border.all(
                            color: AppColors.color_button,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(15.r),
                          ),
                        ),
                        child: MaterialButton(
                          onPressed: () {
                            detailsController.isMale.value = false;
                          },
                          child: Text(
                            "Female",
                            style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold,
                              color: !detailsController.isMale.value
                                  ? Colors.white
                                  : AppColors.color_button,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )),
              Divider(height: 90.h),
              Row(
                children: [
                  Text(
                    "Your Birth",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.sp,
                        color: AppColors.color_font),
                  ),
                  Obx(() => CupertinoButton(
                      child: Text(
                          'birth:  ${detailsController.dateTime.value.month} _'
                          ' ${detailsController.dateTime.value.day} _'
                          ' ${detailsController.dateTime.value.year}'),
                      onPressed: () {
                        showCupertinoModalPopup(
                          context: context,
                          builder: (BuildContext context) => SizedBox(
                            height: 200.h,
                            width: double.infinity,
                            child: CupertinoDatePicker(
                              backgroundColor: AppColors.color_background,
                              initialDateTime: detailsController.dateTime.value,
                              onDateTimeChanged: (DateTime newTime) {
                                detailsController.updateDate(newTime);
                              },
                              use24hFormat: true,
                              mode: CupertinoDatePickerMode.date,
                            ),
                          ),
                        );
                      }))
                ],
              ),
              Divider(height: 90.h),
              CustomButton(
                onPressed: () {
                  Get.to(HomeScreen());
                },
                color: AppColors.color_button,
                text: 'Save',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
