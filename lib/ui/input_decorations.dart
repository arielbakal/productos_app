// ignore_for_file: unnecessary_const

import 'package:flutter/material.dart';

class InputDecorations{

  static InputDecoration authInputDecoration({
    required String hintText,
    required String labelText,
    IconData? prefixIcon,
  }) {

    return InputDecoration(
      enabledBorder: const UnderlineInputBorder(
        borderSide: const BorderSide(
          color: Colors.deepPurple
        ),
      ),
      focusedBorder: const UnderlineInputBorder(
        borderSide: const BorderSide(
          color: Colors.deepPurple
         )
      ),
      hintText: hintText,
      labelText: labelText,
      labelStyle: const TextStyle(
        color: Colors.grey
      ),
      prefixIcon: prefixIcon != null 
        ? Icon( prefixIcon, color: Colors.deepPurple)
        : null
    );
  }
}