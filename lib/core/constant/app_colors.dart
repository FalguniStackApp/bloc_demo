import 'package:flutter/material.dart';

mixin AppColors {
  static const Color appTransparent = Color(0x00000000);
  static const Color appWhite = Color(0xffFFFFFF);
  static const Color appWhite200 = Color(0xffF2F2F2);
  static const Color appWhite300 = Color(0xfffff0f0);
  static const Color appWhite100 = Color(0xfff9f9f9);
  static const Color appWhite50 = Color(0xfffdf7ff);

  static const Color appBlack = Color(0xFF000000);
  static const Color appBlack700 = Color(0xff101828);
  static const Color appBlack600 = Color(0xff1a1c16);
  static const Color appBlack500 = Color(0xff44483d);
  static const Color appBlack400 = Color(0xff75796c);
  static const Color appBlack300 = Color(0xffc5c8ba);
  static const Color appBlack200 = Color(0x668C8B8B);
  static const Color appBlack100 = Color(0xff636363);
  static const Color appBlack150 = Color(0xff70787d);
  static const Color appBlack50 = Color(0xffc0c8cc);
  static const Color appPrimary = Color(0xff2384C7);
  static const Color appSecondary = Color(0xffebdaff);
  static const Color appSecondary800 = Color(0xFFE4E0FF);
  static const Color appRed = Color(0xffba1a1a);
  static const Color appRed900 = Color(0xff410002);
  static const Color appRed100 = Color(0xff31111f);
  static const Color appLightRed = Color(0xfffadada);
  static const Color appLightRed100 = Color(0xffffdad6);
  static const Color appGrey = Color(0xff777777);
  static const Color appGreen = Color(0xff28A138);
  static const Color appGreen900 = Color(0xff151e0b);
  static const Color appGreen800 = Color(0xff00201e);
  static const Color appGreen700 = Color(0xff4c662b);
  static const Color appGreen600 = Color(0xff1f3701);
  static const Color appGreen500 = Color(0xFF4CAF50);
  static const Color appGreen400 = Color(0xff0BA141);
  static const Color appLightGreen = Color(0xffdefade);
  static const Color appLightGreen100 = Color(0xfff3fff0);
  static const Color appLightBlue100 = Color(0xFFEBFEFF);
  static const Color appLightGrey = Color(0xffEDEDED);
  static const Color appPurple = Color(0xff211b69);
  static const Color appPurple800 = Color(0xff230ba1);
  static const Color appPurple700 = Color(0xff1d192b);
  static const Color appPurple300 = Color(0xffdaebff);
  static const Color appPurple100 = Color(0xffF5F6FF);
  static const Color appPurple50 = Color(0xFFEFF1FF);
  static const Color appTeal = Color(0xff2CBBCE);
  static const Color appTeal800 = Color(0xff065E9E);
  static const Color appTeal700 = Color(0xff0b7aa1);
  static const Color appLiteYellow = Color(0xfffff3ca);
  static const Color appYellow = Color(0xFFFFC107);
  static const Color appLightPurple = Color(0xff625690);



  static Color hex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  static List<BoxShadow> appBoxShadow = [
    BoxShadow(offset: const Offset(0, -6), spreadRadius: 0.2, color: appBlack.withValues(alpha: 0.2), blurRadius: 2),
  ];

  static List<BoxShadow> appDrawerBoxShadow = [
    BoxShadow(
      color: AppColors.appBlack200.withValues(alpha: 0.3),
      blurRadius: 15,
      spreadRadius: 2,
      offset: const Offset(2, 0),
    )
  ];

  static List<BoxShadow> appDrawerMenuShadow = [
    BoxShadow(
      color: AppColors.appWhite100.withValues(alpha: 0.05),
      spreadRadius: 1,
      blurRadius: 3,
      offset: const Offset(0, 1),
    ),
  ];


}
