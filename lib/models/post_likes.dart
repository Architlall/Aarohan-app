// To parse this JSON data, do
//
//     final postsLikeItem = postsLikeItemFromJson(jsonString);

import 'dart:convert';

PostsLikeItem postsLikeItemFromJson(String str) => PostsLikeItem.fromJson(json.decode(str));

String postsLikeItemToJson(PostsLikeItem data) => json.encode(data.toJson());

class PostsLikeItem {
  PostsLikeItem({
    this.author,
    this.date,
  });

  String author;
  String date;

  factory PostsLikeItem.fromJson(Map<String, dynamic> json) => PostsLikeItem(
    author: json["author"],
    date: json["date"],
  );

  Map<String, dynamic> toJson() => {
    "author": author,
    "date": date,
  };
}
