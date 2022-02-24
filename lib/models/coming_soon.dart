import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

ComingResponse comingResponseFromJson(String str) =>
    ComingResponse.fromJson(json.decode(str));

String comingResponseToJson(ComingResponse data) =>
    json.encode(data.toJson());

class ComingResponse {
  ComingResponse({
    this.comingItem,
  });

  List<ComingItem> comingItem;

  factory ComingResponse.fromJson(Map<String, dynamic> json) =>
      ComingResponse(
        comingItem: List<ComingItem>.from(
            json["ComingItem"].map((x) => ComingItem.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
    "ComingItem": List<dynamic>.from(comingItem.map((x) => x.toJson())),
  };
  static ComingResponse comingResponse = ComingResponse();
}

class ComingItem {
  ComingItem({this.flag});

bool flag;

  factory ComingItem.fromJson(Map<String, dynamic> json) => ComingItem(
    flag: json['flag']
  );

  factory ComingItem.fromFirestore(DocumentSnapshot documentSnapshot) {
    return ComingItem.fromJson(documentSnapshot.data());
  }

  Map<String, dynamic> toJson() =>
      {'flag':flag};
}