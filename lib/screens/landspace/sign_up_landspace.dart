import 'package:flutter/material.dart';

import '../../features/firebase_auth/bloc/fire_auth_cubit/auth_cubit.dart';
import '../../features/firebase_auth/presentation/widgets/authentication_form.dart';
import '../../features/firebase_auth/presentation/widgets/social_auth_widget.dart';
import '../../features/firebase_auth/presentation/widgets/welcome_message.dart';
import '../screens/sign_in_screen.dart';

// import '../../../bloc/fire_auth_cubit/auth_cubit.dart';
// import '../../widgets/authentication_form.dart';
// import '../../widgets/social_auth_widget.dart';
// import '../../widgets/welcome_message.dart';
// import '../sign_in_screen.dart';

class SignUpLandSpace extends StatelessWidget {
  const SignUpLandSpace(
      {Key? key,
      required this.emailController,
      required this.passwordController,
      required this.confirmPasswordController})
      : super(key: key);

  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: AuthenticationForm(
            emailController: emailController,
            passwordController: passwordController,
            confirmPasswordController: confirmPasswordController,
            newUser: true,
            authFunction: () {
              AuthCubit.get(context).signUpEmail(
                  email: emailController.text,
                  password: passwordController.text);
            },
          ),
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const WelcomeMessage(newUser: true),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 4.0),
                child: SocialAuth(
                  facebook: true,
                  google: true,
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SignInScreen()));
                  },
                  child: const Text(
                    'You already have an account? Sign in now',
                    style: TextStyle(color: Color(0xFFFFFFFF)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
