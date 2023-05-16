import 'package:hive/hive.dart';
import 'fixture_object.dart';
import 'fixture_score.dart';
import 'fixture_goals.dart';
import 'fixture_league.dart';
import 'fixture_teams.dart';

@HiveType(typeId: 3)
class Fixture {
  Fixture({
    required this.league,
    required this.goals,
    required this.score,
    required this.teams,
    required this.fixture,
});

  @HiveField(0)
  FixtureObject fixture;

  @HiveField(1)
  FixtureLeague league;

  @HiveField(2)
  FixtureTeams teams;

  @HiveField(3)
  FixtureGoals goals;

  @HiveField(4)
  FixtureScore score;



  factory Fixture.fromJson(Map<String,dynamic> map)=> Fixture(
    fixture: FixtureObject.fromJson(map['fixture']),
    league: FixtureLeague.fromJson(map['league']),
    goals: FixtureGoals.fromJson(map['goals']),
    score: FixtureScore.fromJson(map['score']),
    teams: FixtureTeams.fromJson(map['teams']),
  );

  Map<String,dynamic> toJson()=>{
  'fixture':fixture,
  'league': league,
  'goals': goals,
  'score': score,
  'teams': teams,
  };
}