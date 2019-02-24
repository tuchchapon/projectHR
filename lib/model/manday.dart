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
  List<Datum> data;

  Manday({
    this.data,
  });

  factory Manday.fromJson(Map<String, dynamic> json) => new Manday(
    data: new List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": new List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  int empId;
  String empName;
  String empNickname;
  double manday;
  double selling;

  Datum({
    this.empId,
    this.empName,
    this.empNickname,
    this.manday,
    this.selling,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => new Datum(
    empId: json["emp_id"],
    empName: json["emp_name"],
    empNickname: json["emp_nickname"],
    manday: json["manday"].toDouble(),
    selling: json["Selling"].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "emp_id": empId,
    "emp_name": empName,
    "emp_nickname": empNickname,
    "manday": manday,
    "Selling": selling,
  };
}
