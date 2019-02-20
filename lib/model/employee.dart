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
  factory Employee.fromJson(Map<String, dynamic> parsedJson){
    var list = parsedJson['data'] as List;
     print(list.runtimeType);
    List<Data> dataList = list.map((i) => Data.fromJson(i)).toList();


    return Employee(
        data: dataList
    );
  }

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
 // int empBranchId;

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
  //  this.empBranchId,
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
   // empBranchId: json["emp_branch_id"],
  );

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


}
