
import 'package:offside/features/fixtures_score/data/models/score_team.dart';

class FixtureTeams {
  ScoreTeam home;
  ScoreTeam away;

  FixtureTeams({
    required this.home,
    required this.away,
  });

  factory FixtureTeams.fromJson(Map<String,dynamic> map)=>FixtureTeams(
    home: ScoreTeam.fromJson(map['home']),
    away: ScoreTeam.fromJson(map['away']),
  );

  Map<String,dynamic> toJson()=>{
    'home':home,
    'away':away,
  };
}
