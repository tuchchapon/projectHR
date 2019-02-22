// To parse this JSON data, do
//
//     final freetime = freetimeFromJson(jsonString);

import 'dart:convert';

Freetime freetimeFromJson(String str) {
  final jsonData = json.decode(str);
  return Freetime.fromJson(jsonData);
}

String freetimeToJson(Freetime data) {
  final dyn = data.toJson();
  return json.encode(dyn);
}

class Freetime {
  List<Data> data;

  Freetime({
    this.data,
  });

  factory Freetime.fromJson(Map<String, dynamic> json) => new Freetime(
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
  String freetime;

  Data({
    this.empId,
    this.empName,
    this.empNickname,
    this.freetime,
  });

  factory Data.fromJson(Map<String, dynamic> json) => new Data(
    empId: json["emp_id"],
    empName: json["emp_name"],
    empNickname: json["emp_nickname"],
    freetime: json["freetime"],
  );

  Map<String, dynamic> toJson() => {
    "emp_id": empId,
    "emp_name": empName,
    "emp_nickname": empNickname,
    "freetime": freetime,
  };
}
