import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:github_user_list/ui/screens/user_detail_screen.dart';
import 'package:github_user_list/ui/widgets/user_card.dart';
import '../../data/models/list_user.dart';
import '../../data/services/api_service.dart';

class UsersGrid extends StatelessWidget {
  final List<ListUser> users;
  final GithubUsersRepository _usersRepository = GithubUsersRepository(dio: Dio());
  UsersGrid({super.key, required this.users});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10.0),
        child: GridView.count(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10.0,
          children: List.generate(users.length, (index) {
            ListUser user = users[index];

            return GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  String username = user.username;
                  return ProfileScreen(
                    username: username,
                    profileData: _usersRepository.getUserDetails(username),
                  );
                }));
              },
              child: UserCard(user: user),
            );
          }),
        ),
      ),
    );
  }
}