part of 'github_details_bloc.dart';

abstract class GithubDetailsEvent extends Equatable{
  const GithubDetailsEvent();
  @override
  List<Object> get props => [];
}
class LoadGithubDetails extends GithubDetailsEvent{
  const LoadGithubDetails({
    required this.username
    });
      final String username;
  @override
  List<Object> get props => [username];
}
