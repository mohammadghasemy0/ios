import 'dart:async';
import 'package:flutter/material.dart';
import '/app/extension.dart';
import '/presentation/resources/language_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String PREFS_KEY_LANG = "PREFS_KEY_LANG";
const String PREFS_KEY_ONBOARDING_SCREEN = "PREFS_KEY_ONBOARDING_SCREEN";
const String PREFS_KEY_IS_USER_LOGGED_IN = "PREFS_KEY_IS_USER_LOGGED_IN";
const String PREFS_KEY_USER_ID = "PREFS_KEY_IS_USER_ID";
const String PREFS_KEY_USER_ROLE = "PREFS_KEY_IS_USER_ROLE";
const String PREFS_KEY_TOKEN = "PREFS_KEY_TOKEN";
const String PREFS_KEY_REFRESH_TOKEN = "PREFS_KEY_REFRESH_TOKEN";
const String PREFS_KEY_USER_ROLE_NAME = "PREFS_KEY_USER_ROLE_NAME";
const String PREFS_KEY_USER_DISPLAY_NAME = "PREFS_KEY_USER_DISPLAY_NAME";
const String PREFS_KEY_PROFILE_IMAGE = "PREFS_KEY_PROFILE_IMAGE";
const String PREFS_KEY_PHONE_NUMBER = "PREFS_KEY_PHONE_NUMBER";
const String PREFS_KEY_COMPANY_ACCESS_LIST = "PREFS_KEY_COMPANY_ACCESS_LIST";
const String PREFS_KEY_CURRENT_COMPANY_ID = "PREFS_KEY_CURRENT_COMPANY_ID";
const String PREFS_KEY_COMPANY_FISCAL_YEAR_LOGIN_DATA_LIST =
    "PREFS_KEY_COMPANY_FISCAL_YEAR_LOGIN_DATA_LIST";
const String PREFS_KEY_COMPANY_CURRENT_FISCAL_YEAR_LOGIN_DATA =
    "PREFS_KEY_COMPANY_CURRENT_FISCAL_YEAR_LOGIN_DATA";
const String PREFS_KEY_COMPANY_CURRENT_FISCAL_YEAR_CACHED_PARAMS_DATA =
    "PREFS_KEY_COMPANY_CURRENT_FISCAL_YEAR_CACHED_PARAMS_DATA";
const String PREFS_KEY_COMPANY_PLATE_READER_INSTANCE_LIST_DATA =
    "PREFS_KEY_COMPANY_PLATE_READER_INSTANCE_LIST_DATA";
const String PREFS_KEY_COMPANY_CURRENT_FISCAL_YEAR_HESAB_TAFSILI_DATA =
    "PREFS_KEY_COMPANY_CURRENT_FISCAL_YEAR_HESAB_TAFSILI_DATA";

class AppPreferences {
  final SharedPreferences _sharedPreferences;
  final _userLogOutStreamController = StreamController<bool>.broadcast();

  AppPreferences(this._sharedPreferences);

  // Setter

  Future<void> setOnBoardingScreenViewed() async =>
      _sharedPreferences.setBool(PREFS_KEY_ONBOARDING_SCREEN, true);

  Future<void> setLanguageChanged() async {
    final currentLanguage = getAppLanguage();
    if (currentLanguage == LanguageType.PERSIAN.getValue()) {
      await _sharedPreferences.setString(
          PREFS_KEY_LANG, LanguageType.ENGLISH.getValue());
    } else {
      await _sharedPreferences.setString(
          PREFS_KEY_LANG, LanguageType.PERSIAN.getValue());
    }
  }

  Future<void> setUserLoggedIn() async =>
      await _sharedPreferences.setBool(PREFS_KEY_IS_USER_LOGGED_IN, true);

  Future<void> setUserId(int userId) async =>
      await _sharedPreferences.setInt(PREFS_KEY_USER_ID, userId);

  Future<void> setUserRole(int userRole) async =>
      await _sharedPreferences.setInt(PREFS_KEY_USER_ROLE, userRole);

  Future<void> setToken(String token) async =>
      await _sharedPreferences.setString(PREFS_KEY_TOKEN, token);

  Future<void> setRefreshToken(String refreshToken) async =>
      await _sharedPreferences.setString(PREFS_KEY_REFRESH_TOKEN, refreshToken);

  Future<void> setUserRoleName(String userRoleName) async =>
      await _sharedPreferences.setString(
          PREFS_KEY_USER_ROLE_NAME, userRoleName);

  Future<void> setUserDisplayName(String userDisplayName) async =>
      await _sharedPreferences.setString(
          PREFS_KEY_USER_DISPLAY_NAME, userDisplayName);

  Future<void> setProfileImage(String profileImage) async =>
      await _sharedPreferences.setString(PREFS_KEY_PROFILE_IMAGE, profileImage);

  Future<void> setPhoneNumber(String phoneNumber) async =>
      await _sharedPreferences.setString(PREFS_KEY_PHONE_NUMBER, phoneNumber);

  Future<void> setCompanyAccessList(String accessListJsonData) async =>
      await _sharedPreferences.setString(
          PREFS_KEY_COMPANY_ACCESS_LIST, accessListJsonData);

  Future<void> setCurrentCompany(int currentCompanyId) async =>
      await _sharedPreferences.setInt(
          PREFS_KEY_CURRENT_COMPANY_ID, currentCompanyId);

