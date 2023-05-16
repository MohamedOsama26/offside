class PenaltyScore {
  PenaltyScore({this.away, this.home});

  int? home;
  int? away;

  factory PenaltyScore.fromJson(Map<String, dynamic> map) => PenaltyScore(
        away: map["home"],
        home: map['away'],
      );

  Map<String, dynamic> toJson() => {
        'home': home,
        'away': away,
      };
}
