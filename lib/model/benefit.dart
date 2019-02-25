// To parse this JSON data, do
//
//     final benefit = benefitFromJson(jsonString);

import 'dart:convert';

Benefit benefitFromJson(String str) {
  final jsonData = json.decode(str);
  return Benefit.fromJson(jsonData);
}

String benefitToJson(Benefit data) {
  final dyn = data.toJson();
  return json.encode(dyn);
}

class Benefit {
  List<Datum> data;
  int benafitTotal;
  String message;

  Benefit({
    this.data,
    this.benafitTotal,
    this.message,
  });

  factory Benefit.fromJson(Map<String, dynamic> json) => new Benefit(
    data: new List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    benafitTotal: json["benafitTotal"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "data": new List<dynamic>.from(data.map((x) => x.toJson())),
    "benafitTotal": benafitTotal,
    "message": message,
  };
}

class Datum {
  int createdAt;
  int updatedAt;
  int id;
  String benefitTitle;
  int benefitPrice;
  int benefitDate;
  String benefitNote;
  int benefitEmpId;

  Datum({
    this.createdAt,
    this.updatedAt,
    this.id,
    this.benefitTitle,
    this.benefitPrice,
    this.benefitDate,
    this.benefitNote,
    this.benefitEmpId,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => new Datum(
    createdAt: json["createdAt"],
    updatedAt: json["updatedAt"],
    id: json["id"],
    benefitTitle: json["benefit_title"],
    benefitPrice: json["benefit_price"],
    benefitDate: json["benefit_date"],
    benefitNote: json["benefit_note"],
    benefitEmpId: json["benefit_emp_id"],
  );

  Map<String, dynamic> toJson() => {
    "createdAt": createdAt,
    "updatedAt": updatedAt,
    "id": id,
    "benefit_title": benefitTitle,
    "benefit_price": benefitPrice,
    "benefit_date": benefitDate,
    "benefit_note": benefitNote,
    "benefit_emp_id": benefitEmpId,
  };
}
