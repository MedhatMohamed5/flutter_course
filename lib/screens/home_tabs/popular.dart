import 'package:flutter/material.dart';
import 'package:flutter_course/api/posts_api.dart';
import 'package:flutter_course/models/post.dart';
import 'package:flutter_course/screens/post_page.dart';
import 'package:flutter_course/utilities/data_utilities.dart';

class Popular extends StatefulWidget {
  @override
  _PopularState createState() => _PopularState();
}

class _PopularState extends State<Popular> {
  PostsAPI _postsAPI = PostsAPI();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _postsAPI.fetchPostsByType("3"),
        // ignore: missing_return
        builder: (context, snapshot) {
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
              if (snapshot.hasError) {
                return error(snapshot.error);
              } else {
                if (snapshot.hasData) {
                  List<Post> posts = snapshot.data;

                  return ListView.builder(
                    itemBuilder: (context, index) {
                      return Card(
                        child: _drawSingleRow(posts[index]),
                      );
                    },
                    itemCount: posts.length,
                  );
                } else {
                  return noData();
                }
              }
              break;
          }
        });
  }

  Widget _drawSingleRow(Post post) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PostPage(post),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: <Widget>[
            SizedBox(
              child: Image(
                image: NetworkImage(post.featuredImage),
                //ExactAssetImage('assets/images/placeholder_bg.png'),
                fit: BoxFit.cover,
              ),
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
                    post.title, //'The world global warming annual summit',
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
                          Text(
                            parseDate(post.dateWritten),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
