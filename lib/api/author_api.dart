import 'package:flutter_course/models/author.dart';
import 'package:flutter_course/utilities/api_utilities.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AuthorAPI {
  Future<List<Author>> fetchAllAuthors() async {
    List<Author> authors = List<Author>();
    String allAuthorsAPI = base_api + all_authors;
    var response = await http.get(allAuthorsAPI);
    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      var data = jsonData["data"];
      //print(jsonData);
      //print(data);

      for (var item in data) {
        //print(item['name']);
        Author author = Author(
            item['id'].toString(), item['name'], item['avatar'], item['email']);
        authors.add(author);
      }
    }
    return authors;
  }
}
