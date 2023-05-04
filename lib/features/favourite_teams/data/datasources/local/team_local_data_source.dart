

abstract class TeamLocalDataSource {

  // Future<void> insertTeams(List<Map<String,dynamic>> teams);
  Future<void> updateFavourites(List<Map<String,dynamic>> teams);


  // Future<List> readTeams();
  Future<List> readFavourites();
}
