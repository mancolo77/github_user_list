part of 'github_list_bloc.dart';

abstract class GithubListEvent extends Equatable{}

class LoadGithubList extends GithubListEvent{
  LoadGithubList({
    this.completer,
  });

  final Completer? completer;
  @override
  List<Object?> get props => [completer];
}

