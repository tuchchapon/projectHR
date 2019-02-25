

class Branchfixcost {

  List<Data> data;

  Branchfixcost({
    this.data,
  });


  factory Branchfixcost.fromJson(Map<String, dynamic> parsedJson){
    var list = parsedJson['data'] as List;
    // print(list.runtimeType);
    List<Data> dataList = list.map((i) => Data.fromJson(i)).toList();


    return Branchfixcost(
        data: dataList
    );
  }
}

class Data {
  int createdAt;
  int updatedAt;
  int id;
  String fixcostTitle;
  int fixcostPrice;
  String fixcostNote;
  int fixcostBranchId;

  Data({
    this.createdAt,
    this.updatedAt,
    this.id,
    this.fixcostTitle,
    this.fixcostPrice,
    this.fixcostNote,
    this.fixcostBranchId,
  });

  factory Data.fromJson(Map<String, dynamic> json) => new Data(
    createdAt: json["createdAt"],
    updatedAt: json["updatedAt"],
    id: json["id"],
    fixcostTitle: json["fixcost_title"],
    fixcostPrice: json["fixcost_price"],
    fixcostNote: json["fixcost_note"],
    fixcostBranchId: json["fixcost_branch_id"],
  );

}

