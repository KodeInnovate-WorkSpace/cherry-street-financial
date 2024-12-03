import 'dart:convert';

import 'package:cherrystreet/features/login/data/data_sources/remote_data_source.dart';
import 'package:cherrystreet/features/login/data/models/user_model.dart';
import 'package:http/http.dart' as http;

import '../../domain/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final RemoteDataSource remoteDataSource;

  UserRepositoryImpl(this.remoteDataSource);

  @override
  Future<UserModel?>? fetchUser(String username, String password) async {
    try {
      return await remoteDataSource.fetchUser(username, password);
    } catch (e) {
      print('Error: $e');
      return null;
    }
  }
}
