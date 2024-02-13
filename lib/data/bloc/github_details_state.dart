part of 'github_details_bloc.dart';

class GithubDetailsState extends Equatable{
  const GithubDetailsState();
  
  @override
  List<Object?> get props => [];
}

class GithubDetailsLoading extends GithubDetailsState{
  const GithubDetailsLoading();
}
class GithubDetailsLoaded extends GithubDetailsState{
  const GithubDetailsLoaded(this.userProfile);
  final UserProfile userProfile;

  @override
  List<Object?> get props => [userProfile];
}

class GithubDetailsLoadingFailure extends GithubDetailsState{
  const GithubDetailsLoadingFailure(this.exception);

  final Object exception;

  @override
  List<Object?> get props => [exception];
}