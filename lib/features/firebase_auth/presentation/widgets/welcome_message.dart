import 'package:flutter/material.dart';

class WelcomeMessage extends StatelessWidget {
  const WelcomeMessage({Key? key,required this.newUser}) : super(key: key);
  final bool newUser;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.start ,children: [
        Text(
          'Welcome to\nOffside.',
          textAlign: TextAlign.left,
          style: TextStyle(
            fontSize: Theme.of(context).textTheme.displayMedium?.fontSize,
            color: const Color(0xFFFFFFFF),
          ),
        ),
        Text(
          newUser?'Create your account now...':'Enter your email and password\n to sign in now...',
          textAlign: TextAlign.left,
          style: TextStyle(
            height: 2,
            fontSize: Theme.of(context).textTheme.labelLarge?.fontSize,
            color: const Color(0xFFFFFFFF),
          ),
        )
      ]),
    );
  }
}
