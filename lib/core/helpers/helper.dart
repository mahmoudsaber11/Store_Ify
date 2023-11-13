class Helper {
  static String? uId = '';

  static String? validatePasswordField(String? value) {
    if (value!.isEmpty) {
      return 'Please enter password';
    } else {
      return null;
    }
  }

  static String? validateEmailField(String? value) {
    if (value!.isEmpty) {
      return 'email must not be empty';
    }
    if (!value.contains('@')) {
      return "email should contains @";
    }
    return null;
  }
}
