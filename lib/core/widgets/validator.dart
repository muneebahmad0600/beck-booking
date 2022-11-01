class Validators {
  static String? textFieldNullValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please provide value.';
    }
    return null;
  }
}
