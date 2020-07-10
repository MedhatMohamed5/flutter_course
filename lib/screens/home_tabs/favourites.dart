import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Favourites extends StatefulWidget {
  @override
  _FavouritesState createState() => _FavouritesState();
}

class _FavouritesState extends State<Favourites> {
  List<Color> colorsList = [
    Colors.red,
    Colors.deepOrange,
    Colors.teal,
    Colors.purple,
    Colors.brown,
    Colors.indigo,
  ];
  Random rand = Random();

  Color getRandColor() {
    return colorsList[rand.nextInt(colorsList.length)];
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return Card(
          child: Container(
            padding: EdgeInsets.all(16),
            child: Column(
              children: <Widget>[
                _authorRow(),
                SizedBox(
                  height: 16,
                ),
                _newsItemRow(),
              ],
            ),
          ),
        );
      },
      itemCount: 20,
    );
  }

  Widget _authorRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: ExactAssetImage('assets/images/placeholder_bg.png'),
                  fit: BoxFit.cover,
                ),
                shape: BoxShape.circle,
              ),
              width: 50,
              height: 50,
              margin: EdgeInsets.only(right: 16),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Medhat Mohamed',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Row(
                  children: <Widget>[
                    Text(
                      '15 mins. ',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    Text(
                      'Life style',
                      style: TextStyle(
                        color: getRandColor(),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        IconButton(
          icon: Icon(Icons.favorite_border),
          onPressed: () {},
          color: Colors.grey,
        ),
      ],
    );
  }

  Widget _newsItemRow() {
    return Row(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: ExactAssetImage('assets/images/placeholder_bg.png'),
              fit: BoxFit.cover,
            ),
          ),
          width: 124,
          height: 124,
          margin: EdgeInsets.only(right: 16),
        ),
        Expanded(
          child: Column(
            children: <Widget>[
              Text(
                'Tech Tent: Old phones and safe social',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              Text(
                'We also talk about the future of work as the robots advance and we ask whether a retro phone',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                  height: 1.25,
                ),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
