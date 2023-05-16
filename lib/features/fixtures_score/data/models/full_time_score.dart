class FullTimeScore {
  FullTimeScore({
    this.away,
    this.home,
  });
  int? home;
  int? away;

  factory FullTimeScore.fromJson(Map<String, dynamic> map) => FullTimeScore(
        away: map["home"],
        home: map['away'],
      );

  Map<String, dynamic> toJson() => {
        'home': home,
        'away': away,
      };
}
