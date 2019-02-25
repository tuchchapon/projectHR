import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../model/project.dart';
import './editproject.dart';
import 'package:moment/moment.dart';
import './showproject.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

//


//
class project extends StatefulWidget {

  @override
  _projectState createState() => new _projectState();
}

class _projectState extends State<project>  {



  // List positionlist;
  Project listProject = new Project();
  int isTrue = 0;
  @override
  void initState() {
    super.initState();
    fetchPost();
  }
  Future<void> fetchPost() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("prefsToken");
    final response =
    await http.get('http://35.198.219.154:1337/projectmanage/datatable',
        headers: {'authorization': "Bearer "+token});
    String jsonString = response.body.toString();
    final jsonResponse = json.decode(jsonString);
     print(jsonResponse);

    if (response.statusCode == 200) {

      // If the call to the server was successful, parse the JSON
//      return Position.fromJson(json.decode(response.body));
      listProject = new Project.fromJson(jsonResponse);
      setState(() {
        this.isTrue = 1;
      });
      print('AAAAAA');
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
    // print('print+++++++'+listPosition.data[1].positionName);
  }

  Future<dynamic> deleteproject(id) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String Token = prefs.getString("prefsToken");
    var url = 'http://35.198.219.154:1337/projectmanage/delete';
    var body = {
      'id': id,
    };
    print(id.toString());
    http.Response response = await http.post(url,
        headers: {'authorization': "Bearer "+Token},
        body: body);
    fetchPost();
  }
//
//
//
  Widget build(BuildContext context){
    Color buttoncolor = const Color(0xFF4fa2e1);
    Color colorappbar = const Color(0xFF2ac3fe);
    MediaQueryData queryData = MediaQuery.of(context);

    double screenWidth = queryData.size.width;
    double screenHeight = queryData.size.height*0.4;
//    print('mylength'+listposition.data.length.toString());
    return new Scaffold(
        appBar: new AppBar(backgroundColor:Colors.lightBlue[300],
            title: new Text('โปรเจค',style: TextStyle(color: Colors.brown[500]),),

        ),
        drawer: Drawer(
          child: Column(
            children: <Widget>[
              Container(width: screenWidth,height: screenHeight*0.6,
                color: colorappbar,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[Padding(padding: EdgeInsets.only(top: 20,)),
                    CircleAvatar(child: Icon(Icons.image),radius: 30,backgroundColor: Colors.grey,),
                    Padding(padding: EdgeInsets.only(top: 20,left: 50)),
                    Text('admin',style: TextStyle(fontSize: 20),)
                    ],
                  ),
                ),padding: EdgeInsets.only(right: 200,top: 10),
              ),
              //FlatButton(onPressed: (){Navigator.of(context).pushNamed('/member');}, child: new Text('asagasf') ),
              ListTile(
                leading: Icon(Icons.dashboard,color: Colors.black),
                title: Text('Dashboard'),
                onTap: (){Navigator.of(context).pushNamed('/Home');},
              ),
              ListTile(
                leading: Icon(Icons.assignment,color: Colors.black),
                title: Text('โปรเจค'),
                onTap:(){Navigator.of(context).pushNamed('/project');},
              ),
              ListTile(
                leading: Icon(Icons.people,color: Colors.black),
                title: Text('พนักงาน'),
                onTap: (){Navigator.of(context).pushNamed('/employee');},
              ),
              ListTile(
                leading: Icon(Icons.account_balance,color: Colors.black),
                title: Text('สาขา'),
                onTap:(){Navigator.of(context).pushNamed('/branch');},
              ),
              ListTile(
                leading: Icon(Icons.work,color: Colors.black),
                title: Text('ตำแหน่ง'),
                onTap:(){Navigator.of(context).pushNamed('/position');},
              ),
            ],
          ),
        ),

        body: Container
          (width: screenWidth,height: screenHeight*2.1,margin: EdgeInsets.all(5),color: Colors.white,
          child:  isTrue != 0 ?
          ListView.builder(
            itemCount: listProject.data.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                  child: DetailProject(
                    id:listProject.data[index].id,
                    projectname: listProject.data[index].projectName,
                    projectcostomerName: listProject.data[index].projectCostomerName,
                    startdate: listProject.data[index].projectStartDate,
                    projectTeamName: listProject.data[index].projectTeamName,
                    del: deleteproject,
                  ),
              );
            },
          ):Text('Waiting')

          ,padding: EdgeInsets.only(left: 10),),
        floatingActionButton: FloatingActionButton(
          backgroundColor: buttoncolor,
          onPressed: (){Navigator.of(context).pushNamed('/addproject');},
          child: Icon(Icons.add),)
    );
  }

}

class DetailProject extends StatelessWidget {
  //
  Future _showAlert(BuildContext context, String message) async {
    return showDialog(
        context: context,
        child: new AlertDialog(
          title: new Text(message),
          actions: <Widget>[
            new FlatButton(onPressed: () {del(id.toString());Navigator.pop(context);print(id.toString());}, child: new Text('ยืนยัน')
            ),
            new FlatButton(onPressed: () => Navigator.pop(context), child: new Text('ยกเลิก'))
          ],
        )

    );
  }
  //Function del;
  int id;
  String projectname;
  String projectcostomerName;
  var startdate;
  var enddate;
  String projectTeamName;
  double projectcost;
  String projectnote;
  Function del;

  DetailProject({
    this.id,
    this.projectname,
    this.projectcostomerName,
    this.startdate,
    this.enddate,
    this.projectTeamName,
    this.projectcost,
    this.projectnote,
    this.del
    //this.del
  }
    );
  @override
  Widget build(BuildContext context) {
    return  Container(child: Column(children: <Widget>[
    Slidable(
    delegate: new SlidableDrawerDelegate(),
      actionExtentRatio: 0.23,
      child: new Container(
        color: Colors.white,
        child: new ListTile(
          title: new Text(projectname),
          subtitle: Column(children: <Widget>[
            Row(children: <Widget>[Text('ลูกค้า : '),Text(projectcostomerName)],),
            Row(children: <Widget>[Text('ทีมรับผิดชอบ : '),Text(projectTeamName)],)
          ],),
          onTap: () {
            Navigator.push(context,
              MaterialPageRoute(
                  builder: (context) => showproject(project_id:id )
              ),
            );
          },),
      ),
      secondaryActions: <Widget>[
        new IconSlideAction(
            caption: 'Edit',
            color: Colors.black45,
            icon: Icons.edit,
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => editproject(projectid: id,),
                ),
              );
            }
        ),
        new IconSlideAction(
            caption: 'Delete',
            color: Colors.red,
            icon: Icons.delete,
            onTap: () => _showAlert(context, 'ต้องการลบ ${projectname} หรือไม่!')
        ),
     ],
    ),
    Divider() ],),);
}
}
/*
ListTile(
      title: Text(projectname),
      subtitle: Column(
        children: <Widget>[
          Text('ลูกค้า'+projectcostomerName),
          Text('ทีมรับผิดชอบ'+projectTeamName)
        ],
      ),
      trailing: Stack(children: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            IconButton(icon: Icon(Icons.edit), onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => editproject(projectid: id,),
                ),
              );
            }
            ),
            IconButton(icon: Icon(Icons.delete), onPressed: () => _showAlert(context, 'ต้องการลบ ${projectname} หรือไม่!')
              // del(id.toString());

            ),
          ],
        ),
      ],
      ),
      onTap: () {
        Navigator.push(context,
          MaterialPageRoute(
              builder: (context) => showproject(project_id:id )
          ),
        );
      },
    );
 */