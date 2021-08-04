import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

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
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                    'submitted'
                                ),
                              ),
                            );
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
                        child: Text('Sign In'),
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                      TextButton(
                        onPressed: () {
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

