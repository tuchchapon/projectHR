
import 'package:flutter/material.dart';

class Project {
  int createdAt;
  int updatedAt;
  int id;
  String projectName;
  String projectCostomerName;
  String projectStartDate;
  String projectEndDate;
  String projectTeamName;
  double projectTotalCost;
  String projectNote;

  Project({
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
  });

  factory Project.fromJson(Map<String, dynamic> json) => new Project(
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
  };
}
class ListViewPosts extends StatelessWidget {
  final List<Project> posts;

  ListViewPosts({Key key, this.posts}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
          itemCount: posts.length,
          itemBuilder: (context, Project) {
            return Column(
              children: <Widget>[
                ListTile(
                  title: Text('${posts[Project].projectName}',),
                  subtitle: Text('${posts[Project].projectCostomerName}',),
                ),
                Divider(color: Colors.grey,)
              ],
            );
          }),
    );
  }

}