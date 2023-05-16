

class FixtureStatus {
  String longStatus;
  String shortStatus;
  int? elapsed;

  FixtureStatus(
      {required this.shortStatus,
      this.elapsed,
      required this.longStatus});


  factory FixtureStatus.fromJson(Map<String,dynamic> map) => FixtureStatus(
      longStatus: map['long'],
      shortStatus: map['short'],
      elapsed: map['elapsed'],
  );

  Map<String,dynamic> toJson()=>{
    'long':longStatus,
    'short':shortStatus,
    'elapsed':elapsed,
  };
}