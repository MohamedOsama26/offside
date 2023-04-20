import 'package:flutter/material.dart';

import '../../features/firebase_auth/bloc/fire_auth_cubit/auth_cubit.dart';
import '../../features/firebase_auth/presentation/widgets/authentication_form.dart';
import '../../features/firebase_auth/presentation/widgets/social_auth_widget.dart';
import '../../features/firebase_auth/presentation/widgets/welcome_message.dart';
import '../screens/sign_up_screen.dart';

// import '../../../bloc/fire_auth_cubit/auth_cubit.dart';
// import '../../widgets/authentication_form.dart';
// import '../../widgets/social_auth_widget.dart';
// import '../../widgets/welcome_message.dart';
// import '../sign_up_screen.dart';

class SignInLandSpace extends StatelessWidget {
  const SignInLandSpace({
    Key? key,
    required this.emailController,
    required this.passwordController,
  }) : super(key: key);

  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
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
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const WelcomeMessage(
                newUser: false,
              ),
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
                        builder: (context) => SignUpScreen(),
                      ),
                    );
                  },
                  child: const Text(
                    'Don\'t have an account? Register now',
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
