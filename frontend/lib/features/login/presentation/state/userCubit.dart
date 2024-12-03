import 'dart:developer';

import 'package:cherrystreet/features/login/data/repositories/user_repository_impl.dart';
import 'package:cherrystreet/features/login/presentation/state/userState.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserCubit extends Cubit<UserState> {
  final UserRepositoryImpl userRepository;

  UserCubit(this.userRepository) : super(UserInitial());

  Future<void> loginUser(String username, String pass) async {
    emit(
      UserLoading(),
    );
    try {
      final user = await userRepository.fetchUser(username, pass);
      if (user != null) {
        log('User authenticated');
        emit(UserAuthenticated(user));
      } else {
        log('User authentication failed');
        emit(UserAuthenticationFailed());
      }
    } catch (e) {
      log('Error during authentication: $e');
      emit(UserAuthenticationFailed());
    }
  }
}
