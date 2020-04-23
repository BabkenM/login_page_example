import 'package:flutter/cupertino.dart';
import 'package:viveohealthtask/src/base/regexp.dart';

/// This is validation class
/// It's holding the logic and regexp for validating
class Validators {

  /// Full name validation logic
  String validateName(value){
    if(value == null) return 'Enter your username';
    const Pattern pattern = RegularExpressions.onlyOneSpace;
    final RegExp regex = RegExp(pattern);
    bool hasError = !regex.hasMatch(value);
    if (hasError){
      return 'Enter your name';
    }
    else {
      return null;
    }
  }

  /// Email validation logic
  String validateEmail(value){
    if(value == null) return 'Enter your email';
    const Pattern pattern = RegularExpressions.email;
    final RegExp regex = RegExp(pattern);
    bool hasError = !regex.hasMatch(value);
    if (hasError){
      return 'Enter a valid email';
    } else {
      return null;
    }
  }

  /// Password validation logic
  String validatePassword(value){
    if(value == null) return 'Enter your passowrd';
    const Pattern pattern = RegularExpressions.password;
    final RegExp regex = RegExp(pattern);
    bool hasError = !regex.hasMatch(value);
    if (hasError) {
      return 'Enter at least 8 character (it must contain uppercase, lowercase and digit)';
    } else {
      return null;
    }
  }
}