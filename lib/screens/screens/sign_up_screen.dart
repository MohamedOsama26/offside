import 'package:flutter/material.dart';
import 'package:offside/features/firebase_auth/presentation/widgets/background_widget.dart';


import '../landspace/sign_up_landspace.dart';
import '../portrait/sign_up_portrait.dart';


class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xB6000000),
      body: Stack(
        children: [
          const BackgroundResponsiveBuilder(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12),
            child: OrientationBuilder(
              builder: (context, orientation) {
                if (orientation == Orientation.landscape) {
                  return SignUpLandSpace(
                    emailController: emailController,
                    confirmPasswordController: confirmPasswordController,
                    passwordController: passwordController,
                  );
                } else {
                  return SignUpPortrait(
                    emailController: emailController,
                    confirmPasswordController: confirmPasswordController,
                    passwordController: passwordController,
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
