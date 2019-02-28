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
  List<Datum> data;

  Freetime({
    this.data,
  });

  factory Freetime.fromJson(Map<String, dynamic> json) => new Freetime(
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
  String freetime;
  String empStartDate;
  String empEndDate;

  Datum({
    this.empId,
    this.empName,
    this.empNickname,
    this.freetime,
    this.empStartDate,
    this.empEndDate,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => new Datum(
    empId: json["emp_id"],
    empName: json["emp_name"],
    empNickname: json["emp_nickname"],
    freetime: json["freetime"],
    empStartDate: json["emp_start_date"],
    empEndDate: json["emp_end_date"],
  );

  Map<String, dynamic> toJson() => {
    "emp_id": empId,
    "emp_name": empName,
    "emp_nickname": empNickname,
    "freetime": freetime,
    "emp_start_date": empStartDate,
    "emp_end_date": empEndDate,
  };
}
