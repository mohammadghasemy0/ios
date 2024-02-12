import 'package:flutter/material.dart';

enum LanguageType {
  ENGLISH,
  PERSIAN
}

const String ENGLISH = "en";
const String PERSIAN = "fa";
const String ASSETS_PATH_LOCALIZATION = "assets/translations";
const Locale ENGLISH_LOCALE = Locale("en","US");
const Locale PERSIAN_LOCALE = Locale("fa","IR");

extension LanguageTypeExtention on LanguageType {
  String getValue(){
    switch(this){
      case LanguageType.ENGLISH:
        return ENGLISH;
      case LanguageType.PERSIAN:
        return PERSIAN;
    }
  }
}