import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:offside/components/side_menu.dart';
import 'package:offside/features/favourite_teams/bloc/team_cubit.dart';
import 'package:offside/features/firebase_auth/bloc/fire_auth_cubit/auth_cubit.dart';
import 'package:offside/features/firebase_auth/presentation/widgets/background_widget.dart';
import 'package:offside/features/fixtures_score/bloc/matches_cubit.dart';
import 'package:offside/features/fixtures_score/presentation/widgets/fixture_schedule_score.dart';
import 'package:offside/features/fixtures_score/presentation/widgets/followed_matches_list.dart';
import 'package:offside/screens/screens/sign_in_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: const SideMenu(),
      backgroundColor: const Color(0xFF000000),
      body: Stack(
        children: [
          const BackgroundResponsiveBuilder(),
          SafeArea(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(
                    height: 64,
                  ),
                  BlocBuilder<TeamCubit, TeamState>(
                    builder: (context, state) {
                      if (state is FavouriteTeamSuccess) {
                        return FollowedMatchesList(
                            favouriteIds: TeamCubit.get(context).favouriteIds);
                      } else if (state is FavouriteTeamError) {
                        return Text(
                          state.error,
                          style: const TextStyle(color: Colors.white),
                        );
                      }
                      return Text(
                        state.toString(),
                        style: const TextStyle(color: Colors.white),
                      );
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  BlocBuilder<MatchesCubit, MatchesState>(
                    builder: (context, state) {
                      if (state is SuccessMatches) {
                        return Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    'Yesterday',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16),
                                  ),
                                  SizedBox(
                                      height: 30,
                                      child: TextButton(
                                          onPressed: () {},
                                          child: const Text(
                                            'See all',
                                            style: TextStyle(fontSize: 12),
                                          )))
                                ],
                              ),
                            ),
                            ListView.builder(
                              physics: const ScrollPhysics(),
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return FixtureScheduleScore(
                                  match: state.matchesLists[0][index],
                                );
                              },
                              itemCount: 5,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    'Today',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16),
                                  ),
                                  SizedBox(
                                      height: 30,
                                      child: TextButton(
                                          onPressed: () {},
                                          child: const Text(
                                            'See all',
                                            style: TextStyle(fontSize: 12),
                                          )))
                                ],
                              ),
                            ),
                            ListView.builder(
                              physics: const ScrollPhysics(),
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return FixtureScheduleScore(
                                  match: state.matchesLists[1][index],
                                );
                              },
                              itemCount: 5,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    'Tomorrow',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16),
                                  ),
                                  SizedBox(
                                      height: 30,
                                      child: TextButton(
                                          onPressed: () {},
                                          child: const Text(
                                            'See all',
                                            style: TextStyle(fontSize: 12),
                                          )))
                                ],
                              ),
                            ),
                            ListView.builder(
                              physics: const ScrollPhysics(),
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return FixtureScheduleScore(
                                  match: state.matchesLists[2][index],
                                );
                              },
                              itemCount: 5,
                            ),
                          ],
                        );
                      }
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                  ),
                  const SizedBox(
                    height: 80,
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding:
                const EdgeInsets.only(right: 12, left: 12, top: 30, bottom: 8),
            decoration: BoxDecoration(
                color: const Color(0xFF000000),
                borderRadius: BorderRadius.circular(16)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.menu,
                    size: 40,
                    color: Color(0xD5FFFFFF),
                  ),
                  onPressed: () {
                    _scaffoldKey.currentState?.openDrawer();
                  },
                ),
                IconButton(
                  onPressed: () {
                    AuthCubit.get(context).signOut();
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SignInScreen()));
                  },
                  icon: const Icon(
                    Icons.output,
                    size: 32,
                    color: Color(0xD5FFFFFF),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
