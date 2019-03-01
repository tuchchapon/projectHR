import 'package:flutter/material.dart';
import 'dart:async';
import 'package:moment/moment.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:project/model/projectmanage.dart';

class editproject extends StatefulWidget {
  @override
  _editprojectState createState() => new _editprojectState();

  int projectid;

  editproject({this.projectid});
}
class _editprojectState extends State<editproject> {


  @override
  void initState() {
    super.initState();
    print('++++++++++++++++');
    getprojectdata();


  }
  //
  final projectnamecon = TextEditingController();
  final cus_namecon = TextEditingController();
  final startdatecon = TextEditingController();
  final enddatecon = TextEditingController();
  final teamnamecon = TextEditingController();
  final notecon = TextEditingController();
  final sellingcon = TextEditingController();
  Project listProject = Project();
  int projectisTrue = 0;
  Future<void> getprojectdata() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("prefsToken");
    final response =
    await http.get('http://35.198.219.154:1337/projectmanage/${widget.projectid}/view',
      headers: {'authorization': "Bearer "+token},);
     print(response.body);
    String jsonString = response.body.toString();
    final jsonResponse = json.decode(jsonString);
    listProject = new Project.fromJson(jsonResponse);
    setState(() {
      projectisTrue = 1;
      projectnamecon.text = listProject.data.projectName;
      cus_namecon.text = listProject.data.projectCostomerName;
      startdatecon.text = listProject.data.projectStartDateFormat;
      enddatecon.text = listProject.data.projectEndDateFormat;
      teamnamecon.text = listProject.data.projectTeamName;
      notecon.text = listProject.data.projectNote;
      sellingcon.text = listProject.data.selling.toString();
      print(sellingcon.text);
    });
    //  print(listfixcost.data[0].fixcostBranchId.id.toString());

