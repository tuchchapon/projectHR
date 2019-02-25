// To parse this JSON data, do
//
//     final fixcost = fixcostFromJson(jsonString);

import 'dart:convert';

Branchfixcost fixcostFromJson(String str) {
  final jsonData = json.decode(str);
  return Branchfixcost.fromJson(jsonData);
}

String fixcostToJson(Branchfixcost data) {
  final dyn = data.toJson();
  return json.encode(dyn);
}

class Branchfixcost {
  List<Data> data;
  int branchFixcostTotal;
  String message;

  Branchfixcost({
    this.data,
    this.branchFixcostTotal,
    this.message,
  });

  factory Branchfixcost.fromJson(Map<String, dynamic> json) => new Branchfixcost(
    data: new List<Data>.from(json["data"].map((x) => Data.fromJson(x))),
    branchFixcostTotal: json["branchFixcostTotal"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "data": new List<dynamic>.from(data.map((x) => x.toJson())),
    "branchFixcostTotal": branchFixcostTotal,
    "message": message,
  };
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

  Map<String, dynamic> toJson() => {
    "createdAt": createdAt,
    "updatedAt": updatedAt,
    "id": id,
    "fixcost_title": fixcostTitle,
    "fixcost_price": fixcostPrice,
    "fixcost_note": fixcostNote,
    "fixcost_branch_id": fixcostBranchId,
  };
}
