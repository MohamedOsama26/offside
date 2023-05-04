import 'package:hive_flutter/hive_flutter.dart';

part 'adapters/team_venue.g.dart';

@HiveType(typeId: 1)
class TeamVenue extends HiveObject{

  @HiveField(0)
  final int? id;

  @HiveField(1)
  final String? name;

  @HiveField(3)
  final String? address;

  @HiveField(4)
  final String? city;

  @HiveField(5)
  final int? capacity;

  @HiveField(6)
  final String? surface;

  @HiveField(7)
  final String? image;


  TeamVenue(
      { this.id,
       this.name,
       this.address,
       this.city,
       this.capacity,
       this.surface,
       this.image});

  factory TeamVenue.fromJson(Map<String,dynamic> map)=>
     TeamVenue(
        id: map['id'],
        name: map['name'],
        address: map['address'],
        city: map['city'],
        capacity: map['capacity'],
        surface: map['surface'],
        image: map['image']);


  Map<String,dynamic> toJson()=>
     {
      'id':id,
       'name':name,
       'address':address,
       'city':city,
       'capacity':capacity,
       'surface':surface,
       'image':image,
    };

}
