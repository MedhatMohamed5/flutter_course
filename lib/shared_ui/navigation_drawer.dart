import 'package:flutter/material.dart';

class NavigationDrawer extends StatefulWidget {
  @override
  _NavigationDrawerState createState() => _NavigationDrawerState();
}

class _NavigationDrawerState extends State<NavigationDrawer> {
  List<String> navMenu = [
    'Explore',
    'Headline news',
    'Read later',
    'Videos',
    'Photos',
    'Settings',
    'Logout'
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
                onTap: () {},
                title: Text(
                  navMenu[index].trim().toUpperCase(),
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
          itemCount: navMenu.length,
        ),
      ),
    );
  }
}
