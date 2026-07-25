import 'package:flutter/material.dart';
import '../app_constants.dart';

class AppTheme {
  // Dark Theme - Premium Matte Black with Luxury Gold
  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      primaryColor: Color(AppConstants.luxuryGold),
      scaffoldBackgroundColor: Color(AppConstants.primaryBlack),
      canvasColor: Color(AppConstants.darkGray),
      cardColor: Color(AppConstants.mediumGray),
      dividerColor: Color(AppConstants.mediumGray),
      
      // Color Scheme
      colorScheme: ColorScheme.dark(
        primary: Color(AppConstants.luxuryGold),
        onPrimary: Color(AppConstants.primaryBlack),
        secondary: Color(AppConstants.accentGold),
        onSecondary: Color(AppConstants.primaryBlack),
        tertiary: Color(AppConstants.emeraldGreen),
        error: Color(AppConstants.rubyRed),
        surface: Color(AppConstants.mediumGray),
        onSurface: Color(AppConstants.lightGray),
        background: Color(AppConstants.primaryBlack),
        onBackground: Color(AppConstants.lightGray),
      ),
      
      // AppBar Theme
      appBarTheme: AppBarTheme(
        backgroundColor: Color(AppConstants.primaryBlack),
        elevation: 0,
        centerTitle: true,
        toolbarHeight: 56,
        titleTextStyle: TextStyle(
          fontFamily: 'Poppins',
          fontSize: AppConstants.titleSize,
          fontWeight: FontWeight.w600,
          color: Color(AppConstants.lightGray),
        ),
      ),
      
      // FloatingActionButton Theme
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: Color(AppConstants.luxuryGold),
        foregroundColor: Color(AppConstants.primaryBlack),
        elevation: 8,
        splashColor: Color(AppConstants.accentGold),
      ),
      
      // Text Theme
      textTheme: TextTheme(
        displayLarge: TextStyle(
          fontFamily: 'Poppins',
          fontSize: 40,
          fontWeight: FontWeight.w700,
          color: Color(AppConstants.lightGray),
        ),
        displayMedium: TextStyle(
          fontFamily: 'Poppins',
          fontSize: 32,
          fontWeight: FontWeight.w700,
          color: Color(AppConstants.lightGray),
        ),
        displaySmall: TextStyle(
          fontFamily: 'Poppins',
          fontSize: 28,
          fontWeight: FontWeight.w600,
          color: Color(AppConstants.lightGray),
        ),
        headlineLarge: TextStyle(
          fontFamily: 'Poppins',
          fontSize: 24,
          fontWeight: FontWeight.w600,
          color: Color(AppConstants.lightGray),
        ),
        headlineMedium: TextStyle(
          fontFamily: 'Poppins',
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: Color(AppConstants.lightGray),
        ),
        headlineSmall: TextStyle(
          fontFamily: 'Poppins',
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: Color(AppConstants.lightGray),
        ),
        titleLarge: TextStyle(
          fontFamily: 'Poppins',
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: Color(AppConstants.lightGray),
        ),
        bodyLarge: TextStyle(
          fontFamily: 'Roboto',
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: Color(AppConstants.lightGray),
        ),
        bodyMedium: TextStyle(
          fontFamily: 'Roboto',
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: Color(AppConstants.lightGray),
        ),
        bodySmall: TextStyle(
          fontFamily: 'Roboto',
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: Color(AppConstants.mediumGray),
        ),
        labelLarge: TextStyle(
          fontFamily: 'Poppins',
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: Color(AppConstants.luxuryGold),
        ),
      ),
      
      // Button Themes
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(AppConstants.luxuryGold),
          foregroundColor: Color(AppConstants.primaryBlack),
          elevation: 0,
          padding: EdgeInsets.symmetric(
            horizontal: AppConstants.lg,
            vertical: AppConstants.md,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppConstants.radiusMd),
          ),
          textStyle: TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w600,
            fontSize: AppConstants.bodySize,
          ),
        ),
      ),
      
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: Color(AppConstants.luxuryGold),
          side: BorderSide(color: Color(AppConstants.luxuryGold), width: 2),
          padding: EdgeInsets.symmetric(
            horizontal: AppConstants.lg,
            vertical: AppConstants.md,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppConstants.radiusMd),
          ),
        ),
      ),
      
      // Input Decoration Theme
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Color(AppConstants.mediumGray),
        contentPadding: EdgeInsets.symmetric(
          horizontal: AppConstants.md,
          vertical: AppConstants.md,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppConstants.radiusMd),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppConstants.radiusMd),
          borderSide: BorderSide(
            color: Color(AppConstants.mediumGray),
            width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppConstants.radiusMd),
          borderSide: BorderSide(
            color: Color(AppConstants.luxuryGold),
            width: 2,
          ),
        ),
        hintStyle: TextStyle(
          fontFamily: 'Roboto',
          color: Color(AppConstants.mediumGray),
          fontSize: AppConstants.bodySize,
        ),
      ),
    );
  }
}
