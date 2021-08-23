import 'package:chirper/helpers/auth_helper.dart';
import 'package:chirper/helpers/secure_storage_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart' show SpinKitFadingCube;
import 'package:google_fonts/google_fonts.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  final secureStorageHelper = SecureStorageHelper();

  void checkLogin() async {
    String? token = await secureStorageHelper.readVal(key: 'authToken');

    if(token == null) {
      Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
    } else {
      Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
    }
  }

  @override
  void initState() {
    checkLogin();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SpinKitFadingCube(
              color: Theme.of(context).primaryColor,
              size: 100.0,
            ),
            Text(
              'Chirper',
              style: GoogleFonts.roboto(
                fontSize: 50.0,
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(),
          ],
        ),
      ),
    );
  }

}

