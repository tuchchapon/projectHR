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
  int projectTotalCost;
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
class DetailScreen extends StatelessWidget {



  Color colorappbar = const Color(0xFF2ac3fe);


  final  Project project;


  DetailScreen({Key key,  this.project}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData = MediaQuery.of(context);

    double screenWidth = queryData.size.width;
    double screenHeight = queryData.size.height;

    return Scaffold(
      appBar: AppBar(backgroundColor: colorappbar,
        title: Text('ข้อมูลโปรเจ็ค',style: TextStyle(color: Colors.brown[500]),),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(5),height:screenHeight ,width: screenWidth,
            padding: EdgeInsets.all(2.0),
            child: Column(mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                ListTile(
                  title: Text('รายละเอียดโปรเจค  ',style: TextStyle(fontSize: 20),),
                ),
               ListTile(
                 leading: Text('โปรเจ็ค'),
                 title: Text('  '+project.projectName,style: TextStyle(fontSize: 16),),
               ),
                ListTile(
                  leading: Text('ชื่อลูกค้า'),
                  title: Text('  '+project.projectCostomerName,style: TextStyle(fontSize: 16),),
                ),
                ListTile(
                  leading: Text('วันที่เริ่ม'),
                  title: Text('  '+project.projectStartDate,style: TextStyle(fontSize: 16),),
                  trailing: Icon(Icons.event),
                ),
                ListTile(
                  leading: Text('\nวันที่สิ้นสุด'),
                  title: Text('  '+project.projectEndDate,style: TextStyle(fontSize: 16),),
                  trailing: Icon(Icons.event),
                ),
                ListTile(
                  leading: Text('ทีมรับผิดชอบ'),
                  title: Text('  '+project.projectTeamName,style: TextStyle(fontSize: 16),),
                  trailing: FlatButton(onPressed: null, child: Text('จัดการทีม >')),
                ),
                ListTile(
                  leading: Text('หมายเหตุ'),
                  title: Text('       '+project.projectNote,style: TextStyle(fontSize: 16),),
                ),
                Divider(),
                ListTile(
                  title: Text('ค่าใช้จ่ายเพิ่มเติม  ',style: TextStyle(fontSize: 20),),
                  trailing: FlatButton(onPressed: null, child: Text('จัดการค่าใช้จ่าย >')),
                ),

                Divider(),
              ],
            ),
          ),
        ],
      )
    );
  }
}

class ListViewPosts extends StatelessWidget {
  final List<Project> posts;

  ListViewPosts({Key key, this.posts}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
          itemCount: posts.length,
          itemBuilder: (context, Index) {
            return Column(mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                ListTile(
                  title: Text('${posts[Index].projectCostomerName}',),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailScreen(project: posts[Index]),
                      ),
                    );
                  },
                    subtitle: ListTile(
                    title: Text('ลูกค้า : ${posts[Index].projectCostomerName}'),
                    subtitle: Text('ทีมรับผิดชอบ : ${posts[Index].projectTeamName}'),
                  ),
                ),




            //    Text('${posts[Project].projectCostomerName}',),
           //     Text('${posts[Project].projectTeamName}')
              ],
            );
          }),
    );
  }

}