    if (response.statusCode == 200) {

    } else {
      throw Exception('Failed to load post');
    }
  }
  Future<dynamic> updateproject(projectid,projectname,customer_name,startdate,enddate,teamname,note,selling) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String Token = prefs.getString("prefsToken");
    var url = 'http://35.198.219.154:1337/projectmanage/update';
    var body = {
      'id' :projectid,
      'project_name': projectname,
      'project_costomer_name': customer_name,
      'project_start_date': startdate,
      'project_end_date': enddate,
      'project_team_name' : teamname,
      'project_note': note,
      "selling": selling,
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

  Future _startday() async {
    DateTime picked = await showDatePicker(
        context: context,
        initialDate: new DateTime.now(),
        firstDate: new DateTime(2018),
        lastDate: new DateTime(2020)
    );
    if(picked != null){
      setState(() {
        listProject.data.projectStartDate = picked.millisecondsSinceEpoch;
        print(listProject.data.projectStartDate);
      });

    }
  }

  Future _endday() async {
    DateTime picked = await showDatePicker(
        context: context,
        initialDate: new DateTime.now(),
        firstDate: new DateTime(2018),
        lastDate: new DateTime(2020)
    );
    // picked.millisecondsSinceEpoch;
    if(picked != null){
      setState(() {
        listProject.data.projectEndDate = picked.millisecondsSinceEpoch;

      });
    }
  }

  Widget build(BuildContext context) {
    Color buttoncolor = const Color(0xFF4fa2e1);
    Color colorappbar = const Color(0xFF2ac3fe);
    MediaQueryData queryData = MediaQuery.of(context);

    double screenWidth = queryData.size.width;
    double screenHeight = queryData.size.height;
    return new Scaffold(
      appBar: new AppBar(backgroundColor: colorappbar,
        title: new Text('แก้ไขโปรเจ็ค',style:TextStyle(color: Colors.white),),
      ),

      body: ListView(children: <Widget>[

        Container(
            width: screenWidth,height: screenHeight,margin: EdgeInsets.all(10),
            child: projectisTrue != 0?  Center(
              child: new ListView(
                children: <Widget>[
                  ListTile(
                    leading: Text('ชื่อโปรเจค     '),
                    title: TextField(
                      onChanged: (String projectinput) {
                        projectnamecon.text  = projectinput;
                        print(projectnamecon.text);
                      },
                      controller: projectnamecon,
                      decoration: InputDecoration.collapsed(hintText: 'ป้อนโปรเจค'),
                    ),
                  ),
                  Divider(color: Colors.grey),
                  ListTile(
                    leading: Text('ลูกค้า          '),
                    title: TextField(
                      onChanged: (String cus_input) {
                        cus_namecon.text  = cus_input;
                        print(cus_namecon.text);
                      },
                      controller: cus_namecon,
                      decoration: InputDecoration.collapsed(hintText: 'ป้อนชื่อลูกค้า'),),
                  ),
                  Divider(color: Colors.grey),
                  ListTile(
                    leading: Text('วันเริ่มต้น     '),
                    title: Text(Moment(listProject.data.projectStartDate).format('dd/MMM/yyyy')),
                    trailing: IconButton(icon:Icon(Icons.event), onPressed: _startday),
                  ),
                  Divider(color: Colors.grey),
                  ListTile(
                    leading: Text('วันเสร็จสิ้น    '),
                    title: Text(Moment(listProject.data.projectEndDate).format('dd/MMM/yyyy')),
                    trailing: IconButton(icon:Icon(Icons.event), onPressed: _endday),
                  ),
                  Divider(color: Colors.grey),
                  ListTile(
                    leading: Text('ทีมรับผิดชอบ'),
                    title: TextField(
                      onChanged: (String teaminput) {
                        teamnamecon.text  = teaminput;
                        print(teamnamecon.text);
                      },
                      controller: teamnamecon,
                      decoration: InputDecoration.collapsed(hintText: 'ป้อนทีมรับผิดชอบ'),),
                  ),
                  Divider(color: Colors.grey),
                  ListTile(
                    leading: Text('กำไรที่ต้องการ'
                        ''),
                    title: TextField(
                      onChanged: (String sellingrate) {
                        sellingcon.text  = sellingrate;
                        print(sellingcon.text);
                      },
                      controller: sellingcon,
                      decoration: InputDecoration.collapsed(hintText: 'ป้อนกำไรที่ต้องการ'),),
                  ),
                  Divider(),
                  ListTile(
                    leading: Text('หมายเหตุ      '),
                    title: TextField(
                      onChanged: (String noteinput) {
                        notecon.text  = noteinput;
                        print(notecon.text);
                      },
                      controller: notecon,
                      decoration: InputDecoration.collapsed(hintText: 'ระบุหมายเหตุ'),),
                  ),
                  Divider(color: Colors.grey),
                  RaisedButton(onPressed: (){
                    updateproject(widget.projectid.toString(), projectnamecon.text,
                        cus_namecon.text, listProject.data.projectStartDate.toString(),
                        listProject.data.projectEndDate.toString(),
                        teamnamecon.text, notecon.text,sellingcon.text);
                  },child:Text('บันทึก',style: TextStyle(color: Colors.white),),color: Colors.green,),
                ],
              ),
            )
                : Text ('no data')
        ),
      ],)
    );
  }

}
/*
new Container(
          width: screenWidth,height: screenHeight,margin: EdgeInsets.all(10),
        child: projectisTrue != 0?  Center(
          child: new ListView(
            children: <Widget>[
              ListTile(
                leading: Text('ชื่อโปรเจค     '),
                title: TextField(
                  onChanged: (String projectinput) {
                    projectnamecon.text  = projectinput;
                    print(projectnamecon.text);
                  },
                  controller: projectnamecon,
                  decoration: InputDecoration.collapsed(hintText: 'ป้อนโปรเจค'),
                ),
              ),
              Divider(color: Colors.grey),
              ListTile(
                leading: Text('ลูกค้า          '),
                title: TextField(
                  onChanged: (String cus_input) {
                    cus_namecon.text  = cus_input;
                    print(cus_namecon.text);
                  },
                  controller: cus_namecon,
                  decoration: InputDecoration.collapsed(hintText: 'ป้อนชื่อลูกค้า'),),
              ),
              Divider(color: Colors.grey),
              ListTile(
                leading: Text('วันเริ่มต้น     '),
                title: Text(listProject.data.projectStartDateFormat),
                trailing: IconButton(icon:Icon(Icons.event), onPressed: null),
              ),
              Divider(color: Colors.grey),
              ListTile(
                leading: Text('วันเสร็จสิ้น    '),
                title: Text(Moment(listProject.data.projectEndDateFormat).format('dd/MMM/yyyy')),
                trailing: IconButton(icon:Icon(Icons.event), onPressed: null),
              ),
              Divider(color: Colors.grey),
              ListTile(
                leading: Text('ทีมรับผิดชอบ'),
                title: TextField(
                  onChanged: (String teaminput) {
                    projectnamecon.text  = teaminput;
                    print(projectnamecon.text);
                  },
                  controller: projectnamecon,
                  decoration: InputDecoration.collapsed(hintText: 'ป้อนทีมรับผิดชอบ'),),
              ),
              Divider(color: Colors.grey),
              ListTile(
                leading: Text('หมายเหตุ      '),
                title: TextField(
                  onChanged: (String noteinput) {
                    notecon.text  = noteinput;
                    print(notecon.text);
                  },
                  controller: notecon,
                  decoration: InputDecoration.collapsed(hintText: 'ระบุหมายเหตุ'),),
              ),
              Divider(color: Colors.grey),
              RaisedButton(onPressed: (){
                print(widget.projectid,);
                print(projectnamecon.text);
                print(cus_namecon.text);
             //   print(listProject.data.projectStartDate);
            //    print(listProject.data.projectEndDate);
                print(teamnamecon.text);
                print(notecon.text);
             //   updateproject(widget.projectid.toString(), projectnamecon.text, customer_namecon.text,
             //       widget.startdate.toString(), widget.enddate.toString(), teamnamecon.text, notecon.text);
              },child:Text('บันทึก',style: TextStyle(color: Colors.white),),color: Colors.green,),
            ],
          ),
        )
        : Text ('no data')
      ),
 */