import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:offside/features/fixtures_score/data/models/fixture.dart';

import '../data/repositories/fixtures_score_repository_impl.dart';

part 'matches_state.dart';

class MatchesCubit extends Cubit<MatchesState> {
  MatchesCubit() : super(MatchesInitial());

  static MatchesCubit get(context) => BlocProvider.of(context);

  final FixturesScoreRepositoryImpl _fixtures = FixturesScoreRepositoryImpl();


  void fixturesByDate({required List<DateTime> dates}){
    emit(LoadingMatches());
    _fixtures.fixtures(dates: dates).then((lists) {
      emit(SuccessMatches(matchesLists: lists));
    }).catchError((error){
      emit(ErrorMatches(error));
    });
  }
}
