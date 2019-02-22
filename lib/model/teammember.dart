
import 'dart:convert';

Teammember teammemberFromJson(String str) {
  final jsonData = json.decode(str);
  return Teammember.fromJson(jsonData);
}

String teammemberToJson(Teammember data) {
  final dyn = data.toJson();
  return json.encode(dyn);
}

class Teammember {
  List<Data> data;
  String message;

  Teammember({
    this.data,
    this.message,
  });

  factory Teammember.fromJson(Map<String, dynamic> json) => new Teammember(
    data: new List<Data>.from(json["data"].map((x) => Data.fromJson(x))),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "data": new List<dynamic>.from(data.map((x) => x.toJson())),
    "message": message,
  };
}

class Data {
  int updatedAt;
  int id;
  int empStartDate;
  int empEndDate;
  EmpId empId;
  PositionId positionId;
  String empStartDateFormat;
  String empEndDateFormat;

  Data({
    this.updatedAt,
    this.id,
    this.empStartDate,
    this.empEndDate,
    this.empId,
    this.positionId,
    this.empStartDateFormat,
    this.empEndDateFormat,
  });

  factory Data.fromJson(Map<String, dynamic> json) => new Data(
    updatedAt: json["updatedAt"],
    id: json["id"],
    empStartDate: json["emp_start_date"],
    empEndDate: json["emp_end_date"],
    empId: EmpId.fromJson(json["emp_id"]),
    positionId: PositionId.fromJson(json["position_id"]),
    empStartDateFormat: json["emp_start_date_format"],
    empEndDateFormat: json["emp_end_date_format"],
  );

  Map<String, dynamic> toJson() => {
    "updatedAt": updatedAt,
    "id": id,
    "emp_start_date": empStartDate,
    "emp_end_date": empEndDate,
    "emp_id": empId.toJson(),
    "position_id": positionId.toJson(),
    "emp_start_date_format": empStartDateFormat,
    "emp_end_date_format": empEndDateFormat,
  };
}

class EmpId {
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
  int empBranchId;

  EmpId({
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

  factory EmpId.fromJson(Map<String, dynamic> json) => new EmpId(
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
    empBranchId: json["emp_branch_id"],
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
    "emp_branch_id": empBranchId,
  };
}

class PositionId {
  int createdAt;
  int updatedAt;
  int id;
  String positionName;
  int status;

  PositionId({
    this.createdAt,
    this.updatedAt,
    this.id,
    this.positionName,
    this.status,
  });

  factory PositionId.fromJson(Map<String, dynamic> json) => new PositionId(
    createdAt: json["createdAt"],
    updatedAt: json["updatedAt"],
    id: json["id"],
    positionName: json["position_name"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "createdAt": createdAt,
    "updatedAt": updatedAt,
    "id": id,
    "position_name": positionName,
    "status": status,
  };
}
