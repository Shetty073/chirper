import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _dobController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime(1996, 03, 24),
        firstDate: DateTime(1950),
        lastDate: DateTime(2004)
    );
    if (pickedDate != null) {
      setState(() {
        _dobController.text = '${pickedDate.year.toString()}-${pickedDate.month.toString().padLeft(2,'0')}-${pickedDate.day.toString().padLeft(2,'0')}';
      });
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _dobController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
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
                  'Sign Up',
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
                      return 'Please enter your name';
                    }
                    return null;
                  },
                  controller: _nameController,
                  maxLength: 50,
                  textCapitalization: TextCapitalization.words,
                  decoration: InputDecoration(
                    labelText: 'Full Name',
                    hintText: 'John Doe',
                  ),
                  keyboardType: TextInputType.name,
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
                      return 'Please enter your date of birth';
                    }
                    return null;
                  },
                  controller: _dobController,
                  maxLength: 50,
                  decoration: InputDecoration(
                    labelText: 'Date Of Birth',
                  ),
                  keyboardType: TextInputType.emailAddress,
                  readOnly: true,
                  onTap: () {
                    _selectDate(context);
                  },
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
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter confirm password';
                    }
                    return null;
                  },
                  controller: _confirmPasswordController,
                  maxLength: 50,
                  decoration: InputDecoration(
                    labelText: 'Confirm Password',
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
                                    _dobController.text
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
                        child: Text('Sign Up'),
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamedAndRemoveUntil(context, '/login', (Route<dynamic> route) => false);
                        },
                        child: Text(
                          'Already have an account?',
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

