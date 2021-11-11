import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:networking/domain/entity/post.dart';

class ApiClient {
  final client = HttpClient();

  Future<List<Post>> getPosts() async {
    final request = await client
        .getUrl(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    final response = await request.close();
    final json = await response
        .transform(utf8.decoder)
        .toList()
        .then((value) => value.join())
        .then((value) => jsonDecode(value) as List<dynamic>);
    final result = json.map((e) => Post.fromJson(e)).toList();
    return result;
  }
}
