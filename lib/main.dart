import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:github_user_list/data/models/abstract_users_repository.dart';
import 'package:github_user_list/data/services/api_service.dart';
import 'package:github_user_list/generated/codegen_loader.g.dart';
import 'package:github_user_list/ui/screens/splash_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  GetIt.I.registerLazySingleton<AbstractUsersRepository>(
    () =>GithubUsersRepository(dio: Dio()),
    );
  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('ru')],
      path: 'assets/translations', // <-- change the path of the translation files 
      fallbackLocale: const Locale('en'),
      assetLoader: const CodegenLoader(),
      child: const MainApp()
    ),
    );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
      theme: ThemeData.dark().copyWith(
        primaryColor: Colors.black,
        scaffoldBackgroundColor: Colors.black87
      ),
    );
  }
}

