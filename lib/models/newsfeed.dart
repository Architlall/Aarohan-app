// To parse this JSON data, do
//
//     final newsfeedItem = newsfeedItemFromJson(jsonString);

import 'dart:convert';

NewsfeedItem newsfeedItemFromJson(String str) => NewsfeedItem.fromJson(json.decode(str));

String newsfeedItemToJson(NewsfeedItem data) => json.encode(data.toJson());

class NewsfeedItem {
  NewsfeedItem({
    this.title,
    this.body,
    this.imageUrl,
    this.date,
    this.likesCount,
    this.commentsCount,
  });

  String title;
  String body;
  String imageUrl;
  String date;
  String likesCount;
  String commentsCount;

  factory NewsfeedItem.fromJson(Map<String, dynamic> json) => NewsfeedItem(
    title: json["title"],
    body: json["body"],
    imageUrl: json["imageUrl"],
    date: json["date"],
    likesCount: json["likesCount"],
    commentsCount: json["commentsCount"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "body": body,
    "imageUrl": imageUrl,
    "date": date,
    "likesCount": likesCount,
    "commentsCount": commentsCount,
  };
}
