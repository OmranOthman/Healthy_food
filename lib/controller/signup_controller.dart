// ignore_for_file: file_names, avoid_print

import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthy_food/components/wrongMessage.dart';
import 'package:healthy_food/model/signupModel.dart';
import 'package:healthy_food/view/authenticated_screen.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;



class SignupController extends GetxController {
  var image = Rxn<File>();
  var filePath = Rxn<String>();
  final picker = ImagePicker();
  final formKey = GlobalKey<FormState>();
  final userNameController = TextEditingController();
  final emailController = TextEditingController();
  final numberController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final WrongMessage wrongMessage = Get.put(WrongMessage());



  Future<void> signup() async {
    if (formKey.currentState!.validate()) {
      // Create an instance of SignupModel
      final signupModel = SignupModel(
        name: userNameController.text,
        phone: numberController.text,
        email: emailController.text,
        password: passwordController.text,
        profileImagePath: image.value?.path ?? '',
        pdfFilePath: filePath.value ?? '',
      );

      final request = http.MultipartRequest(
        'POST',
        Uri.parse('api'),
      );
      request.fields.addAll(signupModel.toJson());
      request.files.add(await http.MultipartFile.fromPath(
        'profile_image',
        signupModel.profileImagePath,
      ));
      request.files.add(await http.MultipartFile.fromPath(
        'pdf_file',
        signupModel.pdfFilePath,
      ));
      final response = await request.send();
      if (response.statusCode == 200) {
        // Handle success
        Get.snackbar('Success', 'Signup successful');
      } else {
        // Handle error
        Get.snackbar('Error', 'Signup failed');
      }
    }
  }


  Future getImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      image.value = File(pickedFile.path);
    } else {
      print('No image selected.');
    }
  }

  Future<void> pickAndUploadPdf() async {
    try {
      var result = await FilePicker.platform.pickFiles(
          type: FileType.custom, allowedExtensions: ['pdf']);
      if (result != null) {
        filePath.value = result.files.single.path;
        var response = await http.post(
          Uri.parse('YOUR_UPLOAD_URL'),
          body: {'pdf': filePath.value}, // Adjust body according to your server's requirements
        );
        print('Upload response: ${response.body}');
      }
    } catch (e) {
      print('Error picking or uploading PDF: $e');
    }
  }


  String? validateUserName(String? userName) {
    if (!GetUtils.isUsername(userName ?? '')) {
      return 'UserName is not valid';
    }
    return null;
  }
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
  String? validateConfirmPassword(String? confirmPassword) {
    if (confirmPassword == null || confirmPassword.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }
  void onSignup() {
    if (formKey.currentState!.validate()) {
      Get.to(AuthenticatedScreen());
    } else {
      wrongMessage.showMyDialog();
    }
  }
}