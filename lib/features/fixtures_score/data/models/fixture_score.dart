import 'penalty_score.dart';
import 'extra_time_score.dart';
import 'full_time_score.dart';
import 'half_time_score.dart';

class FixtureScore {
  FixtureScore(
      {this.extraTime, this.fullTimeScore, this.halfTimeScore, this.penalty,});
  HalfTimeScore? halfTimeScore;
  FullTimeScore? fullTimeScore;
  ExtraTimeScore? extraTime;
  PenaltyScore? penalty;

  factory FixtureScore.fromJson(Map<String,dynamic> map)=>FixtureScore(
    extraTime: ExtraTimeScore.fromJson(map['halftime']),
    fullTimeScore: FullTimeScore.fromJson(map['fulltime']),
    halfTimeScore: HalfTimeScore.fromJson(map['extratime']),
    penalty: PenaltyScore.fromJson(map['penalty']),
  );


  Map<String,dynamic> toJson()=>
      {
        'extraTime': extraTime?.toJson(),
        'fullTimeScore': fullTimeScore?.toJson(),
        'halfTimeScore': halfTimeScore?.toJson(),
        'penalty': penalty?.toJson(),
      };

}
