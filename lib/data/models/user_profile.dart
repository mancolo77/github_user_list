class UserProfile {
  int followers;
  int following;
  String name;
  String username;
  String company;
  String avatarUrl;
  int publicRepos;
  int publicGists;
  String bio;
  String location;

  UserProfile(
      {required this.username,
      required this.name,
      required this.followers,
      required this.following,
      required this.bio,
      required this.location,
      required this.company,
      required this.avatarUrl,
      required this.publicGists,
      required this.publicRepos});

factory UserProfile.fromJSON(Map<String, dynamic> data) {
  return UserProfile(
    followers: data['followers'] as int,
    following: data['following'] as int,
    name: data['name'] as String,
    username: data['login'] as String,
    avatarUrl: data['avatar_url'] as String,
    location: data['location'] as String,
    company: data['company'] as String,
    bio: data['bio'] as String,
    publicGists: data['public_gists'] as int,
    publicRepos: data['public_repos'] as int,
  );
}

}