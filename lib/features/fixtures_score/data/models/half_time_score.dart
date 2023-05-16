class HalfTimeScore {
  HalfTimeScore({this.away, this.home});
  int? home;
  int? away;

  factory HalfTimeScore.fromJson(Map<String, dynamic> map) => HalfTimeScore(
        away: map["home"],
        home: map['away'],
      );

  Map<String, dynamic> toJson() => {
        'home': home,
        'away': away,
      };
}
