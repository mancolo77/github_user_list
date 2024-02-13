import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:github_user_list/data/models/abstract_users_repository.dart';
import 'package:github_user_list/data/models/list_user.dart';
part 'github_list_event.dart';
part 'github_list_state.dart';

class GithubListBloc extends Bloc<GithubListEvent, GithubListState> {
  GithubListBloc(this.usersRepository) : super(GithubListInitial()) {
    on<LoadGithubList>((event, emit) async {
      try{
        if(state is! GithubListLoaded){
          emit(GithubListLoading());
        }
      final usersList = await usersRepository.getUsersList();
      emit(GithubListLoaded(userList: usersList));
      }catch(e){
        emit(GithubListLoadingFailure(exception: e));
      }finally{
        event.completer?.complete();
      }
    });
  }
  final AbstractUsersRepository usersRepository;
}
