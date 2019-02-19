class Empployee {
  int draw;
  int recordsTotal;
  int recordsFiltered;
  List<Datum> data;

  Empployee({
    this.draw,
    this.recordsTotal,
    this.recordsFiltered,
    this.data,
  });
}

class Datum {
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

  Datum({
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
