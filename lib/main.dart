import 'package:flutter/material.dart';
import 'package:healthy_food/app/app.dart';
import 'package:get_storage/get_storage.dart';


Future<void> main() async {
  await GetStorage.init();
  runApp(const MyApp());
}