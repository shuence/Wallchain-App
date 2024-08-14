import 'package:flutter/material.dart';

class AppColors {
  static const Color backgroundColor = Color(0xFFFBFBFF);
  static const Color primaryButtonColor = Color(0xFF040F16);
  static const Color inputFieldBackground = Color(0x05040F16);
  static const Color inputFieldBorderColor = Color(0x99040F16);
}

// Constants for Text Styles
class AppTextStyles {
  static const TextStyle logoTextStyle = TextStyle(
    color: Color(0xFF040F16),
    fontSize: 18,
    fontFamily: 'General Sans',
    fontWeight: FontWeight.w600,
    letterSpacing: 2.70,
  );

  static const TextStyle titleTextStyle = TextStyle(
    color: Color(0xFF040F16),
    fontSize: 42,
    fontFamily: 'General Sans',
    fontWeight: FontWeight.w600,
  );

  static const TextStyle subTitleTextStyle = TextStyle(
    color: Color(0x99040F16),
    fontSize: 18,
    fontFamily: 'General Sans',
    fontWeight: FontWeight.w400,
  );

  static const TextStyle inputTextStyle = TextStyle(
    color: Color(0xFF040F16),
    fontSize: 18,
    fontFamily: 'General Sans',
  );

  static const TextStyle inputHintTextStyle = TextStyle(
    color: Color(0xFF040F16),
    fontSize: 18,
    fontFamily: 'General Sans',
    fontWeight: FontWeight.w400,
  );

  static const TextStyle primaryButtonTextStyle = TextStyle(
    color: Color(0xFFFBFBFF),
    fontSize: 24,
    fontFamily: 'General Sans',
    fontWeight: FontWeight.w600,
  );
}

class AssetPaths {
  static const String logo = 'assets/svgs/logo.svg';
  static const String home = 'assets/svgs/Home.svg';
  static const String map = 'assets/svgs/Map.svg';
  static const String profile = 'assets/svgs/Profile.svg';
  static const String report = 'assets/svgs/Reports.svg';
  static const String homeFilled = 'assets/svgs/Home_filled.svg';
  static const String mapFilled = 'assets/svgs/Map_filled.svg';
  static const String profileFilled = 'assets/svgs/Profile_filled.svg';
  static const String reportFilled = 'assets/svgs/Reports_filled.svg';

  static const String welcome = 'assets/images/welcome.png';
  static const String login = 'assets/images/login.jpg';
}
