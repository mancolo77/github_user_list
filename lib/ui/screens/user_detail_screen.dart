import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:github_user_list/data/bloc/github_details_bloc.dart';
import 'package:github_user_list/generated/locale_keys.g.dart';
import 'package:github_user_list/ui/widgets/profile_body.dart';
import '../../data/models/models.dart';

class ProfileScreen extends StatefulWidget {
  final String username;
  final Future<dynamic>profileData;
  const ProfileScreen({super.key, required this.username, required this.profileData});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _GithubDetailsBloc = GithubDetailsBloc(
    GetIt.I<AbstractUsersRepository>(),
  );
@override
  void initState() {
    _GithubDetailsBloc.add(LoadGithubDetails(username: widget.username));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
       BlocBuilder<GithubDetailsBloc, GithubDetailsState>(
        bloc: _GithubDetailsBloc,
        builder: (context, state) {
          if (state is GithubDetailsLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is GithubDetailsLoaded) {
            final user = state.userProfile;
            return ProfileBody(data: user);
              } else if (state is GithubDetailsLoadingFailure) {
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
                    onPressed: (){
                      Navigator.pop(context);
                   }, 
                   child: Text(
                    LocaleKeys.Back.tr(),
                    ))
                ],
              )
            );
          } else {
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
                Navigator.pop(context); 
              },
              child: Text(
                LocaleKeys.Back.tr(),
                ),
            ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
