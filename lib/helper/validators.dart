class AppValidator {
  static String? requiredField(String val) {
    if (val.isEmpty) {
      return 'this field is required';
    } else {
      return null;
    }
  }

  static String? passFieldValidator(String val) {
    if (val.isEmpty) {
      return 'this field is required';
    }
    if (val.length < 8) {
      return 'must be more than 8 digits';
    }
    if (!val.contains(RegExp(r'[A-Z]'))) {
      return 'enter 1 upper char at least';
    }
    if (!val.contains(RegExp(r'[a-z]'))) {
      return 'enter 1 lower char at least';
    }
    if (!val.contains(RegExp(r'[0-9]'))) {
      return 'enter 1 number atLeast';
    } else {
      return null;
    }
  }
}
