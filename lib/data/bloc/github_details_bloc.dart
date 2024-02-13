import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:github_user_list/data/models/abstract_users_repository.dart';
import 'package:github_user_list/data/models/user_profile.dart';

part 'github_details_event.dart';
part 'github_details_state.dart';


class GithubDetailsBloc extends Bloc<GithubDetailsEvent, GithubDetailsState> {
  final AbstractUsersRepository usersRepository;

  GithubDetailsBloc(this.usersRepository) : super(const GithubDetailsState()) {
    on<LoadGithubDetails>((event, emit) async {
      try {
        emit(const GithubDetailsLoading());

        final userProfile = await usersRepository.getUserDetails(event.username);
        emit(GithubDetailsLoaded(userProfile));
      } catch (e) {
        emit(GithubDetailsLoadingFailure(e));
      }
    });
  }
}