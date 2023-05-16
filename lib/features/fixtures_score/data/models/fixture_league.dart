class FixtureLeague {
  FixtureLeague(
      {required this.id,
      required this.name,
      required this.logo,
      required this.country,
      this.flag,
      required this.round,
      required this.season});
  int id;
  String name;
  String country;
  String logo;
  String? flag;
  int season;
  String round;

  factory FixtureLeague.fromJson(Map<String,dynamic> map)=>FixtureLeague(
      id: map['id'],
      name: map['name'],
      logo: map['logo'],
      country: map['country'],
      flag: map['flag'],
      round: map['round'],
      season: map['season'],
  );

  Map<String,dynamic> toJson() => {
    'id':id,
    'name':name,
    'logo':logo,
    'country':country,
    'flag':flag,
    'round':round,
    'season':season,
  };
}
