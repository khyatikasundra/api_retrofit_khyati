class Validator {
  //Email Validator
  static bool isValidEmail(String email) => RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9]+")
      .hasMatch(email);

  //Password Validator
  static bool isValidPassword(String password) => RegExp(
          r"^(?=.*[a-z])(?=.*[A-Z])")
      .hasMatch(password);
}
