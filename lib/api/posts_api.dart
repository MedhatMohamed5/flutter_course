import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_course/models/post.dart';
import 'package:flutter_course/utilities/api_utilities.dart';

class PostsAPI {
  /*Future<List<Post>> fetchWhatsNew() async {
    String whatsNewUrl = base_api + whats_new;
    List<Post> posts = List<Post>();
    var response = await http.get(whatsNewUrl);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];
      for (var item in data) {
        posts.add(Post(
          id: item['id'].toString(),
          userId: item['user_id'].toString(),
          title: item['title'],
          content: item['content'],
          dateWritten: item['date_written'].toString(),
          featuredImage: item['featured_image'],
          votesDown: item['votes_down'],
          votesUp: item['votes_up'],
          votersDown: (item['voters_down'] == null)
              ? List<int>()
              : jsonDecode(item['voters_down']),
          votersUp: (item['voters_up'] == null)
              ? List<int>()
              : jsonDecode(item['voters_up']),
          categoryId: item['category_id'].toString(),
        ));
      }
    }
    return posts;
  }

  Future<List<Post>> fetchRecentUpdate() async {
    String whatsNewUrl = base_api + recent_update;
    List<Post> posts = List<Post>();
    var response = await http.get(whatsNewUrl);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];
      for (var item in data) {
        posts.add(Post(
          id: item['id'].toString(),
          userId: item['user_id'].toString(),
          title: item['title'],
          content: item['content'],
          dateWritten: item['date_written'].toString(),
          featuredImage: item['featured_image'],
          votesDown: item['votes_down'],
          votesUp: item['votes_up'],
          votersDown: (item['voters_down'] == null)
              ? List<int>()
              : jsonDecode(item['voters_down']),
          votersUp: (item['voters_up'] == null)
              ? List<int>()
              : jsonDecode(item['voters_up']),
          categoryId: item['category_id'].toString(),
        ));
      }
    }
    return posts;
  }

  Future<List<Post>> fetchPopular() async {
    String whatsNewUrl = base_api + popular_posts;
    List<Post> posts = List<Post>();
    var response = await http.get(whatsNewUrl);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];
      for (var item in data) {
        posts.add(Post(
          id: item['id'].toString(),
          userId: item['user_id'].toString(),
          title: item['title'],
          content: item['content'],
          dateWritten: item['date_written'].toString(),
          featuredImage: item['featured_image'],
          votesDown: item['votes_down'],
          votesUp: item['votes_up'],
          votersDown: (item['voters_down'] == null)
              ? List<int>()
              : jsonDecode(item['voters_down']),
          votersUp: (item['voters_up'] == null)
              ? List<int>()
              : jsonDecode(item['voters_up']),
          categoryId: item['category_id'].toString(),
        ));
      }
    }
    return posts;
  }*/
  Future<List<Post>> fetchPostsByType(String type) async {
    String whatsNewUrl = base_api + post_category + type;
    List<Post> posts = List<Post>();
    var response = await http.get(whatsNewUrl);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];
      for (var item in data) {
        posts.add(Post(
          id: item['id'].toString(),
          userId: item['user_id'].toString(),
          title: item['title'],
          content: item['content'],
          dateWritten: item['date_written'].toString(),
          featuredImage: item['featured_image'],
          votesDown: item['votes_down'],
          votesUp: item['votes_up'],
          votersDown: (item['voters_down'] == null)
              ? List<int>()
              : jsonDecode(item['voters_down']),
          votersUp: (item['voters_up'] == null)
              ? List<int>()
              : jsonDecode(item['voters_up']),
          categoryId: item['category_id'].toString(),
        ));
      }
    }
    return posts;
  }
}
