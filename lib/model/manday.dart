// To parse this JSON data, do
//
//     final manday = mandayFromJson(jsonString);

import 'dart:convert';

Manday mandayFromJson(String str) {
  final jsonData = json.decode(str);
  return Manday.fromJson(jsonData);
}

String mandayToJson(Manday data) {
  final dyn = data.toJson();
  return json.encode(dyn);
}

class Manday {
  List<Data> data;

  Manday({
    this.data,
  });

  factory Manday.fromJson(Map<String, dynamic> json) => new Manday(
    data: new List<Data>.from(json["data"].map((x) => Data.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": new List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Data {
  int empId;
  String empName;
  String empNickname;
  double manday;

  Data({
    this.empId,
    this.empName,
    this.empNickname,
    this.manday,
  });

  factory Data.fromJson(Map<String, dynamic> json) => new Data(
    empId: json["emp_id"],
    empName: json["emp_name"],
    empNickname: json["emp_nickname"],
    manday: json["manday"].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "emp_id": empId,
    "emp_name": empName,
    "emp_nickname": empNickname,
    "manday": manday,
  };
}
