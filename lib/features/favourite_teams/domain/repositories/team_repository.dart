import '../../data/models/team_object.dart';


abstract class TeamRepository {

  // Convert teams snapshots to objects with name and logo to use in favourite list
  Future<List<TeamObject>> teamsAPI({String? search});

  // update teams into local database
  Future<void> updateLocalFavourites({required List<TeamObject> teams});

  //Get favourite teams from DB
  Future<List<TeamObject>> readLocalFavourites();


}
