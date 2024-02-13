import 'dart:async';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:github_user_list/data/bloc/github_list_bloc.dart';
import 'package:github_user_list/generated/locale_keys.g.dart';
import 'package:github_user_list/ui/widgets/users_grid.dart';
import '../../data/models/models.dart';

class UsersScreen extends StatefulWidget {
  final Future<List<ListUser>>? users;
  const UsersScreen({super.key, required this.users});

  @override
  State<UsersScreen> createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  final _githubListBloc = GithubListBloc(
    GetIt.I<AbstractUsersRepository>(),
  );

  @override
  void initState() {
    _githubListBloc.add(LoadGithubList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {
          final completer = Completer();
          _githubListBloc.add(LoadGithubList(completer: completer));
          await completer.future;
          return Future.value();
        },
        child: Column(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.only(top: 40.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    LocaleKeys.List_of_users.tr(),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      if (context.locale == const Locale('ru')) {
                        context.setLocale(const Locale('en'));
                      } else {
                        context.setLocale(const Locale('ru'));
                      }
                    },
                    icon: const Icon(Icons.language),
                    iconSize: 40,
                  ),
                ],
              ),
            ),
            BlocBuilder<GithubListBloc, GithubListState>(
              bloc: _githubListBloc,
              builder: (context, state) {
                if (state is GithubListLoaded) {
                  List<ListUser> users = state.userList;
                  return UsersGrid(users: users);
                } else if (state is GithubListLoadingFailure) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          LocaleKeys.Some_error.tr(),
                          ),
                         Text(
                          LocaleKeys.Try_later.tr(),
                          ),
                        const SizedBox(height: 30),
                        TextButton(
                          onPressed: () {
                            _githubListBloc.add(LoadGithubList());
                          },
                          child: Text(
                            LocaleKeys.Update.tr(),
                            ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            LocaleKeys.Back.tr(),
                            ),
                        ),
                      ],
                    ),
                  );
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
