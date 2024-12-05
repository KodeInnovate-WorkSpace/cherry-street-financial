import 'package:cherrystreet/constants/apptheme.dart';
import 'package:cherrystreet/features/advisor/data/repositories/advisor_repository_impl.dart';
import 'package:cherrystreet/features/advisor/presentation/state/advisorCubit.dart';
import 'package:cherrystreet/features/home/data/data_sources/transaction_remote_datasource.dart';
import 'package:cherrystreet/features/home/data/repositories/transaction_repository_impl.dart';
import 'package:cherrystreet/features/home/presentation/state/transactionCubit.dart';
import 'package:cherrystreet/features/login/data/repositories/user_repository_impl.dart';
import 'package:cherrystreet/features/login/presentation/pages/loginPage.dart';
import 'package:cherrystreet/features/login/presentation/state/userCubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toastification/toastification.dart';

import 'constants/baseUrl.dart';
import 'features/advisor/data/data_sources/remote_datasource.dart';
import 'features/login/data/data_sources/remote_data_source.dart';

void main() {
  final remoteDataSource = RemoteDataSource(baseUrl);
  final userRepository = UserRepositoryImpl(remoteDataSource);
  final advisorRemoteDataSource = AdvisorRemoteDataSource(baseUrl);
  final advisorRepository = AdvisorRepositoryImpl(advisorRemoteDataSource);
  final transactionRemoteDataSource = TransactionRemoteDataSource();
  final transactionRepository = TransactionRepositoryImpl(transactionRemoteDataSource);
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<UserCubit>(
          create: (context) => UserCubit(userRepository),
        ),
        BlocProvider<AdvisorCubit>(
          create: (context) => AdvisorCubit(advisorRepository),
        ),
        BlocProvider<TransactionCubit>(
          create: (context) => TransactionCubit(transactionRepository),
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
