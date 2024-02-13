import 'package:github_user_list/data/models/models.dart';

abstract class AbstractUsersRepository{
  Future<List<ListUser>> getUsersList();
  Future<UserProfile> getUserDetails(String username);
}