import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_course/models/post.dart';

class PostPage extends StatefulWidget {
  final Post post;

  PostPage(this.post);

  @override
  _PostPageState createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: MediaQuery.of(context).size.height * .30,
            //backgroundColor: Colors.transparent,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                widget.post.title,
                style: TextStyle(fontSize: 16),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              background: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(widget.post.featuredImage),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          /*SliverAppBar(
            title: Text('I\'m a sticky app bar'),
            pinned: true,
            primary: false,
          ),*/
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                if (index == 0) {
                  return _drawPostDetails();
                }
                if (index >= 1 && index < 19) {
                  return index == 1
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Divider(),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 4),
                              child: Text(
                                'Comments (25)',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                            ),
                            _drawPostComments(),
                            Divider(),
                          ],
                        )
                      : index == 18
                          ? _drawPostComments()
                          : Column(
                              children: <Widget>[
                                _drawPostComments(),
                                Divider(),
                              ],
                            );
                } else {
                  return _drawCommentEntry();
                }
              },
              childCount: 20,
            ),
          )
        ],
      ),
    );
  }

  final random = Random();

  /// Returns a random color, with minimum brightness level
  Color getRandomColor({int minBrightness = 50}) {
    assert(minBrightness >= 0 && minBrightness <= 255);
    return Color.fromARGB(
      0xFF,
      minBrightness + random.nextInt(255 - minBrightness),
      minBrightness + random.nextInt(255 - minBrightness),
      minBrightness + random.nextInt(255 - minBrightness),
    );
  }

  Widget _drawPostDetails() {
    return Container(
      padding: EdgeInsets.all(16),
      child: Text(
        widget.post.content,
        style: TextStyle(
          fontSize: 16,
          height: 1.2,
        ),
      ),
    );
  }

  Widget _drawPostComments() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              CircleAvatar(
                backgroundImage:
                    ExactAssetImage('assets/images/placeholder_bg.png'),
              ),
              SizedBox(
                width: 8,
              ),
              Column(
                children: <Widget>[
                  Text(
                    'Comment',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text('1 hour ago'),
                ],
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Text(
              'Comments will retrieved from api comments for a specific post and display it here',
            ),
          ),
        ],
      ),
    );
  }

  Widget _drawCommentEntry() {
    return Container(
      margin: EdgeInsets.only(top: 16, bottom: 12),
      decoration: BoxDecoration(
        color: Color.fromRGBO(241, 245, 247, 1),
        border: Border(
          top: BorderSide(
            color: Colors.grey.shade300,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 6,
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Write your comment here',
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: FlatButton(
                onPressed: () {},
                child: Text(
                  'SEND',
                  style: TextStyle(
                    color: Colors.deepOrange,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
