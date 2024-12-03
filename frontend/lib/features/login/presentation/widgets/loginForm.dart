import 'package:cherrystreet/features/home/presentation/pages/homePage.dart';
import 'package:cherrystreet/features/login/presentation/state/userCubit.dart';
import 'package:cherrystreet/features/login/presentation/state/userState.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toastification/toastification.dart';

import '../../../../constants/colors.dart';
import 'inputField.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({
    super.key,
    required this.screenWidth,
    required this.screenHeight,
  });

  final double screenWidth;
  final double screenHeight;

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final formKey = GlobalKey<FormState>();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _isOn = false;

  @override
  Widget build(BuildContext context) {
    return BlocListener<UserCubit, UserState>(
      listenWhen: (prev, current) => current is UserAuthenticationFailed || current is UserAuthenticated,
      listener: (context, userState) {
        if (userState is UserAuthenticationFailed) {
          toastification.show(
            style: ToastificationStyle.simple,
            type: ToastificationType.error,
            autoCloseDuration: const Duration(seconds: 1),
            title: const Text("Login Failed. Please try again"),
          );
        } else if (userState is UserAuthenticated) {
          toastification.show(
            style: ToastificationStyle.fillColored,
            type: ToastificationType.success,
            autoCloseDuration: const Duration(seconds: 1),
            title: const Text("Login Successful"),
          );
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const HomePage(),
            ),
          );
        }
      },
      child: BlocBuilder<UserCubit, UserState>(builder: (context, userState) {
        if (userState is UserLoading) {
          return const Center(
            child: CircularProgressIndicator(
              color: AppColors.primaryClr,
            ),
          );
        } else {
          return Form(
            key: formKey,
            child: Column(
              children: [
                Center(
                  child: Container(
                    width: widget.screenWidth,
                    height: widget.screenHeight / 2.8,
                    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 10,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InputField(
                          label: "Username",
                          controller: usernameController,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        InputField(
                          label: "Password",
                          controller: passwordController,
                          isPassword: true,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          "Forgot Password?",
                          style: TextStyle(
                            color: Colors.blueAccent,
                            decoration: TextDecoration.underline,
                            decorationColor: Colors.blueAccent,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Transform.scale(
                              scale: 0.7,
                              child: CupertinoSwitch(
                                value: _isOn,
                                onChanged: (bool value) {
                                  setState(() {
                                    _isOn = value;
                                  });
                                },
                              ),
                            ),
                            const Text(
                              "Enable Touch ID",
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: widget.screenHeight / 4,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (!formKey.currentState!.validate()) {
                      toastification.show(
                        style: ToastificationStyle.simple,
                        type: ToastificationType.error,
                        autoCloseDuration: const Duration(seconds: 1),
                        title: const Text("Please fill all details"),
                      );
                      return;
                    }
                    context.read<UserCubit>().loginUser(usernameController.text.trim(), passwordController.text.trim());
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 50),
                    backgroundColor: AppColors.primaryClr,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  child: const Text(
                    "Sign in",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          );
        }
      }),
    );
  }
}
