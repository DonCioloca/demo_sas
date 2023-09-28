import 'package:demo_28_09/domain/models/thumbnail_model.dart';

abstract class BlogPostRepository {
  Future<List<ThumbnailModel>> fetchThumbnails();
}
