class TeamListTile {
  final int id;
  final String name;
  final String? shortName;
  final String? image;

  TeamListTile({
    required this.name,
    required this.id,
    required this.image,
    required this.shortName
});

  factory TeamListTile.fromJson(Map<String,dynamic> map) => TeamListTile(
    id: map['ID'],
    image: map['ImageURL'],
    name: map['Name'],
    shortName: map['ShortName'],
  );
}