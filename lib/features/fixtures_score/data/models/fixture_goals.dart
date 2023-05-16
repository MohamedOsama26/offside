
class FixtureGoals {
  FixtureGoals({this.home,this.away});
  int? home;
  int? away;

  factory FixtureGoals.fromJson(Map<String,dynamic> map)=>FixtureGoals(
    home: map['home'],
    away: map['away'],
  );

  Map<String,dynamic> toJson()=>{
    'home':home,
    'away':away,
  };
}
