import 'package:flutter/material.dart';
import 'package:offside/features/fixtures_score/data/models/score_team.dart';

class TeamScore extends StatelessWidget {
  const TeamScore({Key? key, required this.team,}) : super(key: key);

  final ScoreTeam team;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6.0),
      child: Column(
        children: [
          const SizedBox(height: 8,),
          Image.network(team.logo,width: 50,height: 50,),
          const SizedBox(height: 8,),
          Text(team.name,style: const TextStyle(color: Colors.white,fontSize: 12,),textAlign: TextAlign.center),
          Expanded(child: Text('${team.name} 77\'',style: const TextStyle(color: Color(0x93FFFFFF),fontSize: 10),))

        ],
      ),
    );
  }
}
