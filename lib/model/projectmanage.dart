// To parse this JSON data, do
//
//     final project = projectFromJson(jsonString);

import 'dart:convert';

Project projectFromJson(String str) {
  final jsonData = json.decode(str);
  return Project.fromJson(jsonData);
}

String projectToJson(Project data) {
  final dyn = data.toJson();
  return json.encode(dyn);
}

class Project {
  Data data;
  String message;

  Project({
    this.data,
    this.message,
  });

  factory Project.fromJson(Map<String, dynamic> json) => new Project(
    data: Data.fromJson(json["data"]),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "data": data.toJson(),
    "message": message,
  };
}

class Data {
  int createdAt;
  int updatedAt;
  int id;
  String projectName;
  String projectCostomerName;
  int projectStartDate;
  int projectEndDate;
  String projectTeamName;
  double projectTotalCost;
  String projectNote;
  String projectStartDateFormat;
  String projectEndDateFormat;

  Data({
    this.createdAt,
    this.updatedAt,
    this.id,
    this.projectName,
    this.projectCostomerName,
    this.projectStartDate,
    this.projectEndDate,
    this.projectTeamName,
    this.projectTotalCost,
    this.projectNote,
    this.projectStartDateFormat,
    this.projectEndDateFormat,
  });

  factory Data.fromJson(Map<String, dynamic> json) => new Data(
    createdAt: json["createdAt"],
    updatedAt: json["updatedAt"],
    id: json["id"],
    projectName: json["project_name"],
    projectCostomerName: json["project_costomer_name"],
    projectStartDate: json["project_start_date"],
    projectEndDate: json["project_end_date"],
    projectTeamName: json["project_team_name"],
    projectTotalCost: json["project_total_cost"].toDouble(),
    projectNote: json["project_note"],
    projectStartDateFormat: json["project_start_date_format"],
    projectEndDateFormat: json["project_end_date_format"],
  );

  Map<String, dynamic> toJson() => {
    "createdAt": createdAt,
    "updatedAt": updatedAt,
    "id": id,
    "project_name": projectName,
    "project_costomer_name": projectCostomerName,
    "project_start_date": projectStartDate,
    "project_end_date": projectEndDate,
    "project_team_name": projectTeamName,
    "project_total_cost": projectTotalCost,
    "project_note": projectNote,
    "project_start_date_format": projectStartDateFormat,
    "project_end_date_format": projectEndDateFormat,
  };
}


/*



class Project {
  List<Data> data;
  String message;

  Project({
    this.data,
    this.message,
  });
  factory Project.fromJson(Map<String, dynamic> parsedJson){
    var list = parsedJson['data'] as List;
    // print(list.runtimeType);
    List<Data> dataList = list.map((i) => Data.fromJson(i)).toList();


    return Project(
        data: dataList
    );
  }
}

class Data {
  int createdAt;
  int updatedAt;
  int id;
  String projectName;
  String projectCostomerName;
  int projectStartDate;
  int projectEndDate;
  String projectTeamName;
  int projectTotalCost;
  String projectNote;
  String projectStartDateFormat;
  String projectEndDateFormat;

  Data({
    this.createdAt,
    this.updatedAt,
    this.id,
    this.projectName,
    this.projectCostomerName,
    this.projectStartDate,
    this.projectEndDate,
    this.projectTeamName,
    this.projectTotalCost,
    this.projectNote,
    this.projectStartDateFormat,
    this.projectEndDateFormat,
  });
  factory Data.fromJson(Map<String, dynamic> json) => new Data(
    createdAt: json["createdAt"],
    updatedAt: json["updatedAt"],
    id: json["id"],
    projectName: json["project_name"],
    projectCostomerName: json["project_costomer_name"],
    projectStartDate: json["project_start_date"],
    projectEndDate: json["project_end_date"],
    projectTeamName: json["project_team_name"],
    projectTotalCost: json["project_total_cost"],
    projectNote: json["project_note"],
    projectStartDateFormat: json["project_start_date_format"],
    projectEndDateFormat: json["project_end_date_format"],
  );
}
  );
 */