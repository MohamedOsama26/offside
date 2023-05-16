import '../../data/models/fixture.dart';

abstract class FixturesScoreRepository {

  Future<List<List<Fixture>>> fixtures({List<DateTime>? dates, DateTime? date,String? team,String? league,int? season,});
}
