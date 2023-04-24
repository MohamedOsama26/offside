import 'package:flutter/material.dart';
import 'package:offside/features/firebase_auth/bloc/fire_auth_cubit/auth_cubit.dart';
import 'package:offside/screens/screens/sign_in_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextButton(
              onPressed: () {
                AuthCubit.get(context).signOut();
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => SignInScreen()));
              },
              child: const Text('Sign out')),
          const Text('Hello'),
          TextButton(onPressed: () {}, child: const Text('UID in PREF')),
        ],
      ),
    );
  }
}
