import 'dart:core';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';
import 'package:offside/features/favourite_teams/data/models/team.dart';
import 'package:offside/features/favourite_teams/data/models/team_venue.dart';


part 'adapters/team_object.g.dart';

@HiveType(typeId: 2)
class TeamObject extends HiveObject {
  @HiveField(0)
  final Team team;

  @HiveField(1)
  final TeamVenue? teamVenue;

  TeamObject({
    required this.team,
    this.teamVenue,
  });

  factory TeamObject.fromJson(Map<String, dynamic> map) {
    return TeamObject(
      team: Team.fromJson(map['team']),
      teamVenue: TeamVenue.fromJson(map['venue']),
    );
  }

  Map<String, dynamic> toJson() => {
        'team': team,
        'venue': teamVenue,
      };
}
