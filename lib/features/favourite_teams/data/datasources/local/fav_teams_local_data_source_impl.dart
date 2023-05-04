import 'dart:convert';

import 'package:hive/hive.dart';
import 'team_local_data_source.dart';

class TeamLocalDataSourceImpl extends TeamLocalDataSource {
  TeamLocalDataSourceImpl();


  @override
  Future<void> updateFavourites(List<Map<String,dynamic>> teams) async {
    await Hive.openBox('favouriteTeams');
    Box box = Hive.box('favouriteTeams');
    await box.clear();
    box.putAll({'teams':teams});
    Hive.close();
  }

  @override
  Future<List> readFavourites() async{
    await Hive.openBox('favouriteTeams');
    Box box = Hive.box('favouriteTeams');
    List<dynamic> teams = box.get('teams');
    var mappedTeams = teams.map((team) {
         return json.decode(json.encode(team));
    }).toList();
    return mappedTeams;
  }




}