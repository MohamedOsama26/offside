class ScoreTeam {
  int id;
  String name;
  String logo;
  bool? winner;

  ScoreTeam({
    required this.logo,
    required this.name,
    required this.id,
    this.winner,
  });

  factory ScoreTeam.fromJson(Map<String,dynamic> map)=>ScoreTeam(
      logo: map['logo'],
      name: map['name'],
      id: map['id'],
    winner: map['winner'],
  );

  Map<String,dynamic> toJson()=>{
    'logo':logo,
    'name':name,
    'id':id,
    'winner':winner,
  };
}