  Future<void> setCurrentFiscalYearDataLogin(String currentFiscalYearJsonData) async =>
      await _sharedPreferences.setString(
          "${PREFS_KEY_COMPANY_CURRENT_FISCAL_YEAR_LOGIN_DATA}_${getCurrentCompany()}",
          currentFiscalYearJsonData);

  Future<void> setFiscalYearDataLoginList(String fiscalYearJsonDataList) async =>
      await _sharedPreferences.setString(
          "${PREFS_KEY_COMPANY_FISCAL_YEAR_LOGIN_DATA_LIST}_${getCurrentCompany()}",
          fiscalYearJsonDataList);

  Future<void> setFiscalYearDataCachedParams(String fiscalYearCachedParamsJsonData, String dbName) async =>
      await _sharedPreferences.setString(
          "${PREFS_KEY_COMPANY_CURRENT_FISCAL_YEAR_CACHED_PARAMS_DATA}_${getCurrentCompany()}_$dbName",
          fiscalYearCachedParamsJsonData);

  Future<void> setCurrentFiscalYearDataHesabTafsili(String fiscalYearHesabTafsiliJsonData, String dbName) async =>
      await _sharedPreferences.setString(
          "${PREFS_KEY_COMPANY_CURRENT_FISCAL_YEAR_HESAB_TAFSILI_DATA}_${getCurrentCompany()}_$dbName",
          fiscalYearHesabTafsiliJsonData);

  Future<void> setCompanyPlateReaderInstanceList(String plateReaderInstanceListJsonData) async =>
      await _sharedPreferences.setString(
          "${PREFS_KEY_COMPANY_PLATE_READER_INSTANCE_LIST_DATA}_${getCurrentCompany()}",
          plateReaderInstanceListJsonData);

  void logout() => _sharedPreferences.remove(PREFS_KEY_IS_USER_LOGGED_IN);

  // Getter
  Stream<bool> get userLogOutStream => _userLogOutStreamController.stream;

  String getAppLanguage() {
    String? language = _sharedPreferences.getString(PREFS_KEY_LANG);
    if (language != null && language.isNotEmpty) {
      return language;
    } else {
      return LanguageType.ENGLISH.getValue();
    }
  }

  bool isOnBoardingScreenViewed() {
    return _sharedPreferences.getBool(PREFS_KEY_ONBOARDING_SCREEN) ?? false;
  }

  Locale getLocale() {
    final currentLanguage = getAppLanguage();
    if (currentLanguage == LanguageType.PERSIAN.getValue()) {
      return PERSIAN_LOCALE;
    } else {
      return ENGLISH_LOCALE;
    }
  }

  bool isUserLoggedIn() =>
      _sharedPreferences.getBool(PREFS_KEY_IS_USER_LOGGED_IN) ?? false;

  int getUserId(int userId) =>
      _sharedPreferences.getInt(PREFS_KEY_USER_ID).orZero();

  int getUserRole(int userId) =>
      _sharedPreferences.getInt(PREFS_KEY_USER_ROLE).orZero();

  String getToken() => _sharedPreferences.getString(PREFS_KEY_TOKEN).orEmpty();

  String getRefreshToken() =>
      _sharedPreferences.getString(PREFS_KEY_REFRESH_TOKEN).orEmpty();

  String getUserRoleName() =>
      _sharedPreferences.getString(PREFS_KEY_USER_ROLE_NAME).orEmpty();

  String getUserDisplayName() =>
      _sharedPreferences.getString(PREFS_KEY_USER_DISPLAY_NAME).orEmpty();

  String getProfileImage() =>
      _sharedPreferences.getString(PREFS_KEY_PROFILE_IMAGE).orEmpty();

  String getPhoneNumber() =>
      _sharedPreferences.getString(PREFS_KEY_PHONE_NUMBER).orEmpty();

  int getCurrentCompany() =>
      _sharedPreferences.getInt(PREFS_KEY_CURRENT_COMPANY_ID).orZero();

  String getCompanyAccessList() =>
      _sharedPreferences.getString(PREFS_KEY_COMPANY_ACCESS_LIST).orEmpty();

  String getCurrentFiscalYearDataLogin() => _sharedPreferences
      .getString("${PREFS_KEY_COMPANY_CURRENT_FISCAL_YEAR_LOGIN_DATA}_${getCurrentCompany()}")
      .orEmpty();

  String getCurrentFiscalYearDataCachedParams(String dbName) => _sharedPreferences
      .getString("${PREFS_KEY_COMPANY_CURRENT_FISCAL_YEAR_CACHED_PARAMS_DATA}_${getCurrentCompany()}_$dbName")
      .orEmpty();

  String getCurrentFiscalYearDataHesabTafsili(String dbName) => _sharedPreferences
      .getString("${PREFS_KEY_COMPANY_CURRENT_FISCAL_YEAR_HESAB_TAFSILI_DATA}_${getCurrentCompany()}_$dbName")
      .orEmpty();

  String getCompanyPlateReaderInstanceList() => _sharedPreferences
      .getString("${PREFS_KEY_COMPANY_PLATE_READER_INSTANCE_LIST_DATA}_${getCurrentCompany()}")
      .orEmpty();

  String getFiscalYearDataLoginList() => _sharedPreferences
      .getString("${PREFS_KEY_COMPANY_FISCAL_YEAR_LOGIN_DATA_LIST}_${getCurrentCompany()}")
      .orEmpty();

}
