import 'package:cherrystreet/features/login/data/models/user_model.dart';

abstract class UserState {}

class UserInitial extends UserState {}

class UserLoading extends UserState {}

class UserAuthenticated extends UserState {
  final UserModel user;

  UserAuthenticated(this.user);
}

class UserAuthenticationFailed extends UserState {}
