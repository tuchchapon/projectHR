

class Branch {
  int draw;
  int recordsTotal;
  int recordsFiltered;
  List<Data> data;

  Branch({
    this.draw,
    this.recordsTotal,
    this.recordsFiltered,
    this.data,

  });
  factory Branch.fromJson(Map<String, dynamic> parsedJson){
    var list = parsedJson['data'] as List;
   // print(list.runtimeType);
    List<Data> dataList = list.map((i) => Data.fromJson(i)).toList();


    return Branch(
        draw: parsedJson['draw'],
        recordsTotal: parsedJson['recordsTotal'],
        recordsFiltered: parsedJson['recordsFiltered'],
        data: dataList
    );
  }
}

class Data {
  int createdAt;
  int updatedAt;
  int id;
  String branchName;
  String branchAddress;
  int status;

  Data({
    this.createdAt,
    this.updatedAt,
    this.id,
    this.branchName,
    this.branchAddress,
    this.status,
  });

  factory Data.fromJson(Map<String, dynamic> json){
    return Data(
         createdAt: json["createdAt"],
          updatedAt: json["updatedAt"],
          id: json["id"],
           branchName: json["branch_name"],
          branchAddress: json["branch_address"],
          status: json["status"],
    );
  }
}
