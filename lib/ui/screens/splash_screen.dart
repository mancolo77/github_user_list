import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_it/get_it.dart';
import 'package:github_user_list/ui/screens/users_list_sreen.dart';

import '../../data/models/models.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late Future<List<ListUser>>? users;
  final AbstractUsersRepository _usersRepository = GetIt.I<AbstractUsersRepository>();

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    try {
      setState(() {
        users = _usersRepository.getUsersList();
      });
      await Future.delayed(const Duration(seconds: 3), () {});
      _navigateToHome();
    } catch (error) {
      print('Error loading data: $error');
    }
  }

  void _navigateToHome() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => UsersScreen(users: users)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              child: SvgPicture.asset('assets/image/github-mark.svg'),
            ),
            const SizedBox(height: 20),
            const Text(
              'GitHub User’s List',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

