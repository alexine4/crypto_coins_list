import 'package:flutter/material.dart';

final lightTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(seedColor: Colors.limeAccent),
  textTheme: const TextTheme(
    titleMedium: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    bodyMedium: TextStyle(fontSize: 16),
    labelSmall: TextStyle(fontSize: 14, color: Colors.grey),
  ),
);
