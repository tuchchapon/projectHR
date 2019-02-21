


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
