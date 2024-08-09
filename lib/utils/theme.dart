import 'package:flutter/material.dart';

ThemeData getLightTheme() {
  return ThemeData.light(useMaterial3: true).copyWith(
      // colorScheme: ColorScheme.light(
      //   primary: Colors.redAccent,
      // ),
      );
}

ThemeData getDarkTheme() {
  return ThemeData.dark(useMaterial3: true).copyWith(
    // colorScheme: ColorScheme.dark(
    //   primary: Colors.redAccent,
    // ),
  );
}
