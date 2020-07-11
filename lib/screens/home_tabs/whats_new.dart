import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_course/api/posts_api.dart';
import 'package:flutter_course/models/post.dart';
import 'package:flutter_course/utilities/data_utilities.dart';

class WhatsNew extends StatefulWidget {
  @override
  _WhatsNewState createState() => _WhatsNewState();
}

class _WhatsNewState extends State<WhatsNew> {
  PostsAPI _postsAPI = PostsAPI();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _header(),
          _stories(),
          _drawRecentUpdates(),
        ],
      ),
    );
  }

  Widget _header() {
    TextStyle _headerTitle = TextStyle(
        color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold);
    TextStyle _headerDesc = TextStyle(
      color: Colors.white,
      fontSize: 16,
    );
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.25,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Free Text',
                style: _headerTitle,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                'Lorem ipsum is placeholder text commonly used in the graphic, '
                'print, and publishing industries for previewing layouts and visual mockups',
                style: _headerDesc,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: ExactAssetImage('assets/images/placeholder_bg.png'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _stories() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: _sectionTitle('Top Stories'),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Card(
              child: FutureBuilder(
                future: _postsAPI.fetchPostsByType("1"),
                // ignore: missing_return
                builder: (context, AsyncSnapshot snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.none:
                      return connectionError();
                      break;
                    case ConnectionState.waiting:
                      return loading();
                      break;
                    case ConnectionState.active:
                      return loading();
                      break;
                    case ConnectionState.done:
                      if (snapshot.error != null) {

                        return error(snapshot.error);
                      } else {
                        if (snapshot.hasData) {
                          List<Post> posts = snapshot.data;
                          if (posts.length >= 3) {
                            Post post = posts[0];
                            Post post1 = posts[1];
                            Post post2 = posts[2];
                            //print('${post.id} -- ${post1.id} -- ${post2.id}');
                            return Column(
                              children: <Widget>[
                                _drawSingleRow(post),
                                _drawDivider(),
                                _drawSingleRow(post1),
                                _drawDivider(),
                                _drawSingleRow(post2),
                              ],
                            );
                          } else {
                            return noData();
                          }
                        } else {
                          return noData();
                        }
                      }
                      break;
                  }
                  //return _loading();
                  /*Post post = snapshot.data[0];
                  Post post1 = snapshot.data[1];
                  Post post2 = snapshot.data[2];
                  print('${post.id} -- ${post1.id} -- ${post2.id}');
                  return Column(
                    children: <Widget>[
                      _drawSingleRow(post),
                      _drawDivider(),
                      _drawSingleRow(post1),
                      _drawDivider(),
                      _drawSingleRow(post2),
                    ],
                  );*/
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _drawRecentUpdates() {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: _sectionTitle('Recent updates'),
          ),
          FutureBuilder(
            future: _postsAPI.fetchPostsByType("2"),
            // ignore: missing_return
            builder: (context, snapShot) {
              switch (snapShot.connectionState) {
                case ConnectionState.none:
                  return connectionError();
                  break;
                case ConnectionState.waiting:
                  return loading();
                  break;
                case ConnectionState.active:
                  return loading();
                  break;
                case ConnectionState.done:
                  if (snapShot.hasError) {
                    return error(snapShot.error);
                  } else {
                    if (snapShot.hasData) {
                      List<Post> recent = snapShot.data;
                      if (recent.length >= 2) {
                        return Column(
                          children: <Widget>[
                            _drawRecentUpdatesCard(
                                Colors.deepOrange, snapShot.data[0]),
                            _drawRecentUpdatesCard(
                                Colors.teal, snapShot.data[1]),
                            SizedBox(
                              height: 32,
                            ),
                          ],
                        );
                      } else {
                        return noData();
                      }
                    } else {
                      return noData();
                    }
                  }
                  break;
              }
            },
          ),
        ],
      ),
    );
  }

  Widget _drawSingleRow(Post post) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: <Widget>[
          SizedBox(
            child: //Image(
                //image: ExactAssetImage('assets/images/placeholder_bg.png'),
                Image.network(
              post.featuredImage,
              fit: BoxFit.cover,
            ),
            //fit: BoxFit.cover,
            //),
            height: 128,
            width: 128,
          ),
          SizedBox(
            width: 16,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'The world global warming annual summit',
                  maxLines: 2,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 24,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('Medhat Mohamed'),
                    Row(
                      children: <Widget>[
                        Icon(Icons.timer),
                        //Text('15 min'),
                        Text(parseDate(post.dateWritten)),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _drawDivider() {
    return Container(
      height: 1,
      color: Colors.grey.shade300,
      width: MediaQuery.of(context).size.width * .70,
    );
  }

  Widget _sectionTitle(String title) {
    return Text(
      title,
      style: TextStyle(
          color: Colors.grey.shade800,
          fontWeight: FontWeight.w500,
          fontSize: 16),
    );
  }

  Widget _drawRecentUpdatesCard(Color color, Post post) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(post.featuredImage),
                //ExactAssetImage('assets/images/placeholder_bg.png'),
                fit: BoxFit.cover,
              ),
            ),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * .25,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 4),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: color,
              ),
              child: Text(
                'sport'.toUpperCase(),
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                  letterSpacing: 2,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 8, left: 16, right: 16),
            child: Text(
              post.title, //'Sports title for sport news',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 18,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: Row(
              children: <Widget>[
                Icon(
                  Icons.timer,
                  color: Colors.grey,
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  parseDate(post.dateWritten), //'15 mins',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
