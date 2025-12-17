import 'package:flutter/material.dart';

class AppValidator {
  static String? validateEmail(BuildContext context, String? value) {
    RegExp regExp = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    );
    if (value == null || value.isEmpty) {
      return "";
    }
    if (!regExp.hasMatch(value)) {
      return "";
    }
    return null;
  }

  static String? validatePassword(BuildContext context, String? value) {
    RegExp regex = RegExp(
      r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$",
    );
    if (value == null || value.isEmpty) {
      return "";
    }
    if (!regex.hasMatch(value)) {
      return "";
    }

    if (value.length < 8) {
      return "";
    }
    return null;
  }

  static String? validateEmailAuth(BuildContext context, String? emailLogin) {
    if (emailLogin == null || emailLogin.isEmpty) {
      return 'Please enter an email';
    }
    const pattern = r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$';
    final regex = RegExp(pattern);
    if (!regex.hasMatch(emailLogin)) {
      return 'Enter a valid email address';
    }
    return null;
  }

  static String? validatePasswordAuth(
    BuildContext context,
    String? passwordLogin,
  ) {
    if (passwordLogin == null || passwordLogin.isEmpty) {
      return 'Please enter a password';
    }
    bool hasUppercase = RegExp(r'[A-Z]').hasMatch(passwordLogin);
    bool hasLowercase = RegExp(r'[a-z]').hasMatch(passwordLogin);
    bool hasSymbols = RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(passwordLogin);
    if (!hasUppercase) {
      return 'Password should contain at least one uppercase letter';
    }
    if (!hasLowercase) {
      return 'Password should contain at least one lowercase letter';
    }
    if (!hasSymbols) {
      return 'Password should contain at least one symbol';
    }

    if (passwordLogin.length < 8 || passwordLogin.length > 20) {
      return 'Password should be at least 8 characters';
    }

    return null;
  }
}
