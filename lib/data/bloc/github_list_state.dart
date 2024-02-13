part of 'github_list_bloc.dart';

abstract class GithubListState extends Equatable{}

class GithubListInitial extends GithubListState{
  @override
  List<Object?> get props => [];
}

class GithubListLoading extends GithubListState{
  @override
  List<Object?> get props => [];
}

class GithubListLoaded extends GithubListState{
  GithubListLoaded({
    required this.userList
    });
  final List<ListUser> userList;
  
  @override
  List<Object?> get props => [userList];
}

class GithubListLoadingFailure extends GithubListState{
    GithubListLoadingFailure({
      required this.exception
      });
  final Object? exception;
  
  @override
  List<Object?> get props => [exception];
  
}
