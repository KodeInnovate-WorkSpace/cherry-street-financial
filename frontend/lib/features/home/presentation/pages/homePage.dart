import 'package:cherrystreet/constants/colors.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.backgroundClr,
      body: Center(
        child: Text(
          "Home Page",
          style: TextStyle(
            fontSize: 35,
            fontFamily: 'PoppinsBlack',
          ),
        ),
      ),
    );
  }
}
