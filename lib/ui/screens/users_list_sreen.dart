import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:github_user_list/data/bloc/github_list_bloc.dart';
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
        onRefresh: () async{
          final completer = Completer();
          _githubListBloc.add(LoadGithubList(completer: completer));
          await completer.future;
          return Future.value();
        },
        child: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(top: 40.0),
            child: const Text(
              'Список пользователей',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold
              ),
            ),
          ),
          BlocBuilder<GithubListBloc, GithubListState>(
            bloc: _githubListBloc,
            builder: (context, state) {
              if (state is GithubListLoaded) {
                List<ListUser> users = state.userList;
                return UsersGrid(users: users);
              }
              if(state is GithubListLoadingFailure){
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text('Произошла ошибка'),
                      const Text('Попробуйте позже'),
                      const SizedBox(height: 30),
                      TextButton(onPressed: (){
                        _githubListBloc.add(LoadGithubList());
                      }, child: const Text('Обновить'))
                    ],
                  
                  ),
                );
              } 
              return const Center(child: CircularProgressIndicator());
              }
          ),
        ],
      ),
      ),
    );
  }
//   Widget unknownIOError() {
//   return const Expanded(
//     child: Center(
//       child: Text(
//         'Произошла неизвестная ошибка. Попробуйте позже!',
//       ),
//     ),
//   );
// }
// Widget networkErrorView(String message) {
//   return Expanded(
//     child: Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: <Widget>[
//           const Icon(
//             Icons.signal_cellular_connected_no_internet_4_bar,
//             color: primaryDark,
//             size: 50.0,
//           ),
//           Text(
//             message,
//             textAlign: TextAlign.center,
//             style: const TextStyle(
//               fontSize: 16.0,
//               color: secondaryLight,
//             ),
//           )
//         ],
//       ),
//     ),
//   );
// }
}