import 'dart:convert';

import 'package:api_consumir/model/Post.dart';
import 'package:http/http.dart';

class Apis{
  static Future<List<Post>>apiCall(url)async{
    Response res=await get(Uri.parse(url));
    List<Post> posts=[];  
    if (res.statusCode==200) {
      var json=jsonDecode(res.body);
      for (var post in json) {
        posts.add(Post.fromJson(post));
      }
      return posts;
    } else {
      throw Exception('ocorreu um erro');
    }
  }
}