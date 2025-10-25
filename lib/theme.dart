import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// --- Kolory zdefiniowane w mockupie ---
const Color baseBackground = Color(0xFFF5F7FA);
const Color surfaceBackground = Color(0xFFFFFFFF);
const Color primaryText = Color(0xFF0B1727);
const Color secondaryText = Color(0xFF4B5B70);
const Color tertiaryText = Color(0xFF6B7A8F);
const Color borderColor = Color(0xFFE1E6ED);
const Color inputBorderColor = Color(0xFFE1E6ED);

const Color infoColor = Color(0xFF2F80ED);
const Color infoColorWithAlpha = Color(0xCC2F80ED);
const Color successColor = Color(0xFF23A36E);
const Color warningColor = Color(0xFFF57C00);
const Color errorColor = Color(0xFFE53935);

const Color surfaceContainerLowestColor = Color(0xFFFFFFFF);

// --- Motyw aplikacji (ThemeData) ---

final ThemeData appTheme = ThemeData(
  useMaterial3: true,
  scaffoldBackgroundColor: baseBackground,
  colorScheme: ColorScheme.light(
    primary: successColor,
    onPrimary: Colors.white,
    secondary: infoColor,
    onSecondary: Colors.white,
    surface: surfaceBackground,
    onSurface: primaryText,
    error: errorColor,
    onError: Colors.white,
    outline: borderColor,
    surfaceContainerLowest: surfaceContainerLowestColor,
    surfaceDim: Colors.black.withOpacity(0.1),
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: surfaceBackground,
    foregroundColor: primaryText,
    elevation: 0,
    surfaceTintColor: Colors.transparent,
    iconTheme: IconThemeData(color: secondaryText),
    titleTextStyle: TextStyle(
      color: primaryText,
      fontSize: 18,
      fontWeight: FontWeight.w600,
    ),
  ),
  textTheme: GoogleFonts.interTextTheme(
    ThemeData.light().textTheme.copyWith(
      headlineSmall: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: primaryText,
      ),
      titleLarge: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: primaryText,
      ),
      bodyMedium: const TextStyle(
        fontSize: 14,
        color: primaryText,
      ),
      bodySmall: const TextStyle(
        fontSize: 12,
        color: secondaryText,
      ),
      labelLarge: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w600,
      ),
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: successColor,
      foregroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      textStyle: const TextStyle(fontWeight: FontWeight.w600),
      elevation: 1,
    ),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: primaryText,
      side: const BorderSide(color: borderColor),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      textStyle: const TextStyle(fontWeight: FontWeight.w600),
    ),
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: infoColor,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      textStyle: const TextStyle(fontWeight: FontWeight.w600),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: surfaceBackground,
    contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.0),
      borderSide: const BorderSide(color: inputBorderColor),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.0),
      borderSide: const BorderSide(color: inputBorderColor),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.0),
      borderSide: BorderSide(color: infoColor, width: 2.0),
    ),
    labelStyle: const TextStyle(color: secondaryText),
    floatingLabelStyle: const TextStyle(color: infoColorWithAlpha),
    floatingLabelBehavior: FloatingLabelBehavior.auto,
    helperStyle: const TextStyle(color: secondaryText, fontSize: 12),
    errorStyle: const TextStyle(color: errorColor, fontSize: 12),
  ),
  cardTheme: CardThemeData(
    color: surfaceBackground,
    elevation: 1,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12.0),
      side: const BorderSide(color: borderColor),
    ),
    margin: EdgeInsets.zero,
  ),
  chipTheme: ChipThemeData(
    backgroundColor: surfaceContainerLowestColor,
    labelStyle: const TextStyle(color: secondaryText, fontSize: 12, fontWeight: FontWeight.w500),
    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(6.0),
      side: const BorderSide(color: borderColor),
    ),
  ),
  dividerTheme: const DividerThemeData(
    color: borderColor,
    thickness: 1,
    space: 1,
  ),
);
