import 'package:api_retrofit_project/core/constant/app_strings.dart';
import 'package:api_retrofit_project/core/constant/text_style.dart';
import 'package:flutter/material.dart';

class CustomAppButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String buttonLabel;
  const CustomAppButton(
      {required this.onPressed, required this.buttonLabel, super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
          style: TextStyles.getCustomButtonStyle(),
          onPressed: onPressed,
          child: _buttonLabel()),
    );
  }

//! widget method
  Widget _buttonLabel() {
    return Text(
      buttonLabel,
      style: TextStyles.getInputFiledTextColor().copyWith(fontSize: 20),
    );
  }
}
