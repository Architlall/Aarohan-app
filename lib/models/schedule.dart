// To parse this JSON data, do
//
//     final scheduleItem = scheduleItemFromJson(jsonString);

import 'dart:convert';

ScheduleItem scheduleItemFromJson(String str) => ScheduleItem.fromJson(json.decode(str));

String scheduleItemToJson(ScheduleItem data) => json.encode(data.toJson());

class ScheduleItem {
  ScheduleItem({
    this.key,
    this.name,
    this.category,
    this.time,
    this.completed,
  });

  String key;
  String name;
  String category;
  String time;
  bool completed;

  factory ScheduleItem.fromJson(Map<String, dynamic> json) => ScheduleItem(
    key: json["key"],
    name: json["name"],
    category: json["category"],
    time: json["time"],
    completed: json["completed"],
  );

  Map<String, dynamic> toJson() => {
    "key": key,
    "name": name,
    "category": category,
    "time": time,
    "completed": completed,
  };
}
