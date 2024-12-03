import 'package:cherrystreet/constants/colors.dart';
import 'package:cherrystreet/features/login/presentation/widgets/loginTop.dart';
import 'package:flutter/material.dart';
import '../widgets/loginForm.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.backgroundClr,
      body: Stack(
        children: [
          Container(
            width: screenWidth,
            height: screenHeight / 2.5,
            decoration: const BoxDecoration(
              color: AppColors.primaryClr,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const LoginTop(),
                  LoginForm(
                    screenWidth: screenWidth,
                    screenHeight: screenHeight,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
