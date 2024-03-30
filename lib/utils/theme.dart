import 'package:flutter/material.dart';

final ThemeData themeData = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.deepPurple,

    // Primary colors
    primary: const Color(0XFF333274),
    primaryContainer: const Color(0XFFC0C0C0),
    secondaryContainer: const Color(0XFFFF000F),

    // Error colors
    errorContainer: const Color(0XFF0056FF),
    onError: const Color(0XFF333333),
    onErrorContainer: const Color(0X7E040415),

    // On colors(text colors)
    onPrimary: const Color(0XFFFFFFFF),
    onPrimaryContainer: const Color(0X116600E8),
  ),
  useMaterial3: true,
  textTheme: ThemeData.light().textTheme.copyWith(
        bodyLarge: const TextStyle(
          color: Color(0XFF040415),
          fontSize: 18,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w400,
        ),
        bodyMedium: const TextStyle(
          color: Color(0XFF040415),
          fontSize: 14,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w400,
        ),
        bodySmall: const TextStyle(
          color: Color(0XFF040415),
          fontSize: 12,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w400,
        ),
        displaySmall: const TextStyle(
          color: Color(0XFF040415),
          fontSize: 34,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w400,
        ),
        headlineLarge: const TextStyle(
          color: Color(0XFF040415),
          fontSize: 31,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w400,
        ),
        headlineMedium: const TextStyle(
          color: Color(0XFF040415),
          fontSize: 26,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w300,
        ),
        headlineSmall: const TextStyle(
          color: Color(0XFF040415),
          fontSize: 25,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w500,
        ),
        labelLarge: const TextStyle(
          color: Color(0XFF040415),
          fontSize: 12,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w700,
        ),
        titleLarge: const TextStyle(
          color: Color(0XFF040415),
          fontSize: 20,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w600,
        ),
        titleMedium: const TextStyle(
          color: Color(0XFF040415),
          fontSize: 16,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w600,
        ),
        titleSmall: const TextStyle(
          color: Color(0XFF040415),
          fontSize: 14,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w500,
        ),
      ),
);
