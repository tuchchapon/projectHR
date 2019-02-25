// To parse this JSON data, do
//
//     final mandaycost = mandaycostFromJson(jsonString);

import 'dart:convert';

Mandaycost mandaycostFromJson(String str) {
  final jsonData = json.decode(str);
  return Mandaycost.fromJson(jsonData);
}

String mandaycostToJson(Mandaycost data) {
  final dyn = data.toJson();
  return json.encode(dyn);
}

class Mandaycost {
  List<Data> data;
  double projectCostTotal;
  String projectName;
  String projectCostomerName;

  Mandaycost({
    this.data,
    this.projectCostTotal,
    this.projectName,
    this.projectCostomerName,
  });

  factory Mandaycost.fromJson(Map<String, dynamic> json) => new Mandaycost(
    data: new List<Data>.from(json["data"].map((x) => Data.fromJson(x))),
    projectCostTotal: json["project_cost_total"].toDouble(),
    projectName: json["project_name"],
    projectCostomerName: json["project_costomer_name"],
  );

  Map<String, dynamic> toJson() => {
    "data": new List<dynamic>.from(data.map((x) => x.toJson())),
    "project_cost_total": projectCostTotal,
    "project_name": projectName,
    "project_costomer_name": projectCostomerName,
  };
}

class Data {
  int empId;
  String empName;
  String empNickname;
  String positionName;
  int workday;
  int empSprint;
  double manday;
  double selling;

  Data({
    this.empId,
    this.empName,
    this.empNickname,
    this.positionName,
    this.workday,
    this.empSprint,
    this.manday,
    this.selling,
  });

  factory Data.fromJson(Map<String, dynamic> json) => new Data(
    empId: json["emp_id"],
    empName: json["emp_name"],
    empNickname: json["emp_nickname"],
    positionName: json["position_name"],
    workday: json["workday"],
    empSprint: json["emp_sprint"],
    manday: json["manday"].toDouble(),
    selling: json["Selling"].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "emp_id": empId,
    "emp_name": empName,
    "emp_nickname": empNickname,
    "position_name": positionName,
    "workday": workday,
    "emp_sprint": empSprint,
    "manday": manday,
    "Selling": selling,
  };
}
