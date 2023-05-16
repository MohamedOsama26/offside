import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:offside/constants/gradient_colors.dart';
import 'package:offside/features/fixtures_score/presentation/widgets/team_score.dart';
import '../../data/models/fixture.dart';
import '../../data/models/score_team.dart';

class FixtureScore extends StatelessWidget {
  const FixtureScore(
      {Key? key,
      required this.homeTeam,
      required this.awayTeam,
      required this.match})
      : super(key: key);
  final ScoreTeam homeTeam;
  final ScoreTeam awayTeam;
  final Fixture match;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280,
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 12),
      margin: const EdgeInsets.only(bottom: 10, right: 10,left: 10),
      foregroundDecoration: match.fixture.status.longStatus == 'Match Finished'
          ? const BoxDecoration(
              color: Color(0xC0000000),
            )
          : null,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        gradient: match.fixture.status.longStatus == 'Match Finished'
            ? scoreBoxDarkenGrad
            : scoreBoxGrad,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(child: TeamScore(team: homeTeam)),
          SizedBox(
            width: 80,
            child: Builder(builder: (context) {
              switch (match.fixture.status.longStatus) {
                case 'Not Started':
                  {
                    return Text(
                        "${match.fixture.status.longStatus}\n${DateFormat('h:mm a').format(DateTime.parse(match.fixture.date).toLocal()).toString()}",
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          height: 1.5,
                          fontSize: 14,
                          color: Color(0xC0FFFFFF),
                        ));
                  }
                case 'Match Finished':
                  {
                    return Text(
                        "${match.fixture.status.longStatus}\n${match.goals.home} - ${match.goals.away}");
                  }
              }
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (match.fixture.status.longStatus == 'Not Started')
                    if (match.fixture.status.longStatus == 'First Half' ||
                        match.fixture.status.longStatus == 'Second Half')
                      Text(match.fixture.status.elapsed.toString(),
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 15,
                            color: Color(0xFFFFFFFF),
                          )),
                  Text(
                    match.fixture.status.longStatus.toString(),
                    style: const TextStyle(color: Colors.white),
                  )
                ],
              );
            }),
          ),
          Expanded(child: TeamScore(team: awayTeam)),
        ],
      ),
    );
  }
}
