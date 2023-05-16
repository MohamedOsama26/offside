class FixtureVenue {
  FixtureVenue({
    required this.id,
    required this.name,
    required this.city,
  });
  int? id;
  String? name;
  String? city;

  factory FixtureVenue.fromJson(Map<String, dynamic> map) => FixtureVenue(
        id: map['id'],
        name: map['name'],
        city: map['city'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'city': city,
      };
}
