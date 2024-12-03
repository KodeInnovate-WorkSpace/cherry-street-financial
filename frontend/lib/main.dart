import 'package:cherrystreet/constants/apptheme.dart';
import 'package:cherrystreet/features/login/data/repositories/user_repository_impl.dart';
import 'package:cherrystreet/features/login/presentation/pages/loginPage.dart';
import 'package:cherrystreet/features/login/presentation/state/userCubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toastification/toastification.dart';

import 'features/login/data/data_sources/remote_data_source.dart';

void main() {
  const String baseUrl = "http://192.168.0.103:3000";
  final remoteDataSource = RemoteDataSource(baseUrl);
  final userRepository = UserRepositoryImpl(remoteDataSource);
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<UserCubit>(
          create: (context) => UserCubit(userRepository),
        ),
      ],
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ToastificationWrapper(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        home: const LoginPage(),
      ),
    );
  }
}
