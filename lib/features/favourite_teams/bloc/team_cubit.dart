import 'package:flutter_bloc/flutter_bloc.dart';
import '../data/models/team_object.dart';
import '../data/repositories/team_repository_impl.dart';

part 'teams_state.dart';

class TeamCubit extends Cubit<TeamState> {
  TeamCubit() : super(TeamInitial());

  static TeamCubit get(context) => BlocProvider.of(context);

  final TeamRepositoryImpl _team = TeamRepositoryImpl();

  List<TeamObject> favouriteTeams = [];
  List<int> favouriteIds = [];

  // Save favourite teams to local database
  void updateFavourites() {
    _team.updateLocalFavourites(teams: favouriteTeams);
  }

  // Show searched teams to choose favourite teams
  void showTeams(text) {
    emit(SearchTeamLoading());
    _team.teamsAPI(search: text).then((value) {
      emit(SearchTeamSuccess(value));
    }).catchError((error) {
      emit(SearchTeamError(error.toString()));
    });
  }

  // add to favourite teams list
  void followTeam(TeamObject team) {
    favouriteIds.add(team.team.id);
    favouriteTeams.add(team);
  }

  // Remove from favourite teams list
  void unfollowTeam(TeamObject team) {
    favouriteTeams.removeWhere((element) => element.team.id == team.team.id);
    favouriteIds.remove(team.team.id);
  }

  // Read saved favourite teams
  void readFavourites() {
    emit(FavouriteTeamLoading());
    _team.readLocalFavourites().then((teams) {
      emit(FavouriteTeamSuccess(teams));
    }).catchError((error) {
      emit(FavouriteTeamError(error.toString()));
    });
  }
}
