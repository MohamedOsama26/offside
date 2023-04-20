import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:offside/features/firebase_auth/bloc/fire_auth_cubit/auth_cubit.dart';
import 'package:offside/screens/screens/sign_up_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

// import 'features/firebase_auth/presentation/screens/sign_up_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=> AuthCubit())
      ],
      child: ResponsiveSizer(
        builder: (context, orientation, screenType) =>
            MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Flutter Demo',
              theme: ThemeData(
                colorSchemeSeed: Color(0xffffb56b),
                useMaterial3: true,
              ),
              home: SignUpScreen(),
            ),
      ),
    );
  }
}
