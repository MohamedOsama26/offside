part of 'matches_cubit.dart';

abstract class MatchesState {}

class MatchesInitial extends MatchesState {}

class LoadingMatches extends MatchesState {}

class SuccessMatches extends MatchesState {
  final List<List<Fixture>> matchesLists;
  SuccessMatches({required this.matchesLists});
}

class ErrorMatches extends MatchesState {
  final String error;
  ErrorMatches(this.error);
}