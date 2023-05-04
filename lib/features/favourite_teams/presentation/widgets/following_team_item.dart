import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../bloc/team_cubit.dart';
import '../../data/models/team_object.dart';

class FollowingTeamItem extends StatefulWidget {
  const FollowingTeamItem(
      {Key? key, required this.team,})
      : super(key: key);
  final TeamObject team;

  @override
  State<FollowingTeamItem> createState() => _FollowingTeamItemState();
}

class _FollowingTeamItemState extends State<FollowingTeamItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (TeamCubit.get(context).favouriteIds.contains(widget.team.team.id)) {
          TeamCubit.get(context).unfollowTeam(widget.team);
        } else {
          TeamCubit.get(context).followTeam(widget.team);
        }
        setState(() {});
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
        padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 10.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            (widget.team.team.logo != '')
                ? Image.network(
                    widget.team.team.logo,
                    height: 40.0,
                    width: 40.0,
                  )
                : const SizedBox(
                    width: 40,
                  ),
            const SizedBox(
              width: 8.0,
            ),
            Expanded(
                child: Text(
              widget.team.team.name,
              style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                  color: Color(0x91FFFFFF)),
            )),
            Container(
              height: 28,
              width: 80,
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: TeamCubit.get(context).favouriteIds.contains(widget.team.team.id)
                    ? const Color(0xFF000000)
                    : const Color(0xFFFFFFFF),
              ),
              child: Text(
                TeamCubit.get(context).favouriteIds.contains(widget.team.team.id) ? 'Followed' : 'Follow',
                textAlign: TextAlign.center,
                style: TextStyle(
                  height: 2,
                  fontSize: 14,
                  color: TeamCubit.get(context).favouriteIds.contains(widget.team.team.id)
                      ? const Color(0xFFFFFFFF)
                      : const Color(0xFF000000),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
