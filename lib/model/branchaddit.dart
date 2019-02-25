// To parse this JSON data, do
//
//     final branch = branchFromJson(jsonString);

import 'dart:convert';

Branchaddit branchFromJson(String str) {
  final jsonData = json.decode(str);
  return Branchaddit.fromJson(jsonData);
}

String branchToJson(Branchaddit data) {
  final dyn = data.toJson();
  return json.encode(dyn);
}

class Branchaddit {
  List<Data> data;
  int branchAdditTotal;
  String message;

  Branchaddit({
    this.data,
    this.branchAdditTotal,
    this.message,
  });

  factory Branchaddit.fromJson(Map<String, dynamic> json) => new Branchaddit(
    data: new List<Data>.from(json["data"].map((x) => Data.fromJson(x))),
    branchAdditTotal: json["branchAdditTotal"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "data": new List<dynamic>.from(data.map((x) => x.toJson())),
    "branchAdditTotal": branchAdditTotal,
    "message": message,
  };
}

class Data {
  int id;
  String branchAdditTitle;
  int branchAdditPrice;
  int branchAdditDate;
  int branchAdditBranchId;
  String branchAdditDateFormat;

  Data({
    this.id,
    this.branchAdditTitle,
    this.branchAdditPrice,
    this.branchAdditDate,
    this.branchAdditBranchId,
    this.branchAdditDateFormat,
  });

  factory Data.fromJson(Map<String, dynamic> json) => new Data(
    id: json["id"],
    branchAdditTitle: json["branch_addit_title"],
    branchAdditPrice: json["branch_addit_price"],
    branchAdditDate: json["branch_addit_date"],
    branchAdditBranchId: json["branch_addit_branch_id"],
    branchAdditDateFormat: json["branch_addit_date_format"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "branch_addit_title": branchAdditTitle,
    "branch_addit_price": branchAdditPrice,
    "branch_addit_date": branchAdditDate,
    "branch_addit_branch_id": branchAdditBranchId,
    "branch_addit_date_format": branchAdditDateFormat,
  };
}
