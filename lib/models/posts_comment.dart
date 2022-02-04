// To parse this JSON data, do
//
//     final postsCommentItem = postsCommentItemFromJson(jsonString);

import 'dart:convert';

PostsCommentItem postsCommentItemFromJson(String str) => PostsCommentItem.fromJson(json.decode(str));

String postsCommentItemToJson(PostsCommentItem data) => json.encode(data.toJson());

class PostsCommentItem {
  PostsCommentItem({
    this.authorId,
    this.authorName,
    this.authorImage,
    this.createdDate,
    this.id,
    this.text,
  });

  String authorId;
  String authorName;
  String authorImage;
  String createdDate;
  String id;
  String text;

  factory PostsCommentItem.fromJson(Map<String, dynamic> json) => PostsCommentItem(
    authorId: json["authorId"],
    authorName: json["authorName"],
    authorImage: json["authorImage"],
    createdDate: json["createdDate"],
    id: json["id"],
    text: json["text"],
  );

  Map<String, dynamic> toJson() => {
    "authorId": authorId,
    "authorName": authorName,
    "authorImage": authorImage,
    "createdDate": createdDate,
    "id": id,
    "text": text,
  };
}
