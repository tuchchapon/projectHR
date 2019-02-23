import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
//import 'listposition.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../model/project.dart';
import './editproject.dart';
import 'package:moment/moment.dart';
import './showproject.dart';

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
            actions: <Widget>[
              new IconButton(icon: new Icon(Icons.search), onPressed: null),
              //  new IconButton(icon: new Icon(Icons.home), onPressed: () {Navigator.of(context).pushNamed('/Home');})
            ]
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
            new FlatButton(onPressed: null/*() {del(id.toString());}*/, child: new Text('ยืนยัน')
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

  DetailProject({
    this.id,
    this.projectname,
    this.projectcostomerName,
    this.startdate,
    this.enddate,
    this.projectTeamName,
    this.projectcost,
    this.projectnote,
    //this.del
  }
    );
  @override
  Widget build(BuildContext context) {
    return  ListTile(
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

  }
}
