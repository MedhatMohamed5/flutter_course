import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_course/models/category.dart';
import 'package:flutter_course/utilities/api_utilities.dart';

class CategoriesAPI {
  Future<List<Category>> fetchCategories() async {
    List<Category> categories = List<Category>();
    String categoriesUrl = base_api + all_categories;

    var response = await http.get(categoriesUrl);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];
      for (var item in data) {
        categories.add(Category(item['id'].toString(), item['title']));
      }
    }
    categories.forEach((element) {
      print(element.title);
    });
    return categories;
  }
}
