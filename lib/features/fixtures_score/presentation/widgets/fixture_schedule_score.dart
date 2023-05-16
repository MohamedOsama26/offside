import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:offside/features/fixtures_score/data/models/fixture.dart';

class FixtureScheduleScore extends StatelessWidget {
  const FixtureScheduleScore({Key? key, required this.match}) : super(key: key);
  final Fixture match;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: const Color(0x349D9D9D),
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 16),
            decoration: const BoxDecoration(
                color: Color(0x279D9D9D),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12))),
            child:  Row(
              children: [
                Text(
                  match.league.name,
                  style: const TextStyle(fontSize: 12, color: Color(0xBBFFFFFF)),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Text(
                    match.teams.home.name,
                    style: const TextStyle(fontSize: 12, color: Color(0x73FFFFFF),
                    ),
                    textAlign: TextAlign.right,
                  ),
                ),
                const SizedBox(width: 4,),
                Expanded(
                  child: Image.network(
                    match.teams.home.logo,
                    width: 40,
                    height: 40,
                  ),
                ),
                if(match.fixture.status.longStatus == 'Not Started')
                Expanded(
                  flex: 2,
                  child: Text(
                    DateFormat('h:mm a').format(DateTime.parse(match.fixture.date).toLocal()).toString(),
                    textAlign: TextAlign.center,
                    style: const TextStyle(

                      fontSize: 12,
                      color: Color(0xC0FFFFFF),
                    ),
                  ),
                ),
                if(match.fixture.status.longStatus == 'Match Finished')
                  Expanded(
                    flex: 2,
                    child: Text(
                      '${match.goals.home} - ${match.goals.away}',
                      textAlign: TextAlign.center,
                      style: const TextStyle(

                        fontSize: 12,
                        color: Color(0xC0FFFFFF),
                      ),
                    ),
                  ),
                Expanded(
                  child: Image.network(
                    match.teams.away.logo,
                    width: 40,
                    height: 40,
                  ),
                ),
                const SizedBox(width: 4,),
                Expanded(
                  flex: 2,
                  child: Text(
                    match.teams.away.name,
                    style: const TextStyle(fontSize: 12, color: Color(0x73FFFFFF)),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
