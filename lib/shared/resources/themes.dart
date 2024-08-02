import 'package:app/shared/resources/colors.dart';
import 'package:flutter/material.dart';

class AppThemes {
  static ThemeData lightTheme() {
    return ThemeData(
        scaffoldBackgroundColor: AppColors.second,
        errorColor: Colors.red,
        
        appBarTheme: const AppBarTheme(
          elevation: 0,
          backgroundColor: Colors.transparent,
        ));
  }
}
