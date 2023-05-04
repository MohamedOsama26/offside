import 'dart:core';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';

part 'adapters/team.g.dart';

@HiveType(typeId: 0)
class Team extends HiveObject {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String? code;

  @HiveField(3)
  final bool national;

  @HiveField(4)
  final String country;

  @HiveField(5)
  final String logo;

  @HiveField(6)
  final int? founded;

  Team({
    required this.id,
    required this.name,
    this.code,
    required this.country,
    required this.logo,
    required this.national,
    this.founded,
  });

  factory Team.fromJson(Map<String, dynamic> map) {
    return Team(
        id: map['id'],
        name: map['name'],
        country: map['country'],
        logo: map['logo'],
        national: map['national'],
        code: map['code'],
        founded: map['founded']);
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'country': country,
        'logo': logo,
        'national': national,
        'code': code,
        'founded': founded,
      };
}
