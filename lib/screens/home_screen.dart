import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:offside/features/firebase_auth/bloc/fire_auth_cubit/auth_cubit.dart';
import 'package:offside/screens/screens/choose_fav_team_screen.dart';
import 'package:offside/screens/screens/sign_in_screen.dart';

import '../features/favourite_teams/bloc/team_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            TextButton(
              onPressed: () {
                AuthCubit.get(context).signOut();
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => SignInScreen()));
              },
              child: const Text('Sign out'),
            ),
            const Text('Hello'),
            TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ChooseFavTeamScreen()));
              },
              child: const Text('UID in PREF'),
            ),
            ElevatedButton(
              onPressed: () {
                TeamCubit.get(context).readFavourites();
              },
              child: const Text('See DB'),
            ),
            Expanded(
              child: BlocConsumer<TeamCubit, TeamState>(
                listener: (context,state){

                },
                builder: (context, state) {
                  if (state is FavouriteTeamSuccess) {
                    return ListView.builder(
                      itemBuilder: (context, index) {
                        return Text(state.teams[index].team.name);
                      },
                      itemCount: state.teams.length,
                    );
                  } else if (state is FavouriteTeamError) {
                    return Center(
                      child: Text(state.error),
                    );
                  } else if (state is FavouriteTeamLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return Center(child: Text('state is : $state'));
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
