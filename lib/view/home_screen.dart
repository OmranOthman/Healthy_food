// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_declarations, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, use_super_parameters, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:healthy_food/Core/const/app_assets.dart';
import 'package:healthy_food/controller/signup_controller.dart';
import 'package:healthy_food/controller/userDetails_controller.dart';
import 'package:healthy_food/core/const/app_colors.dart';
import '../components/category.dart';

class HomeScreen extends StatelessWidget {
  final SignupController signupController = Get.put(SignupController());
  final UserDetailsController detailsController = Get.put(UserDetailsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.color_background,
      appBar: AppBar(
        backgroundColor: AppColors.color_button,
        leading: IconButton(
          icon: Icon(
            Icons.notifications,
            color: Colors.yellowAccent,
            size: 33,
          ),
          onPressed: () {},
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(right: 55.w),
              child: Image(
                image: AssetImage(
                  AppAssets.logo,
                ),
                height: 130.h,
                width: 180.w,
              ),
            ),
          ],
        ),
        actions: <Widget>[

        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: <Widget>[
                Container(
                  child: Image.asset(
                    AppAssets.food,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(
                      top: 150.0.h, left: 40.0.w, right: 40.0.w, bottom: 10.0.h),
                  child: Material(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0.r)),
                    elevation: 5.0,
                    color: Colors.white,
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: 55.0.h,),
                        // Text(
                        //   "${signupController.userNameController.value}",
                        //   style: TextStyle(fontSize: 18.sp,fontWeight: FontWeight.bold),
                        // ),
                        SizedBox(height: 20.0.h,),
                        Container(
                          height: 75.0.h,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Expanded(
                                child: ListTile(
                                  title: Text(
                                    "${detailsController.weightPerfect(
                                        detailsController.isMale.value, detailsController.length.value)} kg",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  subtitle: Text("Perfect".toUpperCase(),
                                      textAlign: TextAlign.center,
                                      style: TextStyle(fontSize: 11.0.sp)),
                                ),
                              ),
                              Expanded(
                                child: ListTile(
                                  title: Text(
                                    "${detailsController.should()} kg",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(fontWeight: FontWeight.bold,backgroundColor: Colors.greenAccent),
                                  ),
                                  subtitle: Text("Target",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(fontSize: 20.0.sp)),
                                ),
                              ),
                              Expanded(
                                child: ListTile(
                                  title: Text(
                                    "${detailsController.weight.value.toStringAsFixed(1)} kg",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  subtitle: Text("Current".toUpperCase(),
                                      textAlign: TextAlign.center,
                                      style: TextStyle(fontSize: 11.0.sp)),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding:  EdgeInsets.only(top: 105.h),
                      child: Material(
                        elevation: 5.0,
                        shape: CircleBorder(),
                        child: GestureDetector(
                            onTap: () {},
                            child: CircleAvatar(
                              radius: 40.r,
                              backgroundColor: Colors.grey[300],
                              backgroundImage: signupController.image.value != null
                                  ? FileImage(signupController.image.value!)
                                  : null,
                              child: signupController.image.value == null
                                  ? Icon(Icons.add_a_photo_outlined, size: 22)
                                  : null,
                            ))
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 10.0,),
            Container(
              height: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(width: 15.0.w,),
                  Category(
                    backgroundColor: Colors.pink,
                    icon: Icons.hotel,
                    title: "Sleep",
                  ),
                  SizedBox(width: 15.0.w,),
                  Category(
                    backgroundColor: Colors.blue,
                    title: "Food",
                    icon: Icons.restaurant,
                  ),
                  SizedBox(width: 15.0.w,),
                  Category(
                    icon: Icons.offline_bolt,
                    backgroundColor: Colors.orange,
                    title: "Sport",
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.h,),
            Container(
              height: 50.h,
              width: double.infinity,
              color: Colors.yellowAccent,
            ),
            SizedBox(height: 20.h,),
            Container(
              height: 50.h,
              width: double.infinity,
              color: Colors.yellowAccent,
            ),
            SizedBox(height: 20.h,),
            Container(
              height: 50.h,
              width: double.infinity,
              color: Colors.yellowAccent,
            ),
          ],
        ),
      ),
    );
  }
}
