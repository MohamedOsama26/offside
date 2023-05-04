part of 'team_cubit.dart';


abstract class TeamState {}

class TeamInitial extends TeamState {}


class SearchTeamLoading extends TeamState {}
class SearchTeamSuccess extends TeamState {
  final List<TeamObject> teams;
  SearchTeamSuccess(this.teams);
}
class SearchTeamError extends TeamState {
  final String error;
  SearchTeamError(this.error);
}

class FavouriteTeamLoading extends TeamState {}
class FavouriteTeamSuccess extends TeamState {
  final List<TeamObject> teams;
  FavouriteTeamSuccess(this.teams);
}
class FavouriteTeamError extends TeamState {
  final String error;
  FavouriteTeamError(this.error);
}