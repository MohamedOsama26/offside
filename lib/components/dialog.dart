import 'package:flutter/material.dart';

class DialogMessage extends StatelessWidget {
  const DialogMessage({Key? key, required this.message}) : super(key: key);
  final String message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: Colors.white,
        ),
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
        margin: const EdgeInsets.symmetric(horizontal: 28.0),
        // width: MediaQuery.of(context).size.width*0.8,
        // height: MediaQuery.of(context).size.height*0.2,
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          // direction: Axis.vertical,
          children: [
            Text('SOMETHING WENT WRONG',
                style: TextStyle(
                    fontSize: Theme.of(context).textTheme.titleMedium?.fontSize,
                    fontWeight: FontWeight.bold)),
            const SizedBox(
              height: 8,
            ),
            Text(
                message,
                textAlign: TextAlign.center),
            const SizedBox(
              height: 8,
            ),
            FilledButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            )
          ],
        ),
      ),
    );
  }
}
