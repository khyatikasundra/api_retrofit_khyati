import 'package:api_retrofit_project/core/constant/app_strings.dart';
import 'package:api_retrofit_project/core/constant/text_style.dart';
import 'package:api_retrofit_project/core/util/validator.dart';
import 'package:api_retrofit_project/ui_component/custom_button/custom_app_button.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatelessWidget {
  final TextEditingController userNameController;
  final TextEditingController passwordController;
  final VoidCallback onLoginButtonPressed;
  const LoginForm(
      {required this.userNameController,
      required this.passwordController,
      required this.onLoginButtonPressed,
      super.key});

//!build method
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _loginTitle(),
        _userNameLabel(),
        _userNameTextField(),
        _passwordLabel(),
        _passwordTextField(),
        _spacer(),
        _loginButton(),
      ],
    );
  }

//! widget method
  Widget _spacer() => const SizedBox(height: 10);

  Widget _passwordTextField() {
    return TextFormField(
      decoration: TextStyles.getInputDecoration(),
      style: TextStyles.getInputFiledTextColor(),
      controller: passwordController,
      validator: passwordValidator,
      obscureText: true,
    );
  }

  Widget _userNameTextField() {
    return TextFormField(
      style: TextStyles.getInputFiledTextColor(),
      decoration: TextStyles.getInputDecoration(),
      controller: userNameController,
      validator: userNameValidator,
    );
  }

  Widget _userNameLabel() {
    return Text(
      AppStrings.labelString.kUserName,
      style: TextStyles.getInputFiledTextColor(),
    );
  }

  Widget _passwordLabel() {
    return Text(
      AppStrings.labelString.kPassword,
      style: TextStyles.getInputFiledTextColor(),
    );
  }

  Widget _loginTitle() {
    return Text(
      AppStrings.labelString.kLogin,
      style: TextStyles.getInputFiledTextColor().copyWith(fontSize: 50),
    );
  }

  Widget _loginButton() {
    return CustomAppButton(
      onPressed: onLoginButtonPressed,
      buttonLabel: AppStrings.labelString.kLogin,
    );
  }

//! function
  static String? userNameValidator(String? value) {
    if (value == null) {
      return AppStrings.message.kEnterEmail;
    } else if ((value).trim().isEmpty) {
      return AppStrings.message.kEnterEmail;
    } else if (!Validator.isValidEmail(value)) {
      return AppStrings.message.kEnterValidEmail;
    } else {
      return null;
    }
  }

  static String? passwordValidator(String? value) {
    if (value == null) {
      return AppStrings.message.kEnterPassword;
    } else if (value.trim().isEmpty) {
      return AppStrings.message.kEnterPassword;
    } else if (!Validator.isValidPassword(value)) {
      return AppStrings.message.kEnterValidPassword;
    } else {
      return null;
    }
  }
}
