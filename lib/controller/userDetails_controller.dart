// ignore_for_file: file_names

import 'package:get/get.dart';
import 'dart:math';

class UserDetailsController extends GetxController {
  var weight = 50.0.obs;
  var weightMan = 50.0.obs;
  var weightWoman = 50.0.obs;
  var length = 140.0.obs;
  var result = 0.0.obs;
  var isMale = true.obs;
  var dateTime = DateTime(1990,1,1,).obs;

  void updateDate(DateTime newTime) {
    dateTime.value = newTime;
  }

  double weightPerfect(bool isMale, double length) {
    if (isMale == true) {
      double weightMan = ((length - 152) * 1.1) + 48;
      return weightMan.roundToDouble();
    } else {
      double weightWoman = ((length - 152) * 0.9) + 45;
      return weightWoman.roundToDouble();
    }
  }

  double should(){
    return weight.value.roundToDouble()-
        weightPerfect(isMale.value,length.value).roundToDouble();
  }

}



// class CalculatorBrain {
//   CalculatorBrain({this.height, this.weight});
//
//   final int height; // الطول بالسنتيمتر
//   final int weight; // الوزن بالكيلوجرام
//
//   double calculateBMI() {
//     // حساب قيمة BMI
//     final double heightInMeters = height / 100; // تحويل الطول إلى متر
//     return weight / pow(heightInMeters, 2);
//   }
//
//   String getResult() {
//     // تحديد حالة الجسم استنادًا إلى قيمة BMI
//     final double bmi = calculateBMI();
//     if (bmi >= 25) {
//       return 'زيادة في الوزن';
//     } else if (bmi > 18.5) {
//       return 'وزن طبيعي';
//     } else {
//       return 'نقص في الوزن';
//     }
//   }
//
//   String getInterpretation() {
//     // توجيه نصائح استنادًا إلى قيمة BMI
//     final double bmi = calculateBMI();
//     if (bmi >= 25) {
//       return 'لديك وزن أعلى من المعدل الطبيعي. يُفضل مراجعة نمط حياتك.';
//     } else if (bmi > 18.5) {
//       return 'وزنك طبيعي. استمر في العناية بصحتك.';
//     } else {
//       return 'لديك نقص في الوزن. يُفضل زيادة تناول الطعام الصحي.';
//     }
//   }
// }
