import 'dart:ui';

import 'package:api_retrofit_project/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class TextStyles {
  static InputDecoration getInputDecoration() => InputDecoration(
      fillColor: Colors.white.withOpacity(0.4),
      filled: true,
      enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.black),
          borderRadius: BorderRadius.circular(15)),
      focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.amber, width: 2),
          borderRadius: BorderRadius.circular(15)),
      focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red, width: 2),
          borderRadius: BorderRadius.circular(15)),
      errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red, width: 2),
          borderRadius: BorderRadius.circular(15)));

  static TextStyle getInputFiledTextColor() =>
      const TextStyle(color: Colors.white);

  static BoxDecoration getBackgroundImageBoxDecoration() => BoxDecoration(
          image: DecorationImage(
        fit: BoxFit.cover,
        image: AssetImage(Assets.images.sunflower.path),
      ));
  static ButtonStyle getCustomButtonStyle() => ButtonStyle(
      minimumSize: MaterialStateProperty.all(const Size(150, 50)),
      shape: MaterialStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),
      backgroundColor:
          MaterialStateProperty.all(Colors.amber.withOpacity(0.8)));
}
