// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';



/* class PostList {
  final List<Post> posts;

  PostList({required this.posts});

  factory PostList.fromJson(List<dynamic> json) {
    List<Post> posts = json.map((postJson) => Post.fromJson(postJson)).toList();
    return PostList(posts: posts);
  }
}  */
class Post {
  final int userId;
  final int id;
  final String title;
  final String body;

  Post({required this.id, required this.userId, required this.title, required this.body});

 

 factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'],
      title: json['title'],
      body: json['body'], 
      userId: json['userId'], 
    );
  }
}
