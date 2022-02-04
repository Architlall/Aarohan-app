// To parse this JSON data, do
//
//     final sponsorItem = sponsorItemFromJson(jsonString);

import 'dart:convert';

SponsorItem sponsorItemFromJson(String str) => SponsorItem.fromJson(json.decode(str));

String sponsorItemToJson(SponsorItem data) => json.encode(data.toJson());

class SponsorItem {
  SponsorItem({
    this.description,
    this.category,
    this.imageUrl,
    this.priority,
  });

  String description;
  String category;
  String imageUrl;
  int priority;

  factory SponsorItem.fromJson(Map<String, dynamic> json) => SponsorItem(
    description: json["description"],
    category: json["category"],
    imageUrl: json["imageUrl"],
    priority: json["priority"],
  );

  Map<String, dynamic> toJson() => {
    "description": description,
    "category": category,
    "imageUrl": imageUrl,
    "priority": priority,
  };
}
