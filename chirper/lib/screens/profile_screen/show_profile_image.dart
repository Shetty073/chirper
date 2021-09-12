import 'dart:io';

import 'package:chirper/data/models/user.dart';
import 'package:chirper/helpers/user_helper.dart';
import 'package:chirper/services/boxes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class ShowProfileImage extends StatefulWidget {
  const ShowProfileImage({Key? key}) : super(key: key);

  @override
  _ShowProfileImageState createState() => _ShowProfileImageState();
}

class _ShowProfileImageState extends State<ShowProfileImage> {
  bool _isLoading = false;
  final _picker = ImagePicker();
  late UserHelper _userHelper;
  XFile? _pickedFile;
  File? _croppedFile;

  void changeImage() async {
    setState(() {
      _isLoading = true;
    });
    _pickedFile = await _picker.pickImage(
      source: ImageSource.gallery,
    );

    if (_pickedFile != null) {
      _croppedFile = await ImageCropper.cropImage(
          sourcePath: _pickedFile!.path,
          aspectRatioPresets: [
            CropAspectRatioPreset.square,
          ],
          androidUiSettings: AndroidUiSettings(
            toolbarTitle: 'Crop image',
            toolbarColor: Colors.blue,
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.square,
            lockAspectRatio: true,
          ),
          iosUiSettings: IOSUiSettings(
            minimumAspectRatio: 1.0,
          ));

      bool updateSuccessful =
          await _userHelper.updateProfilePhoto(pickedFile: _croppedFile);

      setState(() {
        _isLoading = false;
      });

      if (updateSuccessful) {
        final chirpSuccessSnackBar = SnackBar(
          content: Text(
            'Update successful!',
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
            'Error updating your profile photo. Please try again later.',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          backgroundColor: Theme.of(context).appBarTheme.foregroundColor,
        );
        ScaffoldMessenger.of(context).showSnackBar(chirpFailureSnackBar);
      }
    }
  }

  @override
  void initState() {
    _userHelper = UserHelper();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Theme.of(context).appBarTheme.foregroundColor,
        leading: CloseButton(
          color: Theme.of(context).appBarTheme.foregroundColor,
        ),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ValueListenableBuilder<Box<User>>(
              valueListenable: Boxes.getUsers().listenable(),
              builder: (context, box, _) {
                final users = box.values.toList().cast<User>();
                var user = users[0];

                return Image.network(
                  user.photo != null
                      ? user.photo!
                      : 'https://ui-avatars.com/api/?name=N+A&background=2196F3&color=fff',
                  width: MediaQuery.of(context).size.width,
                  height: 500,
                );
              },
            ),
            _isLoading
                ? SpinKitCircle(
                    color: Theme.of(context).appBarTheme.foregroundColor,
                    size: 15.0,
                  )
                : OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      side: BorderSide(
                          width: 2,
                          color:
                              Theme.of(context).appBarTheme.foregroundColor!),
                    ),
                    onPressed: () {
                      changeImage();
                    },
                    child: Text('Change'),
                  ),
          ],
        ),
      ),
    );
  }
}
