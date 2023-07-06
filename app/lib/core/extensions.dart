import 'package:flutter/material.dart';

extension StringExt on String {
  String capitalizeFirstLetter() {
    return this[0].toUpperCase() + substring(1);
  }
}

extension ColorExt on Color {
  Color contrastingColor() {
    final luminace = computeLuminance();
    return luminace > 0.5 ? Colors.black : Colors.white;
  }
}
