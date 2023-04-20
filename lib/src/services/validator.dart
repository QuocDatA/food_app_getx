import 'package:get/get.dart';

String? emailValidator(String? email) {
  if (email == null || email.isEmpty) return 'Enter your email';

  //Check format email
  if (!email.isEmail) return 'Enter a valid email';
  return null;
}

String? passwordValidator(String? password) {
  if (password == null || password.isEmpty) return 'Enter your password';

  //Check length password
  if (password.length < 7) return 'Please enter your password more 7 characters';
  return null;
}

String? nameValidator(String? name) {
  if (name == null || name.isEmpty) return 'Enter your name';

  final names = name.split(' ');

  if(name.length == 1) return 'Enter your name is completed';

  return null;
}

String? phoneValidator(String? phone) {
  if (phone == null || phone.isEmpty) return 'Enter your phone';

  //Check format email
  if (!phone.isPhoneNumber) return 'Enter a valid phone';
  return null;
}


