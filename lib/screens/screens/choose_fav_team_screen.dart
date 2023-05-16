import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../features/favourite_teams/bloc/team_cubit.dart';
import '../../features/favourite_teams/presentation/widgets/following_team_item.dart';
import '../../features/firebase_auth/presentation/widgets/background_widget.dart';

class ChooseFavTeamScreen extends StatefulWidget {
  const ChooseFavTeamScreen({Key? key}) : super(key: key);

  @override
  State<ChooseFavTeamScreen> createState() => _ChooseFavTeamScreenState();
}

class _ChooseFavTeamScreenState extends State<ChooseFavTeamScreen> {
  final TextEditingController searchTeamController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: const Text(
          'Your teams',
          style: TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.w200),
        ),
        actions: [
          TextButton(
            onPressed: () {
              TeamCubit.get(context).updateFavourites();
              Navigator.pop(context);
            },
            child: const Text(
              'Done',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
        ],
      ),
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xFF000000),
      body: Stack(
        children: [
          const BackgroundResponsiveBuilder(),
          SafeArea(
            child: Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                  child: SizedBox(
                    height: 44,
                    child: Row(
                      children: [
                        Expanded(
                          child: SearchBar(
                            controller: searchTeamController,
                            leading: const Icon(Icons.search),
                            padding: MaterialStateProperty.all(
                                const EdgeInsets.symmetric(
                                    vertical: 0, horizontal: 16)),
                            hintText: 'Search',
                            textStyle: MaterialStateProperty.all(
                                const TextStyle(fontSize: 16, height: 0)),
                          ),
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        SizedBox(
                          width: 44,
                          height: 44,
                          child: FilledButton(
                            style: ButtonStyle(
                                padding: MaterialStateProperty.all(
                                    const EdgeInsets.all(0))),
                            child: const Icon(Icons.search),
                            onPressed: () {
                              if (searchTeamController.text.length > 3) {
                                TeamCubit.get(context).showTeams(
                                    searchTeamController.text.trim());
                              }
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: BlocBuilder<TeamCubit, TeamState>(
                      builder: (context, state) {
                    if (state is FavouriteTeamSuccess) {
                      return ListView.separated(
                          itemBuilder: (context, index) {
                            return FollowingTeamItem(
                              team: state.teams[index],
                            );
                          },
                          separatorBuilder: (context, index) {
                            return const SizedBox(
                              height: 2,
                            );
                          },
                          itemCount: state.teams.length);
                    } else if (state is SearchTeamError) {
                      return Center(
                        child: Text(
                          state.error,
                        ),
                      );
                    } else if (state is SearchTeamLoading) {
                      return const Center(child: CircularProgressIndicator());
                    } else {
                      return const Text('initial');
                    }
                  }),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
