import 'package:flutter/material.dart';
import 'package:offside/features/firebase_auth/presentation/widgets/background_widget.dart';
import '../landspace/sign_in_landspace.dart';
import '../portrait/sign_in_portrait.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({Key? key}) : super(key: key);

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

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
                  return SignInLandSpace(
                    emailController: _emailController,
                    passwordController: _passwordController,
                  );
                } else {
                  return SignInPortrait(
                    emailController: _emailController,
                    passwordController: _passwordController,
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
