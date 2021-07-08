import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ChirpScreen extends StatefulWidget {
  const ChirpScreen({Key? key}) : super(key: key);

  @override
  _ChirpScreenState createState() => _ChirpScreenState();
}

class _ChirpScreenState extends State<ChirpScreen> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.close, color: Colors.blue,),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.blue,
        elevation: 0.0,
        actions: [
          IconButton(
            onPressed: () {
              // send the chirp
            },
            icon: Icon(Icons.add_comment, color: Colors.blue,)
          ),
        ],
      ),
      body: Container(
        margin: EdgeInsets.only(left: 10.0, right: 10.0),
        child: Column(
          children: [
            Container(
              child: Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'What\'s happening?',
                    isCollapsed: true,
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    contentPadding:
                    EdgeInsets.only(bottom: 5, top: 5),
                  ),
                  scrollPadding: EdgeInsets.all(20.0),
                  keyboardType: TextInputType.multiline,
                  autofocus: true,
                  maxLines: null,
                ),
              ),
            ),
            Divider(
              thickness: 3.0,
            ),
            SizedBox(
              height: (screenHeight * 0.05),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(Icons.add_a_photo, color: Colors.blue,),
                    onPressed: () {
                      // open image picker
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.video_camera_back, color: Colors.blue,),
                    onPressed: () {
                      // open video picker
                    },
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
          ],
        ),
      ),
    );
  }
}

