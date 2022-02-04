// To parse this JSON data, do
//
//     final eventResponse = eventResponseFromJson(jsonString);

import 'dart:convert';

EventResponse eventResponseFromJson(String str) => EventResponse.fromJson(json.decode(str));

String eventResponseToJson(EventResponse data) => json.encode(data.toJson());

class EventResponse {
  EventResponse({
    this.eventItem,
  });

  List<EventItem> eventItem;

  factory EventResponse.fromJson(Map<String, dynamic> json) => EventResponse(
    eventItem: List<EventItem>.from(json["EventItem"].map((x) => EventItem.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "EventItem": List<dynamic>.from(eventItem.map((x) => x.toJson())),
  };
}

class EventItem {
  EventItem({
    this.title,
    this.body,
    this.color,
    this.imageUrl,
    this.date,
    this.category,
    this.tag,
    this.link,
    this.location,
    this.contact,
  });

  String title;
  String body;
  String color;
  String imageUrl;
  String date;
  String category;
  String tag;
  String link;
  String location;
  String contact;

  factory EventItem.fromJson(Map<String, dynamic> json) => EventItem(
    title: json["title"],
    body: json["body"],
    color: json["color"],
    imageUrl: json["imageUrl"],
    date: json["date"],
    category: json["category"],
    tag: json["tag"],
    link: json["link"],
    location: json["location"],
    contact: json["contact"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "body": body,
    "color": color,
    "imageUrl": imageUrl,
    "date": date,
    "category": category,
    "tag": tag,
    "link": link,
    "location": location,
    "contact": contact,
  };
}
