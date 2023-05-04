import 'package:http/http.dart';

abstract class TeamRemoteDataSource {

  //Get data snapshot from API
  Future<Response> teamsAPI({required Map<String, dynamic> parameters});


  //search for ids in global API () to save into local database
  // Future<Response> teamsIds({required List<String> teams});
}
