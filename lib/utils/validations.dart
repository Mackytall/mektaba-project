bool isValidName(String originalString) {
  RegExp exp = RegExp(r"[^-'a-zÀ-ÿ ]", caseSensitive: false);
  Iterable<RegExpMatch> matches = exp.allMatches(originalString);
  int matchCount = matches.length;
  if (matchCount == 0) {
    return true;
  } else {
    return false;
  }
}

bool isValidPhone(String originalString) {
  String patttern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
  RegExp regex = RegExp(patttern);
  return regex.hasMatch(originalString);
}

bool isValidEmail(String originalString) {
  String pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regex = RegExp(pattern);
  return regex.hasMatch(originalString);
}

bool isValidZipCode(String originalString) {
  String pattern = r"^[a-z0-9][a-z0-9\- ]{0,10}[a-z0-9]$";
  RegExp regex = RegExp(pattern);
  return regex.hasMatch(originalString);
}

bool isValidAddress(String originalString) {
  String pattern = r'^\d+\s[\w\s-]+$';
  RegExp regex = RegExp(pattern);
  return regex.hasMatch(originalString);
}

bool isValidPassword(String originalString) {
  String pattern =
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~.]).{8,}$';
  RegExp regex = RegExp(pattern);
  return regex.hasMatch(originalString);
}

bool isValidConfirmPassword(String password, String confirmPassword) {
  return password == confirmPassword;
}
