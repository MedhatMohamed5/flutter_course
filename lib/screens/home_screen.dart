import 'package:flutter/material.dart';
import 'package:flutter_course/screens/about.dart';
import 'package:flutter_course/screens/contact.dart';
import 'package:flutter_course/screens/help.dart';
import 'package:flutter_course/screens/home_tabs/favourites.dart';
import 'package:flutter_course/screens/home_tabs/popular.dart';
import 'package:flutter_course/screens/home_tabs/whats_new.dart';
import 'package:flutter_course/screens/settings.dart';
import 'package:flutter_course/shared_ui/navigation_drawer.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

enum PopMenu { HELP, ABOUT, CONTACT, SETTINGS }

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Explore"),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
          /*IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {},
          ),*/
          _popMenu(context),
        ],
        bottom: TabBar(
          unselectedLabelColor: Colors.white70,
          indicatorColor: Colors.white,
          controller: _tabController,
          tabs: [
            Tab(
              text: "What's New",
            ),
            Tab(
              text: "Popular",
            ),
            Tab(
              text: "Favourites",
            ),
          ],
        ),
      ),
      drawer: NavigationDrawer(),
      body: Center(
        child: TabBarView(
          children: [
            WhatsNew(),
            Popular(),
            Favourites(),
          ],
          controller: _tabController,
        ),
      ),
    );
  }

  Widget _popMenu(BuildContext context) {
    return PopupMenuButton<PopMenu>(
      itemBuilder: (context) {
        return [
          PopupMenuItem<PopMenu>(
            value: PopMenu.ABOUT,
            child: Text('About'),
          ),
          PopupMenuItem<PopMenu>(
            value: PopMenu.CONTACT,
            child: Text('Contact'),
          ),
          PopupMenuItem<PopMenu>(
            value: PopMenu.HELP,
            child: Text('Help'),
          ),
          PopupMenuItem<PopMenu>(
            value: PopMenu.SETTINGS,
            child: Text('Settings'),
          ),
        ];
      },
      onSelected: (PopMenu menu) {
        MaterialPageRoute route;
        switch (menu) {
          case PopMenu.HELP:
            route = MaterialPageRoute(builder: (context) => Help());
            break;
          case PopMenu.ABOUT:
            route = MaterialPageRoute(builder: (context) => AboutUs());
            break;
          case PopMenu.CONTACT:
            route = MaterialPageRoute(builder: (context) => ContactUs());
            break;
          case PopMenu.SETTINGS:
            route = MaterialPageRoute(builder: (context) => Settings());
            break;
        }
        Navigator.push(context, route);
      },
      icon: Icon(Icons.more_vert),
    );
  }
}
