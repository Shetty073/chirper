import 'package:chirper/data/models/user.dart';
import 'package:chirper/services/boxes.dart';
import 'package:chirper/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

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
                child: ValueListenableBuilder<Box<User>>(
                  valueListenable: Boxes.getUsers().listenable(),
                  builder: (context, box, _) {
                    final user = box.get('user')!;

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(bottom: 10.0),
                          child: CircleAvatar(
                            radius: 30,
                            backgroundImage: NetworkImage(user.photo ??
                                'https://ui-avatars.com/api/?name=N+A&background=0D8ABC&color=fff'),
                            backgroundColor: Theme.of(context).primaryColor,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 5.0),
                          child: Text(
                            user.name,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 8.0),
                          child: Text(
                            '@${user.username}',
                            style: TextStyle(
                              color: Theme.of(context)
                                  .bottomNavigationBarTheme
                                  .unselectedItemColor,
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
                                    color: Theme.of(context)
                                        .bottomNavigationBarTheme
                                        .unselectedItemColor,
                                  ),
                                  children: [
                                    TextSpan(
                                        text: '${user.following}',
                                        style: TextStyle(
                                          fontSize: 13.2,
                                          fontWeight: FontWeight.bold,
                                          color: Theme.of(context)
                                              .textTheme
                                              .bodyText1
                                              ?.color,
                                        )),
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
                                    color: Theme.of(context)
                                        .bottomNavigationBarTheme
                                        .unselectedItemColor,
                                  ),
                                  children: [
                                    TextSpan(
                                        text: '${user.followers}',
                                        style: TextStyle(
                                          fontSize: 13.2,
                                          fontWeight: FontWeight.bold,
                                          color: Theme.of(context)
                                              .textTheme
                                              .bodyText1
                                              ?.color,
                                        )),
                                    TextSpan(
                                        text: user.followers! > 1
                                            ? ' Followers'
                                            : ' Follower'),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
            Divider(
              thickness: 1.0,
              color: Colors.grey,
              height: 10,
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
                  // close the drawer and navigate to profile page
                  Navigator.of(context).popAndPushNamed('/profile');
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
                  // TODO: navigate to settings
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
                      child: IconButton(
                        onPressed: () {
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
