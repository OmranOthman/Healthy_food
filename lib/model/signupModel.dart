// ignore_for_file: file_names

class SignupModel {
  final String name;
  final String phone;
  final String email;
  final String password;
  final String profileImagePath;
  final String pdfFilePath;

  SignupModel({
    required this.name,
    required this.phone,
    required this.email,
    required this.password,
    required this.profileImagePath,
    required this.pdfFilePath,
  });

  Map<String, String> toJson() {
    return {
      'name': name,
      'phone': phone,
      'email': email,
      'password': password,
    };
  }

  bool isValid() {
    return name.isNotEmpty &&
        phone.isNotEmpty &&
        email.isNotEmpty &&
        password.length >= 6;
  }
}
