import 'package:flutter/material.dart';
import 'package:flutter_course/screens/home_tabs/favourites.dart';
import 'package:flutter_course/screens/home_tabs/popular.dart';
import 'package:flutter_course/screens/home_tabs/whats_new.dart';
import 'package:flutter_course/shared_ui/navigation_drawer.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
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
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {},
          ),
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
}
