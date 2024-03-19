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
          Text(
            Strings.labelString.kLogin,
            style: const TextStyle(fontSize: 60, color: Colors.white),
          ),
          Text(
            Strings.labelString.kUserName,
            style: const TextStyle(color: Colors.white),
          ),
          TextFormField(
            style: const TextStyle(color: Colors.white),
            decoration: TextStyles.getInputDecoration(),
            controller: emailController,
            validator: emailValidator,
          ),
          Text(
            Strings.labelString.kPassword,
            style: const TextStyle(color: Colors.white),
          ),
          TextFormField(
            decoration: TextStyles.getInputDecoration(),
            style: const TextStyle(color: Colors.white),
            controller: passwordController,
            validator: passwordValidator,
            obscureText: true,
          ),
          const SizedBox(
            height: 10,
          ),
          CustomAppButton(onPressed: onLoginButtonPressed),
        ],
      ),
    );
  }

  static String? emailValidator(String? value) {
    if (value!.trim().isEmpty) {
      return Strings.message.kEnterEmail;
    } else if (!Validator.isValidEmail(value)) {
      return Strings.message.kEnterValidEmail;
    } else {
      return null;
    }
  }

  static String? passwordValidator(String? value) {
    if (value!.trim().isEmpty) {
      return Strings.message.kEnterPassword;
    } else if (!Validator.isValidPassword(value)) {
      return Strings.message.kEnterValidPassword;
    } else {
      return null;
    }
  }
}
