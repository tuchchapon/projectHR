import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'package:project/model/projectmanage.dart';
import 'package:project/model/projectaddit.dart';
import 'package:project/pages/teammanage.dart';
import 'package:project/pages/projectaddit.dart';
import 'package:project/model/mandaycost.dart';

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
    getmanday();
  //  print('id is'+widget.id.toString());

  }
  int projectisTrue =0;
  int additisTrue =0;
  int mandayisTrue = 0;
  int loopmanday = 0;
  int loopaddit=0;
  Project listProject = new Project();
  Projectaddit listaddit = new Projectaddit();
  Mandaycost listmanday = new Mandaycost();

  Future<void> getmanday() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("prefsToken");
    final response =
    await http.get('http://35.198.219.154:1337/manday/project/${widget.project_id}/view',
      headers: {'authorization': "Bearer "+token},);
    // print(response.body);
    String jsonString = response.body.toString();
    final jsonResponse = json.decode(jsonString);
    listmanday = new Mandaycost.fromJson(jsonResponse);
      print(response.body);
    //  print(listfixcost.data[0].fixcostBranchId.id.toString());

    if (response.statusCode == 200) {
      setState(() {
        loopmanday = listmanday.data.length;
        mandayisTrue = 1;
        // this.loopfixcost = listfixcost.data.length;
      });
    } else {
      throw Exception('Failed to load post');
    }
  }
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

    //  print(listfixcost.data[0].fixcostBranchId.id.toString());

    if (response.statusCode == 200) {
      setState(() {
        projectisTrue = 1;
        // this.loopfixcost = listfixcost.data.length;
      });
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

    //  print(listfixcost.data[0].fixcostBranchId.id.toString());

    if (response.statusCode == 200) {
      setState(() {
        additisTrue = 1;
        loopaddit = listaddit.data.length;
        // print(loopaddit);
      });
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
          title: new Text('ข้อมูลโปรเจ็ค',style: TextStyle(color: Colors.white),),
        ),
        body: new ListView(children: <Widget>[
          Padding(padding: EdgeInsets.only(top: 10)),

          Container(decoration: BoxDecoration(border: Border.all(width: 0.1)),
            height: screenHeight*0.65,width: screenWidth,margin: EdgeInsets.all(5),
            //padding: new EdgeInsets.all(10.0),
            child: projectisTrue == 0 ? Container() : Column(children: <Widget>[
              Padding(padding: EdgeInsets.only(top: 10)),
              //  Text('   ข้อมูลโปรเจ็ค',style: TextStyle(fontSize: 16),),
                ListTile(leading: Text('โปรเจ็ค       ',style: TextStyle(fontSize: 12)),
                  title: Text(listProject.data.projectName,style: TextStyle(fontSize: 12),),),
                ListTile(leading: Text('ชื่อลูกค้า      ',style: TextStyle(fontSize: 12)),
                  title: Text(listProject.data.projectCostomerName,style: TextStyle(fontSize: 12)),),
                ListTile(leading: Text('วันที่เริ่ม     '),
                  title: Text(listProject.data.projectStartDateFormat,style: TextStyle(fontSize: 12)),
                  trailing: Icon(Icons.event,color: Colors.black,),),
                ListTile(leading: Text('วันที่สิ้นสุด    ',style: TextStyle(fontSize: 12)),
                  title: Text(listProject.data.projectEndDateFormat,style: TextStyle(fontSize: 12)),trailing: Icon(Icons.event,color: Colors.black,),),
                ListTile(leading: Text('หมายเหตุ',style: TextStyle(fontSize: 12)),
                  title: Text(listProject.data.projectNote,style: TextStyle(fontSize: 12)),),
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
                      child: Text('จัดการทีม >')),),

              ],

            ),

          ),
          Container(decoration: BoxDecoration(border: Border.all(width: 0.1)),
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.only(left: 5,right: 5),width: screenWidth,
              child: Column( children: mandayisTrue == 0 ? [
                CircularProgressIndicator(),
              ] : teammanday()
              )
          ),
          Padding(padding: EdgeInsets.only(top: 10)),
          Container( decoration: BoxDecoration(border: Border.all(width: 0.1)),
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.only(left: 5,right: 5),width: screenWidth,
            child: Column(children: <Widget>[
              ListTile(
                title: Text('ค่าใช้จ่ายเพิ่มเติม',style: TextStyle(fontSize: 12),),
                trailing: FlatButton(onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => projectaddit(projectid: widget.project_id,projectname: listProject.data.projectName,),
                    ),
                  );
                },
                    child: Text('จัดการค่าใช้จ่าย >',style: TextStyle(fontSize: 12),)),),
              Container(


                  child: Column( children: additisTrue == 0 ? [
                    CircularProgressIndicator(),
                  ] : detailadddit()
                  )
              )
            ],),),
          Padding(padding: EdgeInsets.all(5)),
          Container(decoration: BoxDecoration(border: Border.all(width: 0.1)),
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.only(left: 5,right: 5),width: screenWidth,
              child: Row( children: mandayisTrue == 0 ? [
                CircularProgressIndicator(),
              ] : totalcost()
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
              trailing: Text(listaddit.data[i].projectAdditPrice.toString()+' \฿',style: TextStyle(fontSize: 12),))
          ]
      )
      );
    }
    return mylist;
  }
  List<Widget> totalcost(){
    List<Widget> mylist = new List();
    for(int i = 0; i < 1 ; i++ ){
      mylist.add(Column(
          children: <Widget>[
      Text('ค่าใช้จ่ายทั้งหมด',style: TextStyle(fontSize: 16),),
        Row(children: <Widget>[
          Text(listmanday.projectCostTotal.floor().toString(),style: TextStyle(color: Colors.green,fontSize: 16),),Text('  บาท')],)
          ]
      )
      );
    }
    return mylist;
  }
  List<Widget> teammanday(){
    List<Widget> mylist = new List();
    for(int i = 0; i < loopmanday ; i++ ){
    int total =  listmanday.data[i].manday.floor() * listmanday.data[i].workday;
      mylist.add(Column(
          children: <Widget>[

            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: <Widget>[
              Text(listmanday.data[i].empName),
              Text(total.toString()+' บาท')

            ],)
          ]
      )
      );
    }
    return mylist;
  }
}
