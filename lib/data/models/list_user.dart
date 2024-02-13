import 'package:equatable/equatable.dart';

class ListUser extends Equatable {
  final String username;
  final String avatarUrl;

  const ListUser({required this.avatarUrl, required this.username});

  factory ListUser.fromJSON(Map<String, dynamic> data) {
    return ListUser(
      username: data['login'] ?? '',
      avatarUrl: data['avatar_url'] ?? '',
    );
  }

  @override
  List<Object?> get props => [username, avatarUrl];
}
