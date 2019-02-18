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

  Future<dynamic> update(position) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String Token = prefs.getString("prefsToken");
    var url = 'http://35.198.219.154:1337/position/update';
    var body = {
      'position_name': position,
    };
    print(body);
    http.Response response = await http.post(
        url,
        headers: {'authorization': "Bearer "+Token},
        body: body);
    Navigator.of(context).pushReplacementNamed('/project');
    final Map<String, dynamic> responseData = await json.decode(
        response.body);
    print(responseData);
    return responseData['code'];

  }
//
  Future<dynamic> deletePosition(id) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String Token = prefs.getString("prefsToken");
    var url = 'http://35.198.219.154:1337/position/delete';
    var body = {
      'id': id,
    };
    http.Response response = await http.post(url,
        headers: {'authorization': "Bearer "+Token},
        body: body);
    print(response.body);
    fetchPost();
  }
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
                onTap: (){Navigator.of(context).pushNamed('/member');},
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
              ListTile(
                leading: Icon(Icons.card_giftcard,color: Colors.black),
                title: Text('สิทธิประโยชน์'),
                onTap:(){Navigator.of(context).pushNamed('/benefit');},

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
    return ListTile(
      leading: Text(projectname),
      title: Row(mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          IconButton(icon: Icon(Icons.edit), onPressed: null/* (){
            Navigator.push(
              context,
              MaterialPageRoute(
              //  builder: (context) => editproject(id: ,),
              ),
            );
          }*/
          ),
          IconButton(icon: Icon(Icons.delete), onPressed: () => _showAlert(context, 'ต้องการลบ ${projectname} หรือไม่!')
            // del(id.toString());

          ),
        ],
      ),
      onTap: () {
        Navigator.push(context,
          MaterialPageRoute(
              builder: (context) => DetailScreen(
                id: id,
                projectname: projectname,
                projectcostomerName:  projectcostomerName ,
                startdate: startdate,
                projectTeamName:  projectTeamName,
                projectnote: projectnote,
                projectcost: projectcost,)
          ),
        );
      },
    );
  }
}
class DetailScreen extends StatelessWidget {
  int id;
  String projectname;
  String projectcostomerName;
  var startdate;
  String projectTeamName;
  double projectcost;
  String projectnote;
  DetailScreen({
    this.id,
    this.projectname,
    this.projectcostomerName,
    this.startdate,
    this.projectTeamName,
    this.projectcost,
    this.projectnote});

  Color colorappbar = const Color(0xFF2ac3fe);
//  final  Position position;
  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData = MediaQuery.of(context);

    double screenWidth = queryData.size.width;
    double screenHeight = queryData.size.height;

    return Scaffold(
      appBar: AppBar(backgroundColor: colorappbar,
        title: Text('ข้อมูลโปรเจ็ค',style: TextStyle(color: Colors.brown[500]),),
      ),
      body: ListView(children: <Widget>[
        Container(
            margin: EdgeInsets.all(5),height:screenHeight ,width: screenWidth,
            //padding: EdgeInsets.all(10.0),
            child: Column(
              children: <Widget>[
             //  Text('id  '+id.toString(),style: TextStyle(fontSize: 16),),
               ListTile(leading: Text('ชื่อโปรเจ็ค  ',style: TextStyle(fontSize: 12)),title: Text(projectname,style: TextStyle(fontSize: 12)),),
               ListTile(leading: Text('ลูกค้า          ',style: TextStyle(fontSize: 12)),title: Text(projectcostomerName,style: TextStyle(fontSize: 12)),),
               ListTile(leading: Text('วันที่เริ่ม       ',style: TextStyle(fontSize: 12)),title: Text(Moment(startdate).format('dd/MMM/yyyy'),style: TextStyle(fontSize: 12)),),

          // ListTile(leading: Text('งบประมาณ',style: TextStyle(fontSize: 12),),title: Text(projectcost.toString(),style: TextStyle(fontSize: 12),),)

              ],
            )
        ),
        Container(

        )
      ],)
    );
  }
}
/*
Container(
      child:Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          InkWell(
            onTap: (){ print('ok');},
            child: Text(positionName),
          ),
          Row(
            children: <Widget>[
              IconButton(
                onPressed: () {
    Navigator.push(context,
    MaterialPageRoute(
    builder: (context) => Positiondetail(id: id,positionName: positionName,)),);},
                icon: Icon(Icons.edit),
              ),
              IconButton(
                onPressed: (){
                  print(id);
                  del(id.toString());
                },
                icon: Icon(Icons.delete),
              )
            ],
          )
        ],
      ),
    );
 */