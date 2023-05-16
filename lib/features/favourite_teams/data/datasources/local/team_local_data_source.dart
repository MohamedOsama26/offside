

abstract class TeamLocalDataSource {

  Future<void> updateFavourites(List<Map<String,dynamic>> teams);


  Future<List> readFavourites();
}
