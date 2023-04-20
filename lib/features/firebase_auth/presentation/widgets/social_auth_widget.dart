import 'package:flutter/material.dart';
import 'package:offside/features/firebase_auth/bloc/fire_auth_cubit/auth_cubit.dart';

class SocialAuth extends StatelessWidget {
  const SocialAuth(
      {Key? key,
      this.google,
      this.facebook,
      this.github,
      this.apple,
      this.microsoft,
      this.twitter,
      this.phone})
      : super(key: key);
  final bool? google;
  final bool? facebook;
  final bool? github;
  final bool? apple;
  final bool? microsoft;
  final bool? twitter;
  final bool? phone;



  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          if(facebook==true)
          Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              color: const Color(0xE4001DFF),
              child: TextButton(
                  onPressed: () {
                    AuthCubit.get(context).signInFacebook();
                  },
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.facebook,
                        color: Color(0xFFFFFFFF),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        'Facebook',
                        style: TextStyle(color: Color(0xFFFFFFFF)),
                      ),
                    ],
                  )),
            ),
          ),
          if(google==true)
          Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              color: const Color(0xFFFFFFFF),
              child: TextButton(
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/icons/google.png', width: 24),
                      const SizedBox(
                        width: 8,
                      ),
                      const Text('Google',
                          style: TextStyle(color: Color(0xFF000000))),
                    ],
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
