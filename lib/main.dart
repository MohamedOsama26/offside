import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:offside/features/firebase_auth/bloc/fire_auth_cubit/auth_cubit.dart';
import 'package:offside/screens/home_screen.dart';
import 'package:offside/screens/screens/sign_in_screen.dart';
import 'package:offside/utils/bloc_observer.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Bloc.observer = GlobalBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (context) => AuthCubit())],
      child: ResponsiveSizer(
          builder: (context, orientation, screenType) => MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Flutter Demo',
              theme: ThemeData(
                colorSchemeSeed: const Color(0xffffb56b),
                useMaterial3: true,
              ),
              home: FirebaseAuth.instance.currentUser != null
                  ? const HomeScreen()
                  : SignInScreen())),
    );
  }
}
