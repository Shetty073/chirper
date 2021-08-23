import 'package:chirper/screens/main_screens/home_screen.dart';
import 'package:chirper/screens/main_screens/messages_screen.dart';
import 'package:chirper/screens/main_screens/notifications_screen.dart';
import 'package:chirper/screens/main_screens/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:chirper/components/drawer/app_drawer.dart';

class MainScreen extends StatefulWidget {
  final String? title;

  const MainScreen({Key? key, this.title}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    SearchScreen(),
    NotificationsScreen(),
    MessagesScreen()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        leading: IconButton(
          icon: IconTheme(
            data: IconThemeData(
              color: Theme.of(context).appBarTheme.foregroundColor,
            ),
            child: Icon(
              Icons.menu,
            ),
          ),
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer();
          },
        ),
        title: Text(
          widget.title!,
          style: TextStyle(
            color: Theme.of(context).appBarTheme.foregroundColor,
          ),
        ),
        elevation: 0.0,
      ),
      drawer: AppDrawer(),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications, size: 27.0,),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message, size: 26.0,),
            label: 'Messages',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        iconSize: 30.0,
        type: BottomNavigationBarType.fixed,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add_comment),
        onPressed: () {
          // Goto create Chirp page
          Navigator.pushNamed(context, '/chirp');
        },
      ),
    );
  }
}
