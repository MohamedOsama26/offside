class FixturePeriods{
  int? first;
  int? second;

  FixturePeriods({
    this.first,
    this.second,
});

  factory FixturePeriods.fromJson(Map<String,dynamic> map)=>FixturePeriods(
    first: map['first'],
    second: map['second'],
  );

  Map<String,dynamic> toJson()=>{
    'first': first,
    'second':second,
  };
}