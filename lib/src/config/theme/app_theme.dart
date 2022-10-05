import 'package:flutter/material.dart';

import '../config.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    scaffoldBackgroundColor: AppColors.secondary,
    fontFamily: 'Montserrat',

    // text theme
    textTheme: TextTheme(
      headline1: getBoldStyle(color: AppColors.primary, fontSize: FontSize.s22),
      headline2:
          getBoldStyle(color: AppColors.secondary, fontSize: FontSize.s20),
      headline3: getBoldStyle(color: AppColors.primary, fontSize: FontSize.s18),
      headline4: getBoldStyle(color: AppColors.primary, fontSize: FontSize.s16),
      headline5:
          getBoldStyle(color: AppColors.secondary, fontSize: FontSize.s14),
      headline6:
          getNormalStyle(color: AppColors.secondary, fontSize: FontSize.s14),
      bodyText1:
          getNormalStyle(color: AppColors.primary, fontSize: FontSize.s12),
      bodyText2:
          getNormalStyle(color: AppColors.primary, fontSize: FontSize.s10),
    ),
  );
}
