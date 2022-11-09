import 'package:flutter_api_rest/shared/services/custom_dio.dart';

import '../../shared/models/author.dart';
import '../../shared/models/post.dart';

abstract class StartRepository {
  Future<List<Post>> getPosts();
}

class StartRepositoryImpl implements StartRepository {
  final client = CustomDio();
  @override
  Future<List<Post>> getPosts() async {
    try {
      final response = await client.get("/posts");
      final data = response.data as List;
      return data
          .map(
            (e) => Post(
                title: e['title'].toString().substring(0, 5),
                tags: ["Android"],
                readTime: "5 min",
                photoUrl: "https://picsum.photos/1920/1080",
                hasReadLater: false,
                author: Author(
                    id: "id",
                    name: "Augusto",
                    profileUrl: "https://picsum.photos/100/100")),
          )
          .toList();
    } catch (e) {
      throw Exception("Nao foi possivel buscar os dados");
    }
  }
}
