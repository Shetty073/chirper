import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class ChirpScreen extends StatefulWidget {
  const ChirpScreen({Key? key}) : super(key: key);

  @override
  _ChirpScreenState createState() => _ChirpScreenState();
}

class _ChirpScreenState extends State<ChirpScreen> {
  final _picker = ImagePicker();
  TextEditingController chirpTextController = TextEditingController();
  PickedFile? pickedFile;

  void handleImagePick() async {
    pickedFile = await _picker.getImage(
      source: ImageSource.camera,
    );

    // TODO; Complete this
    // TODO: Next - Complete posting chirp to backend
    print(pickedFile);
  }

  @override
  void dispose() {
    super.dispose();
    chirpTextController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.close, color: Theme.of(context).appBarTheme.foregroundColor,),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Theme.of(context).backgroundColor,
        foregroundColor: Theme.of(context).appBarTheme.foregroundColor,
        elevation: 0.0,
        actions: [
          IconButton(
            onPressed: () {
              // send the chirp
            },
            icon: Icon(Icons.add_comment, color: Theme.of(context).appBarTheme.foregroundColor,)
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
                  controller: chirpTextController,
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
                    icon: Icon(Icons.add_a_photo, color: Theme.of(context).appBarTheme.foregroundColor,),
                    onPressed: () {
                      // open image picker
                      handleImagePick();
                    },
                  ),
                  IconButton( //Icons.insert_photo
                    icon: Icon(Icons.video_camera_back, color: Theme.of(context).appBarTheme.foregroundColor,),
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

