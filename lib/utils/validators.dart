class Validator {
  static String? validateNo(String value) {
    if (value.length != 6) {
      return 'Please Enter Subject ID';
    } else {
      return null;
    }
  }
}
