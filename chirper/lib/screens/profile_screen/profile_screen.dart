import 'package:chirper/components/profile_page_header/profile_page_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  bool _isLoading = false;

  @override
  void initState() {
    _tabController = new TabController(length: 3, vsync: this);

    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Theme.of(context).appBarTheme.foregroundColor,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            pinned: true,
            expandedHeight: MediaQuery.of(context).size.height * 0.3,
            flexibleSpace: FlexibleSpaceBar(
              stretchModes: [StretchMode.blurBackground],
              titlePadding: EdgeInsets.all(0.0),
              background: ProfilePageHeader(),
            ),
            actions: [
              Padding(
                padding: EdgeInsets.fromLTRB(0.0, 12.0, 10.0, 12.0),
                child: Material(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    side: BorderSide(
                      color: Theme.of(context).appBarTheme.foregroundColor!,
                    ),
                  ),
                  clipBehavior: Clip.antiAlias,
                  color: Theme.of(context).backgroundColor,
                  child: MaterialButton(
                    onPressed: () {
                      if (!_isLoading) {
                        // TODO: Goto edit profile page
                      }
                    },
                    child: Text(
                      'Edit profile',
                      style: TextStyle(
                        color: Theme.of(context).appBarTheme.foregroundColor,
                        fontSize: 15.0,
                      ),
                    ),
                  ),
                ),
              ),
            ],
            bottom: TabBar(
              controller: _tabController,
              indicatorColor: Theme.of(context).appBarTheme.foregroundColor,
              labelColor: Theme.of(context).appBarTheme.foregroundColor,
              unselectedLabelColor: Colors.grey,
              labelPadding: EdgeInsets.only(left: 0, right: 0),
              indicatorPadding: EdgeInsets.only(left: 0, right: 0),
              tabs: [
                Tab(
                  text: 'Chirps',
                ),
                Tab(
                  text: 'Chirps & replies',
                ),
                Tab(
                  text: 'Likes',
                ),
              ],
            ),
          ),
          SliverFillRemaining(
            child: Container(
              margin: EdgeInsets.only(left: 10.0, right: 10.0),
              child: TabBarView(
                controller: _tabController,
                children: [
                  // first tab bar view widget
                  Container(
                    child: Center(
                      child: Text(
                        'Chirps',
                      ),
                    ),
                  ),

                  // second tab bar view widget
                  Container(
                    child: Center(
                      child: Text(
                        'Chirps & replies',
                      ),
                    ),
                  ),

                  // third tab bar view widget
                  Container(
                    child: Center(
                      child: Text(
                        'Likes',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
