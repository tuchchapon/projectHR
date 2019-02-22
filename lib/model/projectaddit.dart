// To parse this JSON data, do
//
//     final projectaddit = projectadditFromJson(jsonString);

import 'dart:convert';

Projectaddit projectadditFromJson(String str) {
  final jsonData = json.decode(str);
  return Projectaddit.fromJson(jsonData);
}

String projectadditToJson(Projectaddit data) {
  final dyn = data.toJson();
  return json.encode(dyn);
}

class Projectaddit {
  List<Data> data;
  int totaladdit;
  String message;

  Projectaddit({
    this.data,
    this.totaladdit,
    this.message,
  });

  factory Projectaddit.fromJson(Map<String, dynamic> json) => new Projectaddit(
    data: new List<Data>.from(json["data"].map((x) => Data.fromJson(x))),
    totaladdit: json["totaladdit"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "data": new List<dynamic>.from(data.map((x) => x.toJson())),
    "totaladdit": totaladdit,
    "message": message,
  };

}

class Data {
  int id;
  String projectAdditTitle;
  int projectAdditDate;
  int projectAdditPrice;
  String projectAdditDateFormat;

  Data({
    this.id,
    this.projectAdditTitle,
    this.projectAdditDate,
    this.projectAdditPrice,
    this.projectAdditDateFormat,
  });

  factory Data.fromJson(Map<String, dynamic> json) => new Data(
    id: json["id"],
    projectAdditTitle: json["project_addit_title"],
    projectAdditDate: json["project_addit_date"],
    projectAdditPrice: json["project_addit_price"],
    projectAdditDateFormat: json["project_addit_date_format"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "project_addit_title": projectAdditTitle,
    "project_addit_date": projectAdditDate,
    "project_addit_price": projectAdditPrice,
    "project_addit_date_format": projectAdditDateFormat,
  };
}
