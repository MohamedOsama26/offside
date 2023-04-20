import 'package:flutter/material.dart';

class BackgroundResponsiveBuilder extends StatelessWidget {
  const BackgroundResponsiveBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
        builder: (context, orientation) {
          if(orientation == Orientation.portrait) {
            return Column(
              children: [
                Expanded(
                  child: Image.asset(
                    fit: BoxFit.fill,
                    'assets/photos/soccer-players-action-professional-stadium.png',
                  ),
                  // flex: 2,
                ),
                Expanded(
                  child: Container(
                    // color: Colors.red,
                  ),
                  // flex: 3,
                ),
              ],
            );
          }
          else{
            return Row(
              children: [
                Expanded(
                  child: Image.asset(
                    fit: BoxFit.fill,
                    'assets/photos/soccer-players-action-professional-stadium.png',
                  ),
                  // flex: 2,
                ),
                Expanded(
                  child: Container(
                    // color: Colors.red,
                  ),
                  // flex: 3,
                ),
              ],
            );
          }
        }
    );
  }
}
