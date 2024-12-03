import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import '../models/user_model.dart';

class RemoteDataSource {
  final String baseUrl;

  RemoteDataSource(this.baseUrl);

  Future<UserModel?> fetchUser(String username, String password) async {
    try {
      final res = await http.post(
        Uri.parse("$baseUrl/login"),
        headers: {
          'Content-Type': "application/json",
        },
        body: json.encode({
          'username': username,
          'password': password,
        }),
      );
      if (res.statusCode == 200) {
        final data = json.decode(res.body);
        if (data.containsKey('user')) {
          return UserModel.fromJson(data['user']);
        } else {
          log('Error: No user data in response');
          return null;
        }
      } else {
        throw Exception("Failed to login. Status Code: ${res.statusCode}");
      }
    } catch (e) {
      log('Error: $e');
      return null;
    }
  }
}
