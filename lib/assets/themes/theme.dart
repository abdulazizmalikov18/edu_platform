import 'package:edu_platform/assets/colors/colors.dart';
import 'package:flutter/material.dart';

abstract class AppTheme {
  static ThemeData theme() => ThemeData(
        scaffoldBackgroundColor: backgroundColor,
        fontFamily: 'Inter',
        useMaterial3: false,
        appBarTheme: const AppBarTheme(
          elevation: 2,
          color: white,
          shadowColor: whiteGrey,
          titleTextStyle: bodyMedium,
          centerTitle: true,
          iconTheme: IconThemeData(color: Color(0xFF0C161D)),
        ),
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        unselectedWidgetColor: Colors.black,
        textTheme: const TextTheme(
          displayLarge: displayLarge,
          displayMedium: displayMedium,
          displaySmall: displaySmall,
          headlineMedium: headlineMedium,
          headlineSmall: headlineSmall,
          titleLarge: titleLarge,
          bodyLarge: bodyLarge,
          bodyMedium: bodyMedium,
          titleMedium: titleMedium,
          titleSmall: titleSmall,
          bodySmall: bodySmall,
          labelLarge: labelLarge,
          labelSmall: labelSmall,
        ),
        colorScheme: const ColorScheme(
          background: white,
          brightness: Brightness.light,
          primary: green,
          secondary: dark,
          error: red,
          surface: dark,
          onPrimary: dark,
          onSecondary: dark,
          onBackground: dark,
          onError: red,
          onSurface: dark,
        ),
      );

  // Fonts
  static const displayLarge = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: dark,
  );
  static const displayMedium = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: dark,
  );
  static const displaySmall = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: white,
  );
  static const headlineMedium = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: buttonTextGreen,
  );
  static const headlineSmall = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: white,
  );
  static const titleLarge = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w500,
    color: dark,
  );
  static const bodyLarge = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: dark,
  );

  static const bodyMedium = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: dark,
  );

  static const titleMedium = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: dark,
  );

  static const titleSmall = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w700,
    color: white,
  );

  static const bodySmall = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: inputGrey,
  );

  static const labelLarge = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: white,
    letterSpacing: -0.1,
  );

  static const labelSmall = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: dark,
    letterSpacing: -0.1,
  );
}
