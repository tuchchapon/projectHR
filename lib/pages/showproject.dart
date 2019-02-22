import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import '../model/projectmanage.dart';
import '../model/projectaddit.dart';
import './teammanage.dart';
class showproject extends StatefulWidget {
  @override
  _showprojectState createState() => _showprojectState();
   int project_id;
   showproject({this.project_id});
}

class _showprojectState extends State<showproject> {
  @override
  void initState() {
    super.initState();
    getprojectdata();
    getprojectaddit();
  //  print('id is'+widget.id.toString());

  }
  int projectisTrue =0;
  int additisTrue =0;
  int loopaddit=0;
  Project listProject = new Project();
  Projectaddit listaddit = new Projectaddit();

  Future<void> getprojectdata() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("prefsToken");
    final response =
    await http.get('http://35.198.219.154:1337/projectmanage/${widget.project_id}/view',
      headers: {'authorization': "Bearer "+token},);
    // print(response.body);
    String jsonString = response.body.toString();
    final jsonResponse = json.decode(jsonString);
    listProject = new Project.fromJson(jsonResponse);
    setState(() {
      projectisTrue = 1;
     // this.loopfixcost = listfixcost.data.length;
    });
    //  print(listfixcost.data[0].fixcostBranchId.id.toString());

    if (response.statusCode == 200) {

    } else {
      throw Exception('Failed to load post');
    }
  }
  Future<void> getprojectaddit() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("prefsToken");
    final response =
    await http.get('http://35.198.219.154:1337/project/projectaddit/${widget.project_id}/view',
      headers: {'authorization': "Bearer "+token},);
   //  print(response.body);
    String jsonString = response.body.toString();
    final jsonResponse = json.decode(jsonString);
    listaddit = new Projectaddit.fromJson(jsonResponse);
    print(listaddit.data[0].projectAdditTitle);
    setState(() {
      additisTrue = 1;
      loopaddit = listaddit.data.length;
     print(loopaddit);
    });
    //  print(listfixcost.data[0].fixcostBranchId.id.toString());

    if (response.statusCode == 200) {

    } else {
      throw Exception('Failed to load post');
    }
  }


  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData = MediaQuery.of(context);

    double screenWidth = queryData.size.width;
    double screenHeight = queryData.size.height;
    Color colorappbar = const Color(0xFF2ac3fe);
      return new Scaffold(
        appBar: new AppBar(backgroundColor: colorappbar,
          title: new Text('ข้อมูลโปรเจ็ค',style: TextStyle(color: Colors.brown[500]),),
        ),
        body: new ListView(children: <Widget>[
          Padding(padding: EdgeInsets.only(top: 10)),
          Text('   ข้อมูลโปรเจ็ค',style: TextStyle(fontSize: 16),),
          Container(
              height: screenHeight*0.62,width: screenWidth,margin: EdgeInsets.all(5),
              //padding: new EdgeInsets.all(10.0),
              child: projectisTrue == 0 ? Text('ไม่มีข้อมูล') : Column(
                children: <Widget>[
                  ListTile(leading: Text('โปรเจ็ค       ',style: TextStyle(fontSize: 12)),
                    title: Text(listProject.data.projectName,style: TextStyle(fontSize: 12),),),
                  ListTile(leading: Text('ชื่อลูกค้า      ',style: TextStyle(fontSize: 12)),
                    title: Text(listProject.data.projectCostomerName,style: TextStyle(fontSize: 12)),),
                  ListTile(leading: Text('วันที่เริ่ม     '),
                    title: Text(listProject.data.projectStartDateFormat,style: TextStyle(fontSize: 12)),
                    trailing: Icon(Icons.event),),
                  ListTile(leading: Text('วันที่สิ้นสุด    ',style: TextStyle(fontSize: 12)),
                    title: Text(listProject.data.projectEndDateFormat,style: TextStyle(fontSize: 12)),trailing: Icon(Icons.event),),
                  ListTile(leading: Text('ทีมรับผิดชอบ',style: TextStyle(fontSize: 12)),
                    title: Text(listProject.data.projectTeamName,style: TextStyle(fontSize: 12)),
                    trailing: FlatButton(onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => teammanage(project_id: widget.project_id,team_id: widget.project_id,team_name: listProject.data.projectTeamName,),
                        ),
                      );
                    },
                      child: Text('จัดการทีม >'),color: Colors.blue,),),
                  ListTile(leading: Text('หมายเหตุ',style: TextStyle(fontSize: 12)),
                    title: Text(listProject.data.projectNote,style: TextStyle(fontSize: 12)),),
                  Divider()
                ],
              )
          ),
          ListTile(title: Text('ค่าใช้จ่ายเพิ่มเติม'),trailing: FlatButton(onPressed: null,
              child: Text('จัดการค่าใช้จ่าย >')),),
          Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.only(left: 5,right: 5),width: screenWidth,
              child: Column( children: additisTrue == 0 ? [
                Text('ไม่มีข้อมูลค่าใช้จ่าย'),
              ] : detailadddit()
              )
          ),
       Divider()
        ],)
      );
    }
  List<Widget> detailadddit(){
    List<Widget> mylist = new List();
    for(int i = 0; i < this.loopaddit ; i++ ){
      mylist.add(Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
           ListTile(title: Text(listaddit.data[i].projectAdditTitle,style: TextStyle(fontSize: 12),),
              subtitle: Text(listaddit.data[i].projectAdditDateFormat,style: TextStyle(fontSize: 12)),
              trailing: Text(listaddit.data[i].projectAdditPrice.toString()+' \$',style: TextStyle(fontSize: 12),))
          ]
      )
      );
    }
    return mylist;
  }
  }
