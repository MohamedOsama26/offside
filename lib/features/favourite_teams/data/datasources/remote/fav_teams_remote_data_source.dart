import 'package:http/http.dart';

abstract class TeamRemoteDataSource {

  //Get data snapshot from API
  Future<Response> teamsAPI({required Map<String, dynamic> parameters});

}
