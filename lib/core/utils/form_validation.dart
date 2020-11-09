class Validation {
  var _emailValidator = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

  bool validatePassword(String value) {
    return value.isNotEmpty;
  }

  bool validateEmail(String value) {
    return _emailValidator.hasMatch(value);
  }
}