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
  int draw;
  int recordsTotal;
  int recordsFiltered;
  List<Datum> data;
  double allprojectCost;

  Project({
    this.draw,
    this.recordsTotal,
    this.recordsFiltered,
    this.data,
    this.allprojectCost,
  });

  factory Project.fromJson(Map<String, dynamic> json) => new Project(
    draw: json["draw"],
    recordsTotal: json["recordsTotal"],
    recordsFiltered: json["recordsFiltered"],
    data: new List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    allprojectCost: json["allproject_cost"].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "draw": draw,
    "recordsTotal": recordsTotal,
    "recordsFiltered": recordsFiltered,
    "data": new List<dynamic>.from(data.map((x) => x.toJson())),
    "allproject_cost": allprojectCost,
  };
}

class Datum {
  int id;
  String projectName;
  String projectCostomerName;
  String projectTeamName;
  int projectStartDate;
  String projectStartDateFormat;
  double projectTotalCost;

  Datum({
    this.id,
    this.projectName,
    this.projectCostomerName,
    this.projectTeamName,
    this.projectStartDate,
    this.projectStartDateFormat,
    this.projectTotalCost,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => new Datum(
    id: json["id"],
    projectName: json["project_name"],
    projectCostomerName: json["project_costomer_name"],
    projectTeamName: json["project_team_name"],
    projectStartDate: json["project_start_date"],
    projectStartDateFormat: json["project_start_date_format"],
    projectTotalCost: json["project_total_cost"].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "project_name": projectName,
    "project_costomer_name": projectCostomerName,
    "project_team_name": projectTeamName,
    "project_start_date": projectStartDate,
    "project_start_date_format": projectStartDateFormat,
    "project_total_cost": projectTotalCost,
  };
}
