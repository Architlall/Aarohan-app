// To parse this JSON data, do
//
//     final memoryItem = memoryItemFromJson(jsonString);

import 'dart:convert';

MemoryItem memoryItemFromJson(String str) => MemoryItem.fromJson(json.decode(str));

String memoryItemToJson(MemoryItem data) => json.encode(data.toJson());

class MemoryItem {
  MemoryItem({
    this.name,
    this.email,
    this.imageUrl,
    this.date,
  });

  String name;
  String email;
  String imageUrl;
  String date;

  factory MemoryItem.fromJson(Map<String, dynamic> json) => MemoryItem(
    name: json["name"],
    email: json["email"],
    imageUrl: json["imageUrl"],
    date: json["date"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "email": email,
    "imageUrl": imageUrl,
    "date": date,
  };
}
