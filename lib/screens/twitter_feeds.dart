import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_course/shared_ui/navigation_drawer.dart';

class TwitterFeeds extends StatefulWidget {
  @override
  _TwitterFeedsState createState() => _TwitterFeedsState();
}

class _TwitterFeedsState extends State<TwitterFeeds> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Twitter feeds'),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.search,
            ),
            onPressed: () {},
          ),
        ],
      ),
      drawer: NavigationDrawer(),
      body: ListView.builder(
        padding: EdgeInsets.all(8),
        itemBuilder: (context, index) {
          return Card(
            child: Column(
              children: <Widget>[
                _cardHeader(),
                _cardBody(),
                _cardFooter(),
              ],
            ),
          );
        },
        itemCount: 20,
      ),
    );
  }

  Widget _cardHeader() {
    return Row(
      children: <Widget>[
        /*Container(
          margin: EdgeInsets.all(8),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: ExactAssetImage('assets/images/placeholder_bg.png'),
              fit: BoxFit.cover,
            ),
            shape: BoxShape.circle,
          ),
          width: 48,
          height: 48,
        ),*/
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            radius: 24,
            backgroundImage:
                ExactAssetImage('assets/images/placeholder_bg.png'),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(right: 4),
                  child: Text(
                    'Medhat Mohamed',
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 16,
                    ),
                  ),
                ),
                Text(
                  '@Memo7tt',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            Text(
              'Fri, 12 May 2020 - 14:30',
              style: TextStyle(
                color: Colors.black87,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _cardBody() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: Text(
        'This is the tweet text retrieved from api about sports topics or other news',
        style: TextStyle(
          fontSize: 16,
          color: Colors.grey.shade600,
          height: 1.4,
        ),
        maxLines: 3,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  Widget _cardFooter() {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Divider(
            thickness: 1,
            height: 8,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              child: Row(
                children: <Widget>[
                  IconButton(
                    color: Colors.deepOrange,
                    iconSize: 25,
                    icon: Icon(Icons.repeat),
                    onPressed: () {},
                  ),
                  Text(
                    '20',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey.shade600,
                    ),
                  ),
                ],
              ),
            ),
            ButtonBar(
              children: <Widget>[
                IconButton(
                  iconSize: 25,
                  color: Colors.deepOrange,
                  icon: Icon(Icons.share),
                  onPressed: () {},
                ),
                IconButton(
                  iconSize: 25,
                  color: Colors.deepOrange,
                  icon: Icon(Icons.open_in_new),
                  onPressed: () {},
                ),
              ],
            ),
          ],
        )
      ],
    );
  }
}
