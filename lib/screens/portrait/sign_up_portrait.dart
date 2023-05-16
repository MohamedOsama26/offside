import 'package:flutter/material.dart';

import '../../features/firebase_auth/bloc/fire_auth_cubit/auth_cubit.dart';
import '../../features/firebase_auth/presentation/widgets/authentication_form.dart';
import '../../features/firebase_auth/presentation/widgets/social_auth_widget.dart';
import '../../features/firebase_auth/presentation/widgets/welcome_message.dart';
import '../screens/sign_in_screen.dart';


class SignUpPortrait extends StatelessWidget {
  const SignUpPortrait(
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Expanded(
          flex: 2,
          child: WelcomeMessage(
            newUser: true,
          ),
        ),
        Expanded(
          flex: 3,
          child: AuthenticationForm(
            emailController: emailController,
            passwordController: passwordController,
            newUser: true,
            authFunction: () {
              AuthCubit.get(context).signUpEmail(
                  email: emailController.text,
                  password: passwordController.text);
            },
          ),
        ),
        const SizedBox(
          width: double.infinity,
          child: Text(
            'Or sign up with',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xFFFFFFFF),
            ),
          ),
        ),
        const SocialAuth(
          facebook: true,
          google: true,
        ),
        SizedBox(
          width: double.infinity,
          child: TextButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => SignInScreen(),
                ),
              );
            },
            child: const Text(
              'You already have an account? Sign in now',
              style: TextStyle(
                color: Color(0xFFFFFFFF),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
