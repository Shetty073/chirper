import 'dart:io';

import 'package:chirper/helpers/chirp_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class ChirpScreen extends StatefulWidget {
  const ChirpScreen({Key? key}) : super(key: key);

  @override
  _ChirpScreenState createState() => _ChirpScreenState();
}

class _ChirpScreenState extends State<ChirpScreen> {
  bool _isLoading = false;
  final _picker = ImagePicker();
  TextEditingController _chirpTextController = TextEditingController();
  late ChirpHelper _chirpHelper;
  XFile? _pickedFile;

  void handleCameraImagePick() async {
    _pickedFile = await _picker.pickImage(
      source: ImageSource.camera,
    );
    setState(() {});
  }

  void handleImagePick() async {
    _pickedFile = await _picker.pickImage(
      source: ImageSource.gallery,
    );
    setState(() {});
  }

  void handleSendChirp() async {
    setState(() {
      _isLoading = true;
    });

    bool chirpSuccessful;
    if (_pickedFile != null) {
      chirpSuccessful = await _chirpHelper.chirp(
        chirp: _chirpTextController.text,
        pickedFile: _pickedFile,
      );
    } else {
      chirpSuccessful = await _chirpHelper.chirp(
        chirp: _chirpTextController.text,
      );
    }

    setState(() {
      _isLoading = false;
    });

    if (chirpSuccessful) {
      final chirpSuccessSnackBar = SnackBar(
        content: Text(
          'Chirp successful!',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Theme.of(context).appBarTheme.foregroundColor,
      );
      ScaffoldMessenger.of(context).showSnackBar(chirpSuccessSnackBar);
      Navigator.pop(context);
    } else {
      final chirpFailureSnackBar = SnackBar(
        content: Text(
          'Error in posting the chirp. Please try again later.',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Theme.of(context).appBarTheme.foregroundColor,
      );
      ScaffoldMessenger.of(context).showSnackBar(chirpFailureSnackBar);
    }
  }

  @override
  void initState() {
    _chirpHelper = ChirpHelper();

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _chirpTextController.dispose();
  }

  Widget selectedImages() {
    return _pickedFile == null
        ? Container()
        : Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.file(
                  File(_pickedFile!.path),
                  height: 40,
                )
              ],
            ),
          );
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.close,
            color: Theme.of(context).appBarTheme.foregroundColor,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Theme.of(context).backgroundColor,
        foregroundColor: Theme.of(context).appBarTheme.foregroundColor,
        elevation: 0.0,
        actions: [
          MaterialButton(
            onPressed: () {
              // send the chirp
              if (!_isLoading) {
                handleSendChirp();
              }
            },
            child: Row(
              children: [
                Text(
                  'Chirp ',
                  style: TextStyle(
                      color: Theme.of(context).appBarTheme.foregroundColor,
                      fontSize: 18.0),
                ),
                Icon(
                  Icons.send,
                  color: Theme.of(context).appBarTheme.foregroundColor,
                  size: 20.0,
                ),
              ],
            ),
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
                    contentPadding: EdgeInsets.only(bottom: 5, top: 5),
                  ),
                  controller: _chirpTextController,
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
                    icon: Icon(
                      Icons.add_a_photo,
                      color: Theme.of(context).appBarTheme.foregroundColor,
                    ),
                    onPressed: () {
                      // open camera image picker
                      handleCameraImagePick();
                    },
                  ),
                  selectedImages(),
                  IconButton(
                    //Icons.insert_photo
                    icon: Icon(
                      Icons.image,
                      color: Theme.of(context).appBarTheme.foregroundColor,
                    ),
                    onPressed: () {
                      // open gallery image picker
                      handleImagePick();
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
