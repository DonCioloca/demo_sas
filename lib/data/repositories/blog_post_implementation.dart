import 'dart:convert';

import 'package:demo_28_09/domain/models/thumbnail_model.dart';
import 'package:http/http.dart' as http;
import 'blog_post_repository.dart';

class BlogPostImplementation implements BlogPostRepository {
  @override
  Future<List<ThumbnailModel>> fetchThumbnails() async {
    try {
      final response = await http
          .get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return List<ThumbnailModel>.from(
            data.map((e) => ThumbnailModel.fromJson(e)));
      }
    } catch (e) {}
    return [];
  }
}
