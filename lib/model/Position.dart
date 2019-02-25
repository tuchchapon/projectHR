
import 'dart:convert';

Position positionFromJson(String str) {
  final jsonData = json.decode(str);
  return Position.fromJson(jsonData);
}

String positionToJson(Position data) {
  final dyn = data.toJson();
  return json.encode(dyn);
}

class Position {
  int draw;
  int recordsTotal;
  int recordsFiltered;
  List<Data> data;

  Position({
    this.draw,
    this.recordsTotal,
    this.recordsFiltered,
    this.data,
  });

  factory Position.fromJson(Map<String, dynamic> json) => new Position(
    draw: json["draw"],
    recordsTotal: json["recordsTotal"],
    recordsFiltered: json["recordsFiltered"],
    data: new List<Data>.from(json["data"].map((x) => Data.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "draw": draw,
    "recordsTotal": recordsTotal,
    "recordsFiltered": recordsFiltered,
    "data": new List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Data {
  int createdAt;
  int updatedAt;
  int id;
  String positionName;
  int status;

  Data({
    this.createdAt,
    this.updatedAt,
    this.id,
    this.positionName,
    this.status,
  });

  factory Data.fromJson(Map<String, dynamic> json) => new Data(
    createdAt: json["createdAt"],
    updatedAt: json["updatedAt"],
    id: json["id"],
    positionName: json["position_name"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "createdAt": createdAt,
    "updatedAt": updatedAt,
    "id": id,
    "position_name": positionName,
    "status": status,
  };
}

/*
class Project {
  int draw;
  int recordsTotal;
  int recordsFiltered;
  List<Data> data;

  Project({
    this.draw,
    this.recordsTotal,
    this.recordsFiltered,
    this.data,
  });
  factory Project.fromJson(Map<String, dynamic> parsedJson){

    var list = parsedJson['data'] as List;
    print(list.runtimeType);
    List<Data> dataList = list.map((i) => Data.fromJson(i)).toList();


    return Project(
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
  String positionName;
  int status;

  Data({
    this.createdAt,
    this.updatedAt,
    this.id,
    this.positionName,
    this.status,
  });

  factory Data.fromJson(Map<String, dynamic> parsedJson){
    return Data(
      createdAt: parsedJson["createdAt"],
      updatedAt: parsedJson["updatedAt"],
      id: parsedJson["id"],
      positionName: parsedJson["position_name"],
      status: parsedJson["status"],
    );
  }
}
*/