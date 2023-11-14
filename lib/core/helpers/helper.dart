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

  static String? validateUserNameField(String? value) {
    if (value!.isEmpty) {
      return 'email must not be empty';
    }
    if (value.length < 6) {
      return "must be more than 5 character";
    }
    return null;
  }

  static String? validateConfirmPasswordField(String? value, String password) {
    var passNonNullValue = value ?? "";
    if (passNonNullValue.isEmpty) {
      return ("Password is required");
    } else if (passNonNullValue.length < 6) {
      return ("Password Must be more than 5 characters");
    } else if (value != password) {
      return 'Confirm password not matching';
    }
    return null;
  }
}
