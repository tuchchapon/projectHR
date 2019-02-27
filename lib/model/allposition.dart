// To parse this JSON data, do
//
//     final allposition = allpositionFromJson(jsonString);

import 'dart:convert';

Allposition allpositionFromJson(String str) {
  final jsonData = json.decode(str);
  return Allposition.fromJson(jsonData);
}

String allpositionToJson(Allposition data) {
  final dyn = data.toJson();
  return json.encode(dyn);
}

class Allposition {
  List<Data> data;
  int allPosition;

  Allposition({
    this.data,
    this.allPosition,
  });

  factory Allposition.fromJson(Map<String, dynamic> json) => new Allposition(
    data: new List<Data>.from(json["data"].map((x) => Data.fromJson(x))),
    allPosition: json["all_position"],
  );

  Map<String, dynamic> toJson() => {
    "data": new List<dynamic>.from(data.map((x) => x.toJson())),
    "all_position": allPosition,
  };
}

class Data {
  String label;
  int value;

  Data({
    this.label,
    this.value,
  });

  factory Data.fromJson(Map<String, dynamic> json) => new Data(
    label: json["label"],
    value: json["value"],
  );

  Map<String, dynamic> toJson() => {
    "label": label,
    "value": value,
  };
}
