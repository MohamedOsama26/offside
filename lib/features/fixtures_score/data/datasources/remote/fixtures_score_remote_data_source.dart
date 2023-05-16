import 'package:http/http.dart';
abstract class FixturesScoreRemoteDataSource {

  Future<Response> fixturesAPI({required Map<String, dynamic> parameters});
}
