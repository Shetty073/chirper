import 'package:flutter/material.dart';

class DialogBoxes {
  static Future<void> infoBox(BuildContext context, String title, String content) async {
    double screenWidth = MediaQuery.of(context).size.width;
    String titleWithEmoji = title + ' 😢';
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            titleWithEmoji,
            style: TextStyle(
              fontSize: (0.08 * screenWidth),
            ),
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                  content,
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                primary: Colors.white,
                backgroundColor: Theme.of(context).primaryColor,
                textStyle: const TextStyle(fontSize: 20),
              ),
              child: Text('Okay'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }


  static Future confirmBox(BuildContext context, String title, String content) async {
    // NOTE: This is a general confirmation dialog box
    // Usage:-
    // * DialogBoxes.confirmBox(context, 'No results found', data['message']).then((value) {
    // *   print(value);
    // * })

    double screenWidth = MediaQuery.of(context).size.width;
    String titleWithEmoji = title + ' 😢';
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            titleWithEmoji,
            style: TextStyle(
              fontSize: (0.08 * screenWidth),
            ),
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                  content,
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                primary: Colors.white,
                backgroundColor: Theme.of(context).primaryColor,
                textStyle: const TextStyle(fontSize: 20),
              ),
              child: Text('Okay'),
              onPressed: () {
                Navigator.pop(context, true);
              },
            ),
            TextButton(
              style: TextButton.styleFrom(
                primary: Theme.of(context).primaryColor,
                backgroundColor: Colors.white,
                textStyle: const TextStyle(fontSize: 20),
              ),
              child: Text('Cancel'),
              onPressed: () {
                Navigator.pop(context, false);
              },
            ),
          ],
        );
      },
    );
  }
}
