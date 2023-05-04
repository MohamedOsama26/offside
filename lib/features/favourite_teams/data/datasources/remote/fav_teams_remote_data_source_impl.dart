import 'package:http/http.dart';
import 'package:http/http.dart' as http;

import 'fav_teams_remote_data_source.dart';

class TeamRemoteDataSourceImpl extends TeamRemoteDataSource {
  TeamRemoteDataSourceImpl();

  @override
  Future<Response> teamsAPI({required Map<String, dynamic> parameters}) async {
    final Uri url =
        Uri.https('v3.football.api-sports.io', '/teams', parameters);
    final Response response = await http.get(url, headers: {
      'x-rapidapi-host': 'v3.football.api-sports.io',
      'x-rapidapi-key': 'XXXXXXXXXXXXXXXXXXXXXXXXX'
    });
    return response;
  }








}
