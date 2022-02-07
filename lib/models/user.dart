// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

Users userFromJson(String str) => Users.fromJson(json.decode(str));

String usersToJson(Users data) => json.encode(data.toJson());

class Users {
  Users({
    this.name,
    this.email,
    this.photoURL,
    this.id,
  });

  String name;
  String email;
  String photoURL;
  String id;

  factory Users.fromJson(Map<String, String> json) => Users(
    name: json["name"],
    email: json["email"],
    photoURL: json["photoURL"],
    id: json["id"],
  );

  Map<String, String> toJson() => {
    "name": name,
    "email": email,
    "photoURL": photoURL,
    "id": id,
  };
  static Users us = Users();
}

