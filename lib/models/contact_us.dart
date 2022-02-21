import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

ContactResponse contactResponseFromJson(String str) =>
    ContactResponse.fromJson(json.decode(str));

String contactResponseToJson(ContactResponse data) =>
    json.encode(data.toJson());

class ContactResponse {
  ContactResponse({
    this.contactItem,
  });

  List<ContactItem> contactItem;

  factory ContactResponse.fromJson(Map<String, dynamic> json) =>
      ContactResponse(
        contactItem: List<ContactItem>.from(
            json["ContactItem"].map((x) => ContactItem.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
    "ContactItem": List<dynamic>.from(contactItem.map((x) => x.toJson())),
  };
  static ContactResponse contactResponse = ContactResponse();
}

class ContactItem {
  ContactItem({this.phone, this.imageUrl, this.linkedin});

  String phone;
  String linkedin;
  String imageUrl;

  factory ContactItem.fromJson(Map<String, dynamic> json) => ContactItem(
    phone: json['phone'],
    linkedin: json['linkedin'],
    imageUrl: json['imageUrl'],
  );

  factory ContactItem.fromFirestore(DocumentSnapshot documentSnapshot) {
    return ContactItem.fromJson(documentSnapshot.data());
  }

  Map<String, dynamic> toJson() =>
      {"phone": phone, "imageUrl": imageUrl, "linkedin": linkedin};
}