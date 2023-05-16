class ExtraTimeScore {
  ExtraTimeScore({this.home, this.away});
  int? home;
  int? away;

  factory ExtraTimeScore.fromJson(Map<String, dynamic> map) => ExtraTimeScore(
        away: map["home"],
        home: map['away'],
      );

  Map<String, dynamic> toJson() => {
        'home': home,
        'away': away,
      };
}
