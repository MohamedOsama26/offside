import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:offside/components/dialog.dart';
import 'package:offside/features/firebase_auth/bloc/fire_auth_cubit/auth_cubit.dart';
import 'package:offside/features/firebase_auth/presentation/widgets/background_widget.dart';
import 'package:offside/screens/home_screen.dart';
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
            child: BlocConsumer<AuthCubit, AuthState>(
              listener: (context, state) {
                if(state is AuthError) {
                  showDialog(context: context, builder: (_) {
                    return DialogMessage(message: state.errorContent,);
                  });
                }else if(state is AuthSuccess){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder:(context)=> const HomeScreen() ) );
                }
              },
              builder: (context, state) {
                if(state is AuthLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return OrientationBuilder(
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
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
