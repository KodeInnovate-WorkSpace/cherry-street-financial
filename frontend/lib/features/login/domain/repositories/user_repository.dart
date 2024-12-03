import '../../data/models/user_model.dart';

abstract interface class UserRepository {
  Future<UserModel?>? fetchUser(String username, String password);
}
