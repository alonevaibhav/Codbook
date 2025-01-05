import 'dart:ui';
import 'package:flutter/material.dart';

TextStyle getTextStyle(bool isActive,
    {double? fontSize, Color baseColor = Colors.white70}) {
  return TextStyle(
    color: isActive ? Colors.white : baseColor,
    fontSize: fontSize ?? 14,
    fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
  );
}

// Helper method to get icon color based on active state
Color getIconColor(bool isActive, {Color baseColor = Colors.white70}) {
  return isActive ? Colors.white : baseColor;
}