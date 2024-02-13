import 'package:dio/dio.dart';
import '../models/models.dart';


class GithubUsersRepository implements AbstractUsersRepository {
  GithubUsersRepository({
    required this.dio,
  });

  final Dio dio;

  @override
  Future<List<ListUser>> getUsersList() async {
    List<ListUser> users = [];
    try {
      final response = await dio.get(
        'https://api.github.com/search/users?q=+language:java+location:nairobi&per_page=100',
      );

      if (response.statusCode == 200) {
        var data = response.data;
        data['items'].forEach((user) {
          users.add(ListUser.fromJSON(user));
        });
      } else {
        print('Failed to fetch users. Status code: ${response.statusCode}');
        print('Response body: ${response.data}');
      }
    } catch (error) {
      print('Error fetching users: $error');
    }

    return users;
  }

  @override
  Future<UserProfile> getUserDetails(String username) async {
    try {
      final response = await dio.get(
        'https://api.github.com/users/$username?client_id=694ce0aafdfbc47ad583&client_secret=58709f1741ce72e8102a05b41412b38750bf1cd0',
      );

      if (response.statusCode == 200) {
        var data = response.data;
        return UserProfile.fromJSON(data);
      } else {
        print('Failed to fetch GitHub profile. Status code: ${response.statusCode}');
        print('Response body: ${response.data}');
        throw Exception('Failed to fetch GitHub profile. Status code: ${response.statusCode}');
      }
    } catch (error) {
      print('Error fetching profile: $error');
      throw Exception('Failed to fetch GitHub profile');
    }
  }
}