import 'package:api_retrofit_project/core/constant/strings.dart';
import 'package:flutter/material.dart';

class CustomAppButton extends StatelessWidget {
  final VoidCallback onPressed;
  const CustomAppButton({required this.onPressed, super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
          style: ButtonStyle(
              minimumSize: MaterialStateProperty.all(const Size(150, 50)),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15))),
              backgroundColor:
                  MaterialStateProperty.all(Colors.amber.withOpacity(0.8))),
          onPressed: onPressed,
          child: Text(
            Strings.labelString.kLogin,
            style: const TextStyle(color: Colors.white, fontSize: 20),
          )),
    );
  }
}
