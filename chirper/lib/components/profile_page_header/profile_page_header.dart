import 'package:chirper/data/models/user.dart';
import 'package:chirper/services/boxes.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ProfilePageHeader extends StatefulWidget {
  const ProfilePageHeader({Key? key}) : super(key: key);

  @override
  _ProfilePageHeaderState createState() => _ProfilePageHeaderState();
}

class _ProfilePageHeaderState extends State<ProfilePageHeader> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Box<User>>(
        valueListenable: Boxes.getUsers().listenable(),
        builder: (context, box, _) {
          // final users = box.values.toList().cast<User>();
          var user = box.get('user')!;

          return Container(
            padding: EdgeInsets.only(left: 10.0, right: 10.0),
            child: Row(
              children: [
                GestureDetector(
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(user.photo ??
                        'https://ui-avatars.com/api/?name=N+A&background=2196F3&color=fff'),
                    backgroundColor:
                        Theme.of(context).appBarTheme.foregroundColor,
                  ),
                  onTap: () {
                    Navigator.of(context).pushNamed('/show_profile_photo');
                  },
                ),
                Container(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.1,
                      left: 15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        user.name,
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 2.0,
                      ),
                      Text(
                        '@${user.username}',
                        style: TextStyle(
                          fontSize: 13.0,
                          color: Theme.of(context)
                              .bottomNavigationBarTheme
                              .unselectedItemColor,
                        ),
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      Container(
                        child: Row(
                          children: [
                            RichText(
                              text: TextSpan(
                                style: TextStyle(
                                  fontSize: 15.0,
                                  color: Theme.of(context)
                                      .bottomNavigationBarTheme
                                      .unselectedItemColor,
                                ),
                                children: [
                                  TextSpan(
                                      text: '${user.following}',
                                      style: TextStyle(
                                        fontSize: 15.0,
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
                                  fontSize: 15.0,
                                  color: Theme.of(context)
                                      .bottomNavigationBarTheme
                                      .unselectedItemColor,
                                ),
                                children: [
                                  TextSpan(
                                      text: '${user.followers}',
                                      style: TextStyle(
                                        fontSize: 15.0,
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
                  ),
                ),
              ],
            ),
          );
        });
  }
}
