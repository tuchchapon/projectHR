// To parse this JSON data, do
//
//     final branchaddit = branchadditFromJson(jsonString);

import 'dart:convert';

Branchaddit branchadditFromJson(String str) {
  final jsonData = json.decode(str);
  return Branchaddit.fromJson(jsonData);
}

String branchadditToJson(Branchaddit data) {
  final dyn = data.toJson();
  return json.encode(dyn);
}

class Branchaddit {
  List<Datum> data;
  double branchAdditTotal;
  String message;

  Branchaddit({
    this.data,
    this.branchAdditTotal,
    this.message,
  });

  factory Branchaddit.fromJson(Map<String, dynamic> json) => new Branchaddit(
    data: new List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    branchAdditTotal: json["branchAdditTotal"].toDouble(),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "data": new List<dynamic>.from(data.map((x) => x.toJson())),
    "branchAdditTotal": branchAdditTotal,
    "message": message,
  };
}

class Datum {
  int id;
  String branchAdditTitle;
  double branchAdditPrice;
  int branchAdditDate;
  int branchAdditBranchId;
  String branchAdditDateFormat;

  Datum({
    this.id,
    this.branchAdditTitle,
    this.branchAdditPrice,
    this.branchAdditDate,
    this.branchAdditBranchId,
    this.branchAdditDateFormat,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => new Datum(
    id: json["id"],
    branchAdditTitle: json["branch_addit_title"],
    branchAdditPrice: json["branch_addit_price"].toDouble(),
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
