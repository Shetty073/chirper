import 'package:flutter/material.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 10.0),
                    child: CircleAvatar(
                      radius: 24,
                      backgroundImage: NetworkImage('https://i.pravatar.cc/306'),
                      backgroundColor: Colors.blue,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 5.0),
                    child: Text(
                      'Full Name',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 8.0),
                    child: Text(
                      '@username',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 15,
                      ),
                    ),
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        RichText(
                          text: TextSpan(
                            style: TextStyle(
                              fontSize: 13.0,
                              color: Colors.grey,
                            ),
                            children: const <TextSpan>[
                              TextSpan(
                                  text: '200',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  )
                              ),
                              TextSpan(text: ' Following'),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        RichText(
                          text: TextSpan(
                            style: TextStyle(
                              fontSize: 13.0,
                              color: Colors.grey,
                            ),
                            children: const <TextSpan>[
                              TextSpan(
                                  text: '105',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  )
                              ),
                              TextSpan(text: ' Followers'),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          InkWell(
            child: ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('Profile'),
            ),
            onTap: () {
              // navigate to profile
            },
          ),
          InkWell(
            child: ListTile(
              leading: Icon(Icons.message),
              title: Text('Messages'),
            ),
            onTap: () {
              // navigate to messages
            },
          ),
          InkWell(
            child: ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
            ),
            onTap: () {
              // navigate to settings
            },
          ),
        ],
      ),
    );
  }
}
