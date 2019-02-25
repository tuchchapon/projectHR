class Benefit {
  List<Data> data;
  String message;

  Benefit({
    this.data,
    this.message,
  });
  factory Benefit.fromJson(Map<String, dynamic> parsedJson){
    var list = parsedJson['data'] as List;
    // print(list.runtimeType);
    List<Data> dataList = list.map((i) => Data.fromJson(i)).toList();


    return Benefit(
        data: dataList
    );
  }
}

class Data {
  int createdAt;
  int updatedAt;
  int id;
  String benefitTitle;
  int benefitPrice;
  int benefitDate;
  String benefitNote;
  int benefitEmpId;

  Data({
    this.createdAt,
    this.updatedAt,
    this.id,
    this.benefitTitle,
    this.benefitPrice,
    this.benefitDate,
    this.benefitNote,
    this.benefitEmpId,
  });
  factory Data.fromJson(Map<String, dynamic> json) => new Data(
    createdAt: json["createdAt"],
    updatedAt: json["updatedAt"],
    id: json["id"],
    benefitTitle: json["benefit_title"],
    benefitPrice: json["benefit_price"],
    benefitDate: json["benefit_date"],
    benefitNote: json["benefit_note"],
    benefitEmpId: json["benefit_emp_id"],
  );
}
