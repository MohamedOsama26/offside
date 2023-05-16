import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:offside/features/firebase_auth/bloc/fire_auth_cubit/auth_cubit.dart';
import 'package:offside/features/fixtures_score/bloc/matches_cubit.dart';
import 'package:offside/screens/home_screen.dart';
import 'package:offside/screens/screens/sign_in_screen.dart';
import 'package:offside/utils/bloc_observer.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'features/favourite_teams/bloc/team_cubit.dart';
import 'features/favourite_teams/data/models/team.dart';
import 'features/favourite_teams/data/models/team_object.dart';
import 'features/favourite_teams/data/models/team_venue.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await Hive.initFlutter();
  Hive.registerAdapter(TeamAdapter());
  Hive.registerAdapter(TeamVenueAdapter());
  Hive.registerAdapter(TeamObjectAdapter());
  Bloc.observer = GlobalBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthCubit()),
        BlocProvider(create: (context) => TeamCubit()..readFavourites()),
        BlocProvider(create: (context) => MatchesCubit()..fixturesByDate(dates: [
          DateTime.now().subtract(const Duration(days: 1)),
          DateTime.now(),
          DateTime.now().add(const Duration(days: 1)),
        ])),
      ],
      child: ResponsiveSizer(
          builder: (context, orientation, screenType) => MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Flutter Demo',
              theme: ThemeData(
                colorSchemeSeed: const Color(0xffffb56b),
                useMaterial3: true,
              ),
              home: FirebaseAuth.instance.currentUser != null
                  ? HomeScreen()
                  : SignInScreen())),
    );
  }
}
