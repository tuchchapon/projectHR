

class Branchaddit {

  List<Data> data;
  String branch_addit_date_format;

  Branchaddit({
    this.data,
  });


  factory Branchaddit.fromJson(Map<String, dynamic> parsedJson){
    var list = parsedJson['data'] as List;
    // print(list.runtimeType);
    List<Data> dataList = list.map((i) => Data.fromJson(i)).toList();


    return Branchaddit(
        data: dataList
    );
  }
}

class Data {
  int createdAt;
  int updatedAt;
  int id;
  String branchAdditTitle;
  int branchAdditPrice;
  int branchAdditDate;
  int branchAdditBranchId;

  Data({
    this.createdAt,
    this.updatedAt,
    this.id,
    this.branchAdditTitle,
    this.branchAdditPrice,
    this.branchAdditDate,
    this.branchAdditBranchId,
  });
  factory Data.fromJson(Map<String, dynamic> json) => new Data(
    createdAt: json["createdAt"],
    updatedAt: json["updatedAt"],
    id: json["id"],
    branchAdditTitle: json["branch_addit_title"],
    branchAdditPrice: json["branch_addit_price"],
    branchAdditDate: json["branch_addit_date"],
    branchAdditBranchId: json["branch_addit_branch_id"],
  );
}
