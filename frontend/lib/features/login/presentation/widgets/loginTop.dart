import 'package:flutter/material.dart';
import '../../../../constants/colors.dart';

class LoginTop extends StatelessWidget {
  const LoginTop({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 80,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50),
              ),
              child: Center(
                child: Container(
                  width: 45,
                  height: 45,
                  decoration: BoxDecoration(
                    color: AppColors.primaryClr,
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: const TextSpan(
                    text: "CHERRY STREET\n",
                    style: TextStyle(
                      fontSize: 22,
                      fontFamily: "Bitsumishi-Regular",
                      color: AppColors.txtClr,
                      height: 1.0,
                    ),
                    children: [
                      TextSpan(
                        text: "F   I   N   A   N   C   I   A   L",
                        style: TextStyle(
                          fontSize: 8,
                          fontFamily: "Bitsumishi-Regular",
                          color: AppColors.txtClr,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        const Text(
          "Sign in",
          style: TextStyle(
            color: AppColors.txtClr,
            fontFamily: 'PoppinsSemiBold',
            fontSize: 35,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
