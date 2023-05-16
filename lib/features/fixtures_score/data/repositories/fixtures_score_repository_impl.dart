import 'dart:convert';

import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:offside/features/fixtures_score/data/datasources/remote/fixtures_score_remote_data_source_impl.dart';
import 'package:offside/features/fixtures_score/data/models/fixture.dart';

import '../../domain/repositories/fixtures_score_repository.dart';

class FixturesScoreRepositoryImpl extends FixturesScoreRepository {
  FixturesScoreRepositoryImpl();
  final FixturesScoreRemoteDataSourceImpl _remoteDataSource =
      FixturesScoreRemoteDataSourceImpl();

  @override
  Future<List<List<Fixture>>> fixtures({
    List<DateTime>? dates,
    DateTime? date,
    String? team,
    String? league,
    int? season,
  }) async {
    List<List<Fixture>> lists = [];
    if(dates != null && dates.isNotEmpty){
      for(var date in dates){
        String fixtureDate = DateFormat('yyy-MM-dd').format(date);
        Map<String, dynamic> parameters = {
          'date': fixtureDate,
          'status' : 'NS-FT-LIVE'
        };
        Response res = await _remoteDataSource.fixturesAPI(parameters: parameters);
        List listRes = jsonDecode(res.body)['response'];
        List<Fixture> fixtures = listRes.map((e) {
          return Fixture.fromJson(e);
        }).toList();
        lists.add(fixtures);
      }
    }
    return lists;
  }
}
