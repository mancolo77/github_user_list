import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:github_user_list/data/models/abstract_users_repository.dart';
import 'package:github_user_list/data/services/api_service.dart';
import 'package:github_user_list/ui/screens/splash_screen.dart';

void main() {
  GetIt.I.registerLazySingleton<AbstractUsersRepository>(
    () =>GithubUsersRepository(dio: Dio()),
    );
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
      theme: ThemeData.dark().copyWith(
        primaryColor: Colors.black,
        scaffoldBackgroundColor: Colors.black87
      ),
    );
  }
}

