// To parse this JSON data, do
//
//     final employee = employeeFromJson(jsonString);

import 'dart:convert';

Employee employeeFromJson(String str) {
  final jsonData = json.decode(str);
  return Employee.fromJson(jsonData);
}

String employeeToJson(Employee data) {
  final dyn = data.toJson();
  return json.encode(dyn);
}

class Employee {
  int draw;
  int recordsTotal;
  int recordsFiltered;
  List<Data> data;

  Employee({
    this.draw,
    this.recordsTotal,
    this.recordsFiltered,
    this.data,
  });

  factory Employee.fromJson(Map<String, dynamic> json) => new Employee(
    draw: json["draw"],
    recordsTotal: json["recordsTotal"],
    recordsFiltered: json["recordsFiltered"],
    data: new List<Data>.from(json["data"].map((x) => Data.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "draw": draw,
    "recordsTotal": recordsTotal,
    "recordsFiltered": recordsFiltered,
    "data": new List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Data {
  int createdAt;
  int updatedAt;
  int id;
  String empName;
  String empNickname;
  int empSalary;
  String empAddress;
  String empIdCard;
  String empTel;
  String empEmerConName;
  String empEmerConRelation;
  String empEmerConAddress;
  String empEmerConTel;
  int status;
  EmpBranchId empBranchId;

  Data({
    this.createdAt,
    this.updatedAt,
    this.id,
    this.empName,
    this.empNickname,
    this.empSalary,
    this.empAddress,
    this.empIdCard,
    this.empTel,
    this.empEmerConName,
    this.empEmerConRelation,
    this.empEmerConAddress,
    this.empEmerConTel,
    this.status,
    this.empBranchId,
  });

  factory Data.fromJson(Map<String, dynamic> json) => new Data(
    createdAt: json["createdAt"],
    updatedAt: json["updatedAt"],
    id: json["id"],
    empName: json["emp_name"],
    empNickname: json["emp_nickname"],
    empSalary: json["emp_salary"],
    empAddress: json["emp_address"],
    empIdCard: json["emp_id_card"],
    empTel: json["emp_tel"],
    empEmerConName: json["emp_emer_con_name"],
    empEmerConRelation: json["emp_emer_con_relation"],
    empEmerConAddress: json["emp_emer_con_address"],
    empEmerConTel: json["emp_emer_con_tel"],
    status: json["status"],
    empBranchId: EmpBranchId.fromJson(json["emp_branch_id"]),
  );

  Map<String, dynamic> toJson() => {
    "createdAt": createdAt,
    "updatedAt": updatedAt,
    "id": id,
    "emp_name": empName,
    "emp_nickname": empNickname,
    "emp_salary": empSalary,
    "emp_address": empAddress,
    "emp_id_card": empIdCard,
    "emp_tel": empTel,
    "emp_emer_con_name": empEmerConName,
    "emp_emer_con_relation": empEmerConRelation,
    "emp_emer_con_address": empEmerConAddress,
    "emp_emer_con_tel": empEmerConTel,
    "status": status,
    "emp_branch_id": empBranchId.toJson(),
  };
}

class EmpBranchId {
  int createdAt;
  int updatedAt;
  int id;
  String branchName;
  String branchAddress;
  int status;

  EmpBranchId({
    this.createdAt,
    this.updatedAt,
    this.id,
    this.branchName,
    this.branchAddress,
    this.status,
  });

  factory EmpBranchId.fromJson(Map<String, dynamic> json) => new EmpBranchId(
    createdAt: json["createdAt"],
    updatedAt: json["updatedAt"],
    id: json["id"],
    branchName: json["branch_name"],
    branchAddress: json["branch_address"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "createdAt": createdAt,
    "updatedAt": updatedAt,
    "id": id,
    "branch_name": branchName,
    "branch_address": branchAddress,
    "status": status,
  };
}
