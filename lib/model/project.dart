// To parse this JSON data, do
//
//     final project = projectFromJson(jsonString);


class Project {
  int draw;
  int recordsTotal;
  int recordsFiltered;
  List<Data> data;
  double allprojectCost;

  Project({
    this.draw,
    this.recordsTotal,
    this.recordsFiltered,
    this.data,
    this.allprojectCost,
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
  int id;
  String projectName;
  String projectCostomerName;
  String projectTeamName;
  int projectStartDate;
  String projectStartDateFormat;

  Data({

    this.id,
    this.projectName,
    this.projectCostomerName,
    this.projectTeamName,
    this.projectStartDate,
    this.projectStartDateFormat,

  });

  factory Data.fromJson(Map<String, dynamic> parsedJson){
    return Data(
    id: parsedJson["id"],
    projectName: parsedJson["project_name"],
    projectCostomerName: parsedJson["project_costomer_name"],
        projectTeamName: parsedJson["project_team_name"],
      projectStartDate: parsedJson["project_start_date"],
      projectStartDateFormat:  parsedJson["projectStartDateFormat"],

  );
    }
      }
/*

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
  factory Position.fromJson(Map<String, dynamic> parsedJson){

    var list = parsedJson['data'] as List;
    print(list.runtimeType);
    List<Data> dataList = list.map((i) => Data.fromJson(i)).toList();


    return Position(
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