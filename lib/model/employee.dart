class Employee {

  List<Data> data;

  Employee({

    this.data,
  });
  factory Employee.fromJson(Map<String, dynamic> parsedJson){
    var list = parsedJson['data'] as List;
    // print(list.runtimeType);
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
    this.empBranchId,
  });
  factory Data.fromJson(Map<String, dynamic> json) => new Data(
    createdAt: json["createdAt"],
    updatedAt: json["updatedAt"],
    id: json["id"],
    empName: json["empName"],
    empNickname: json["empNickname"],
    empSalary: json["empSalary"],
    empAddress: json["empAddress"],
    empIdCard: json["empIdCard"],
    empTel: json["empTel"],
    empEmerConName: json["empEmerConName"],
    empEmerConRelation: json["empEmerConRelation"],
    empEmerConAddress: json["empEmerConAddress"],
    empEmerConTel: json["empEmerConTel"],

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
