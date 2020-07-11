import 'package:flutter/material.dart';
import 'package:flutter_course/models/nav_menu.dart';
import 'package:flutter_course/screens/headline_news.dart';
import 'package:flutter_course/screens/home_screen.dart';
import 'package:flutter_course/screens/twitter_feeds.dart';

class NavigationDrawer extends StatefulWidget {
  @override
  _NavigationDrawerState createState() => _NavigationDrawerState();
}

class _NavigationDrawerState extends State<NavigationDrawer> {
  /*List<String> navMenu = [
    'Explore',
    'Headline news',
    'Read later',
    'Videos',
    'Photos',
    'Settings',
    'Logout'
  ];*/

  List<NavMenuItem> navigationMenu = [
    NavMenuItem('Explore', () => HomeScreen()),
    NavMenuItem('Headline news', () => HeadLineNews()),
    NavMenuItem('Tweeter Feeds', () => TwitterFeeds()),
  ];

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.only(top: 32, left: 16),
        child: ListView.builder(
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: ListTile(
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => navigationMenu[index].destination(),
                    ),
                  );
                },
                title: Text(
                  navigationMenu[index].title.trim().toUpperCase(),
                  style: TextStyle(
                    color: Colors.grey.shade700,
                    fontSize: 22,
                  ),
                ),
                trailing: Icon(
                  Icons.chevron_right,
                  color: Colors.grey.shade500,
                ),
              ),
            );
          },
          itemCount: navigationMenu.length,
        ),
      ),
    );
  }
}
