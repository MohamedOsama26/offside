import 'dart:convert';
import 'package:http/http.dart';

import '../../domain/repositories/team_repository.dart';
import '../datasources/local/fav_teams_local_data_source_impl.dart';
import '../datasources/remote/fav_teams_remote_data_source_impl.dart';
import '../models/team_object.dart';


class TeamRepositoryImpl extends TeamRepository {
  TeamRepositoryImpl();

  final TeamRemoteDataSourceImpl _remoteDataSource = TeamRemoteDataSourceImpl();
  final TeamLocalDataSourceImpl _localDataSource = TeamLocalDataSourceImpl();

  // Convert teams snapshots to objects with name and logo to use in list
  @override
  Future<List<TeamObject>> teamsAPI({String? search}) async {
    Response res =
        await _remoteDataSource.teamsAPI(parameters: {'search': search});
    List listRes = jsonDecode(res.body)['response'];
    List<TeamObject> teams = listRes.map((e) {
      return TeamObject.fromJson(e);
    }).toList();
    return teams;
  }

  //
  @override
  Future<void> updateLocalFavourites({required List<TeamObject> teams}) async {

    var maps = teams.map((team) {
      // print(team.team.id);
      return team.toJson();
    }).toList();
    await _localDataSource.updateFavourites(maps);
  }

  @override
  Future<List<TeamObject>> readLocalFavourites() async{
    List maps = await _localDataSource.readFavourites();
    List<TeamObject> teamsList = maps.map((team) {
      return TeamObject.fromJson(team);
    }
    ).toList();
    return teamsList;
  }
}
