import 'package:http/http.dart';
import 'fixtures_score_remote_data_source.dart';
import 'package:http/http.dart' as http;

class FixturesScoreRemoteDataSourceImpl extends FixturesScoreRemoteDataSource {

FixturesScoreRemoteDataSourceImpl();

  @override
  Future<Response> fixturesAPI({required Map<String, dynamic> parameters}) async{
    final Uri url =
    Uri.https('v3.football.api-sports.io', '/fixtures', parameters);
    final Response response = await http.get(url, headers: {
      'x-rapidapi-host': 'v3.football.api-sports.io',
      'x-rapidapi-key': 'XXXXXXXXXXXXXXXXXXXXXXXXX'
    });
    return response;
  }

}
