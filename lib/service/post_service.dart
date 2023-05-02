import 'package:crud_api/repositories/post_repositories.dart';

import '../models/post_model.dart';

class PostService {
  static const String endpoint = 'posts';

  static Future<List<Post>> getPosts() async {
    final data = await ApiService.get(endpoint);
    return List<Post>.from(data.map((x) => Post.fromJson(x)));
  }

  static Future<Post> create(Post post) async {
    final data = await ApiService.post(endpoint, post.toJson());
    return Post.fromJson(data);
  }

  static Future<Post> update(Post post) async {
    final data = await ApiService.put('$endpoint/${post.id}', post.toJson());
    return Post.fromJson(data);
  }

  static Future<void> delete(int id) async {
    await ApiService.delete('$endpoint/$id');
  }
}
