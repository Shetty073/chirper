import 'package:chirper/components/dialog_boxes/dialog_boxes.dart';
import 'package:chirper/helpers/auth_helper.dart';
import 'package:chirper/services/socket_io_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isLoading = false;
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  late AuthHelper _authHelper;

  void _handleLogin() {
    setState(() {
      _isLoading = true;
    });

    Map<String, String> data = {
      'email': _emailController.text,
      'password': _passwordController.text,
    };

    // perform login
    _authHelper.login(data: data).then((value) {
      if(value['userId'] != null) {
        // Go to home
        Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
      } else {
        // stop loading indicator
        setState(() {
          _isLoading = false;

          // display error message
          DialogBoxes.infoBox(context, 'Error', value['message']);
        });
      }
    });
  }

  @override
  void initState() {
    _authHelper = AuthHelper();

    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 10.0, right: 10.0, bottom: 10.0, left: 10.0),
        child: SingleChildScrollView(
          padding: EdgeInsets.only(top: 0.08 * screenHeight),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                Text(
                  'Sign In',
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 50.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: 25.0,
                ),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email address';
                    }
                    return null;
                  },
                  controller: _emailController,
                  maxLength: 50,
                  decoration: InputDecoration(
                    labelText: 'Email Address',
                    hintText: 'user@example.com',
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a password';
                    }
                    return null;
                  },
                  controller: _passwordController,
                  maxLength: 50,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    hintText: '\$tr#ng7923P@ssw#rd',
                  ),
                  obscureText: true,
                ),
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: _isLoading ? (){} : () {
                          if (_formKey.currentState!.validate()) {
                            _handleLogin();
                          }
                        },
                        style: ButtonStyle(
                          minimumSize: MaterialStateProperty.all(
                            Size(0.15 * screenHeight, 0.06 * screenHeight),
                          ),
                          textStyle: MaterialStateProperty.all(
                            TextStyle(
                              fontSize: 0.025 * screenHeight,
                            ),
                          ),
                        ),
                        child: _isLoading ? SpinKitCircle(
                          color: Colors.white,
                          size: 20.0,
                        ) : Text('Sign In'),
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                      TextButton(
                        onPressed: _isLoading ? (){} : () {
                          Navigator.pushNamedAndRemoveUntil(context, '/register', (Route<dynamic> route) => false);
                        },
                        child: Text(
                          'Don\'t have an account?',
                          style: TextStyle(
                            fontSize: 0.02 * screenHeight,
                          ),
                        ),
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

