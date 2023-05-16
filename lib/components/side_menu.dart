import 'package:flutter/material.dart';

import '../screens/screens/choose_fav_team_screen.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color(0xFF000000),
      shadowColor: const Color(0xFFFFFFFF),
      elevation: 10,
      child: Container(
        decoration: const BoxDecoration(
            border: Border.symmetric(
          vertical: BorderSide(color: Color(0xFF7C7C7C)),
        )),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                Row(
                  children: [
                    const Text(
                      'Offside',
                      style: TextStyle(
                          color: Color(0xD5FFFFFF), fontSize: 50, height: 1.1),
                      textAlign: TextAlign.end,
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Image.asset(
                      'assets/icons/whistle.png',
                      height: 50,
                      width: 50,
                    )
                  ],
                ),
                const Divider(
                  color: Color(0xFFFFFFFF),
                ),
                TextButton(
                  onPressed: () {},
                  child: Row(
                    children: [
                      Image.asset('assets/icons/soccer.png',width: 35,height: 35,),
                      const Text(
                        'Leagues',
                        textAlign: TextAlign.start,
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Row(
                    children: [
                      Image.asset('assets/icons/countries.png',width: 35,height: 35,),
                      const Text(
                        'Countries',
                        textAlign: TextAlign.start,
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ChooseFavTeamScreen(),
                      ),
                    );
                  },
                  child: Row(
                    children: [
                      Image.asset('assets/icons/soccer-player.png',width: 30,height: 30,),
                      const SizedBox(width: 8,),
                      const Text(
                        'Teams',
                        textAlign: TextAlign.start,
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Row(
                    children: [
                      Image.asset('assets/icons/calendar.png',width: 30,height: 30,),
                      const SizedBox(width: 8,),
                      const Text(
                        'Matches',
                        textAlign: TextAlign.start,
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Row(
                    children: [
                      Image.asset('assets/icons/soccer-jersey.png',width: 35,height: 35,),
                      const SizedBox(width: 8,),
                      const Text(
                        'Players',
                        textAlign: TextAlign.start,
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
