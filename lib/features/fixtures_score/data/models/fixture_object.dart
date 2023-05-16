import 'package:offside/features/fixtures_score/data/models/fixture_status.dart';
import 'package:offside/features/fixtures_score/data/models/fixture_venue.dart';
import 'package:offside/features/fixtures_score/data/models/fixture_periods.dart';

class FixtureObject {
  final int id;
  final String? referee;
  final String? timeZone;
  final String date;
  final int? timeStamp;
  final FixturePeriods periods;
  final FixtureVenue venue;
  final FixtureStatus status;

  FixtureObject({
    required this.id,
    required this.venue,
    required this.status,
    required this.date,
    required this.periods,
    this.referee,
    required this.timeStamp,
    required this.timeZone,
  });

  factory FixtureObject.fromJson(Map<String, dynamic> map) => FixtureObject(
        id: map['id'],
        venue: FixtureVenue.fromJson(map['venue']),
        status: FixtureStatus.fromJson(map['status']),
        date: map['date'],
        timeStamp: map['timeStamp'],
        timeZone: map['timeZone'],
        referee: map['referee'],
        periods: FixturePeriods.fromJson(map['periods']),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'venue': venue,
        'status': status,
        'date': date,
        'timeStamp': timeStamp,
        'timeZone': timeZone,
        'referee': referee,
        'periods': periods,
      };
}
