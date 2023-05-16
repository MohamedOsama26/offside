import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../favourite_teams/bloc/team_cubit.dart';
import '../../bloc/matches_cubit.dart';
import 'today_fixture_score.dart';

class FollowedMatchesList extends StatelessWidget {
  const FollowedMatchesList({Key? key, required this.favouriteIds}) : super(key: key);

  final List<int> favouriteIds;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MatchesCubit, MatchesState>(
      listener: (context, state) {
        TeamCubit.get(context).readFavourites();
      },
      builder: (context, state) {
        if (state is SuccessMatches) {
          return SizedBox(
            height: 190,
            child: ListView.builder(
              itemBuilder: (context, index) {
                if (favouriteIds.contains(state.matchesLists[1][index].teams.home.id) ||
                    favouriteIds.contains(state.matchesLists[1][index].teams.away.id)) {
                  return FixtureScore(
                    match: state.matchesLists[1][index],
                    homeTeam: state.matchesLists[1][index].teams.home,
                    awayTeam: state.matchesLists[1][index].teams.away,
                  );
                }
                return const SizedBox(
                  width: 0,
                );
              },
              itemCount: state.matchesLists[1].length,
              scrollDirection: Axis.horizontal,
            ),
          );
        } else if (state is ErrorMatches) {
          return Center(
            child: Text(
              state.error.toString(),
              style: const TextStyle(color: Colors.white),
            ),
          );
        } else if (state is LoadingMatches) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return Center(child: Text('state is : $state'));
        }
      },
    );
  }
}
