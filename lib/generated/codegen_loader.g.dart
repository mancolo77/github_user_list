// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes, avoid_renaming_method_parameters

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>?> load(String path, Locale locale) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> en = {
  "Some_error": "Some error",
  "List_of_users": "Users List",
  "Try_later": "Try later",
  "Back": "Back",
  "Update": "Update",
  "About_me": "About me",
  "Subscribers": "Subscribers",
  "Subscriptions": "Subscriptions",
  "Name": "Name",
  "Company": "Company",
  "Location": "Location",
  "Repos": "Repos",
  "Gists": "Gists"
};
static const Map<String,dynamic> ru = {
  "Some_error": "Произошла ошибка",
  "List_of_users": "Список пользователей",
  "Try_later": "Повторите попытку позже",
  "Back": "Назад",
  "Update": "Обновить",
  "About_me": "О себе",
  "Subscribers": "Подписчиков",
  "Subscriptions": "Подписок",
  "Name": "Имя",
  "Company": "Компания",
  "Location": "Локация",
  "Repos": "Репозиториев",
  "Gists": "Гистс"
};
static const Map<String, Map<String,dynamic>> mapLocales = {"en": en, "ru": ru};
}
