class Validation {
  static String? emailValidation(String? email) {
    if (email == null || email.isEmpty) {
      return 'Please enter your email';
    } else {
      final bool validated = RegExp(
              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
          .hasMatch(email);
      if (!validated) {
        return 'Please enter correct email.';
      }
    }
    return null;
  }

  static String? passwordValidation(String? password) {
    if (password == null || password.isEmpty) {
      return 'Please enter your password';
    } else if (password.length < 6) {
      return 'Password should have at least 6 characters';
    }
    return null;
  }

  static String? confirmationValidation(
      String? confirmation, String? password) {
    if (confirmation == null || confirmation.isEmpty) {
      return 'Please confirm your password';
    } else if (confirmation != password) {
      return "Confirmation doesn't match with your password";
    }
    return null;
  }
}
