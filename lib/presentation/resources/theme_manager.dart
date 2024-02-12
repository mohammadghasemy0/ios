import 'package:flutter/material.dart';
import '/presentation/resources/color_manager.dart';
import '/presentation/resources/values_manager.dart';

import 'font_manager.dart';

ThemeData getAppTheme(){
 return ThemeData(
   fontFamily: FontConstants.yekanFarsiFontFamily,

  colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary: ColorManager.primary,
      onPrimary: ColorManager.white,
      secondary: ColorManager.secondary,
      onSecondary: ColorManager.white,
      tertiary: ColorManager.tertiary,
      onTertiary: ColorManager.white,
      error: ColorManager.error,
      onError: ColorManager.white,
      background: ColorManager.white,
      onBackground: ColorManager.black,
      surface: ColorManager.white,
      onSurface: ColorManager.black,

  ),

  cardTheme: const CardTheme(
   elevation: AppSize.s4,
  ),

  appBarTheme: const AppBarTheme(
      elevation: AppSize.s1_5,
    backgroundColor:  Colors.white,
    foregroundColor: Colors.black87
  ),

  buttonTheme: ButtonThemeData(
   shape: const StadiumBorder(),
   disabledColor: ColorManager.black.withOpacity(0.56),
   buttonColor: ColorManager.primary,
   splashColor: ColorManager.primary,
  ),

  elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
       shape: RoundedRectangleBorder(
           borderRadius: BorderRadius.circular(AppSize.s8)
       ),
      )
  ),

  inputDecorationTheme: InputDecorationTheme(
   contentPadding: const EdgeInsets.all(AppPadding.p8),

   enabledBorder: OutlineInputBorder(
       borderSide: BorderSide(color: ColorManager.black.withAlpha(120),width: AppSize.s1_5),
       borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8))
   ),

   focusedBorder: OutlineInputBorder(
       borderSide: BorderSide(color: ColorManager.primary,width: AppSize.s1_5),
       borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8))
   ),

   errorBorder: OutlineInputBorder(
       borderSide: BorderSide(color: ColorManager.error,width: AppSize.s1_5),
       borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8))
   ),

   focusedErrorBorder: OutlineInputBorder(
       borderSide: BorderSide(color: ColorManager.primary,width: AppSize.s1_5),
       borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8))
   ),


  ),
 );
}

ThemeData getAppDarkTheme(){
  return ThemeData(
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: Colors.red[400]!,
    ),

    fontFamily: FontConstants.yekanFarsiFontFamily,
    colorScheme: ColorScheme(
      brightness: Brightness.dark,
      primary: Colors.red[400]!,
      onPrimary: ColorManager.white,
      secondary: Colors.amber[300]!,
      onSecondary: ColorManager.white,
      tertiary: ColorManager.tertiary,
      onTertiary: ColorManager.white,
      error: ColorManager.error,
      onError: ColorManager.white,
      background: ColorManager.black,
      onBackground: ColorManager.white,
      surface: ColorManager.black,
      onSurface: ColorManager.white,
    ),

    cardTheme: const CardTheme(
      elevation: AppSize.s4,
    ),
    appBarTheme: const AppBarTheme(
        elevation: AppSize.s4,
    ),

    buttonTheme: ButtonThemeData(
      shape: const StadiumBorder(),
      disabledColor: ColorManager.black.withOpacity(0.56),
      buttonColor: ColorManager.primary,
      splashColor: ColorManager.primary,
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppSize.s12)
          ),
        )
    ),

    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.all(AppPadding.p8),

      enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ColorManager.white.withOpacity(.87),width: AppSize.s1_5),
          borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8))
      ),

      focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ColorManager.primary,width: AppSize.s1_5),
          borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8))
      ),

      errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ColorManager.error,width: AppSize.s1_5),
          borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8))
      ),

      focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ColorManager.primary,width: AppSize.s1_5),
          borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8))
      ),


    ),
  );
}
