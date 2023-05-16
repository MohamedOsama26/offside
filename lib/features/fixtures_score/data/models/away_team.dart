class AwayTeam {
  int id;
  String name;
  String logo;
  bool? winner;

  AwayTeam({
    required this.logo,
    required this.name,
    required this.id,
    this.winner,
  });

  factory AwayTeam.fromJson(Map<String,dynamic> map)=>AwayTeam(
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
