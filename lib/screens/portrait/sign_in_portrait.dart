import 'package:flutter/material.dart';

import '../../features/firebase_auth/bloc/fire_auth_cubit/auth_cubit.dart';
import '../../features/firebase_auth/presentation/widgets/authentication_form.dart';
import '../../features/firebase_auth/presentation/widgets/social_auth_widget.dart';
import '../../features/firebase_auth/presentation/widgets/welcome_message.dart';
import '../screens/sign_up_screen.dart';



class SignInPortrait extends StatelessWidget {
  const SignInPortrait(
      {Key? key,
      required this.emailController,
      required this.passwordController})
      : super(key: key);

  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         const Expanded(
          flex: 2,
          child: WelcomeMessage(
            newUser: false,
          ),
        ),
        Expanded(
          flex: 3,
          child: AuthenticationForm(
              emailController: emailController,
              passwordController: passwordController,
              newUser: false,
              authFunction: () {
                AuthCubit.get(context).signInEmail(
                  email: emailController.text,
                  password: passwordController.text,
                );
              }),
        ),
        const SizedBox(
          width: double.infinity,
          child: Text(
            'Or sign in with',
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
                  builder: (context) => SignUpScreen(),
                ),
              );
            },
            child: const Text(
              'Don\'t have an account? Register now',
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
