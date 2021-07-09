import 'package:chirper/themes/themes.dart';
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
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).backgroundColor,
        ),
        child: Column(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Theme.of(context).backgroundColor,
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
                        backgroundColor: Theme.of(context).primaryColor,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 5.0),
                      child: Text(
                        'Full Name',
                        style: TextStyle(
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
                          color: Theme.of(context).bottomNavigationBarTheme.unselectedItemColor,
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
                                color: Theme.of(context).bottomNavigationBarTheme.unselectedItemColor,
                              ),
                              children: [
                                TextSpan(
                                    text: '200',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Theme.of(context).textTheme.bodyText1?.color,
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
                                color: Theme.of(context).bottomNavigationBarTheme.unselectedItemColor,
                              ),
                              children: [
                                TextSpan(
                                    text: '105',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Theme.of(context).textTheme.bodyText1?.color,
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
            Material(
              color: Theme.of(context).backgroundColor,
              child: InkWell(
                child: ListTile(
                  leading: Icon(
                    Icons.account_circle,
                    color: Theme.of(context).textTheme.bodyText1?.color,
                  ),
                  title: Text('Profile'),
                ),
                onTap: () {
                  // navigate to profile
                },
              ),
            ),
            Material(
              color: Theme.of(context).backgroundColor,
              child: InkWell(
                child: ListTile(
                  leading: Icon(
                    Icons.settings,
                    color: Theme.of(context).textTheme.bodyText1?.color,
                  ),
                  title: Text('Settings'),
                ),
                onTap: () {
                  // navigate to settings
                },
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 5.0, bottom: 5.0),
                    child: Material(
                      color: Theme.of(context).backgroundColor,
                      child: IconButton(onPressed: () {
                        currentTheme.toggleTheme();
                      },
                        icon: Icon(
                          Icons.brightness_4_rounded,
                          color: Theme.of(context).textTheme.bodyText1?.color,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
