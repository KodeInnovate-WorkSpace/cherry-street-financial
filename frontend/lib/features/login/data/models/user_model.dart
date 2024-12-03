import 'package:cherrystreet/features/login/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  final String token;

  UserModel({
    required super.id,
    required super.username,
    required super.password,
    required this.token,
  });

  factory UserModel.fromJson(Map<String, dynamic> data) {
    return UserModel(
      id: data['id'] as int,
      username: data['username'] as String,
      password: data['pass'] as String,
      token: data['token'] as String,
    );
  }

  Map<String, Object> toJson() {
    return {
      'id': id,
      'username': username,
      'pass': password,
      'token': token,
    };
  }

  UserEntity toEntity() {
    return UserEntity(
      id: id,
      username: username,
      password: password,
    );
  }
}
