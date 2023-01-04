import 'package:cloud_firestore/cloud_firestore.dart';

class Post {
  Timestamp createdTime;
  String title;
  String description;
  String poster;
  List<String> images;

  Post({required this.createdTime, required this.title, required this.description, required this.poster, required this.images});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      createdTime: json['created_time'],
      title: json['title'],
      description: json['description'],
      poster: json['poster'],
      images: json['images'],
    );
  }
}