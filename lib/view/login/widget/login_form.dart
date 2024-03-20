import 'package:api_retrofit_project/core/constant/strings.dart';
import 'package:api_retrofit_project/core/constant/text_style.dart';
import 'package:api_retrofit_project/core/util/validator.dart';
import 'package:api_retrofit_project/ui_component/custom_button/custom_app_button.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final VoidCallback onLoginButtonPressed;
  const LoginForm(
      {required this.emailController,
      required this.passwordController,
      required this.onLoginButtonPressed,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _loginTitle(),
          _formLabelText(Strings.labelString.kUserName),
          _userNameTextField(),
          _formLabelText(Strings.labelString.kPassword),
          _passwordTextField(),
          _spacer(),
          CustomAppButton(onPressed: onLoginButtonPressed),
        ],
      ),
    );
  }

  SizedBox _spacer() => const SizedBox(height: 10);

  TextFormField _passwordTextField() {
    return TextFormField(
      decoration: TextStyles.getInputDecoration(),
      style: TextStyles.getInputFiledTextColor(),
      controller: passwordController,
      validator: passwordValidator,
      obscureText: true,
    );
  }

  TextFormField _userNameTextField() {
    return TextFormField(
      style: TextStyles.getInputFiledTextColor(),
      decoration: TextStyles.getInputDecoration(),
      controller: emailController,
      validator: emailValidator,
    );
  }

  Text _formLabelText(String labelText) {
    return Text(
      labelText,
      style: TextStyles.getInputFiledTextColor(),
    );
  }

  Text _loginTitle() {
    return Text(
      Strings.labelString.kLogin,
      style: TextStyles.getInputFiledTextColor().copyWith(fontSize: 50),
    );
  }

  static String? emailValidator(String? value) {
    if (value == null) {
      return Strings.message.kEnterEmail;
    } else if ((value).trim().isEmpty) {
      return Strings.message.kEnterEmail;
    } else if (!Validator.isValidEmail(value)) {
      return Strings.message.kEnterValidEmail;
    } else {
      return null;
    }
  }

  static String? passwordValidator(String? value) {
    if (value == null) {
      return Strings.message.kEnterPassword;
    } else if (value.trim().isEmpty) {
      return Strings.message.kEnterPassword;
    } else if (!Validator.isValidPassword(value)) {
      return Strings.message.kEnterValidPassword;
    } else {
      return null;
    }
  }
}
