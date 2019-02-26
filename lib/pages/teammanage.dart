import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:project/model/teammember.dart';
import 'package:project/pages/addteammember.dart';
import 'package:project/pages/updatesprint.dart';
import 'dart:async';

class teammanage extends StatefulWidget {
  @override
  _teammanageState createState() => _teammanageState();
  int team_id;
  int project_id;
  String team_name;
  teammanage({this.team_id,this.project_id,this.team_name});
}

class _teammanageState extends State<teammanage> {
 int loopmember =0;
 int teamistrue =0;

 Teammember listteam = new Teammember();
 @override
 void initState() {
   super.initState();
   getteam();

 }
 Future<void> getteam() async {
   SharedPreferences prefs = await SharedPreferences.getInstance();
   String token = prefs.getString("prefsToken");
   final response =
   await http.get('http://35.198.219.154:1337/project/team/${widget.team_id}/view',
     headers: {'authorization': "Bearer "+token},);
     print(response.body);
   String jsonString = response.body.toString();
   final jsonResponse = json.decode(jsonString);
   listteam = new Teammember.fromJson(jsonResponse);
   print(listteam.data[0].empStartDate);
   setState(() {
     teamistrue = 1;
     loopmember = listteam.data.length;
     print(loopmember);
   });
   //  print(listfixcost.data[0].fixcostBranchId.id.toString());

   if (response.statusCode == 200) {

   } else {
     throw Exception('Failed to load post');
   }
 }
 Future<dynamic> deletemember(team_id) async{
   SharedPreferences prefs = await SharedPreferences.getInstance();
   String Token = prefs.getString("prefsToken");
   var url = 'http://35.198.219.154:1337/team/delete';
   var body = {
     'id': team_id,
   //  'EmpId': emp_id,
   };

   print(team_id.toString());
   http.Response response = await http.post(url,
       headers: {'authorization': "Bearer "+Token},
       body: body);
   //  print(response.body);
   print(response.body);
   getteam();
 }

  @override
  Widget build(BuildContext context) {

    Color buttoncolor = const Color(0xFF4fa2e1);
    Color colorappbar = const Color(0xFF2ac3fe);
    MediaQueryData queryData = MediaQuery.of(context);

    double screenWidth = queryData.size.width;
    double screenHeight = queryData.size.height;
    return new Scaffold(
      appBar: new AppBar(backgroundColor: colorappbar,
        title: new Text('จัดการทีมและ sprint',style: TextStyle(color: Colors.white),),

      ),
      body:  ListView(
        children: <Widget>[
          ListTile(
            leading: Text('ชื่อทีม:',style: TextStyle(fontSize: 16),),
            title: Text(widget.team_name,style: TextStyle(color: Colors.blue),),
          ),
        Container( child: Column( children: teamistrue == 0 ? [
          Text('ไม่มีสมาชิกทีม'),
        ] : detailteam()
        ),)
        ],
      ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: buttoncolor,
          onPressed: (){
            Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => addteammember(project_id: widget.project_id,),
            ),
          );},
          child: Icon(Icons.add,size: 30,),)
    );
  }
  List<Widget> detailteam(){


    List<Widget> mylist = new List();
    for(int i = 0; i < this.loopmember ; i++ ){
      Future _showAlert(BuildContext context, String message) async {
        return showDialog(
            context: context,
            child: new AlertDialog(
              title: new Text(message),
              actions: <Widget>[
                new FlatButton(onPressed: () {deletemember(listteam.data[i].id.toString());Navigator.pop(context);
                Scaffold.of(context).showSnackBar(SnackBar(
                  content: Text('ลบข้อมูลสำเร็จ'),
                  duration: Duration(seconds: 3),
                ));
                }, child: new Text('ยืนยัน')
                ),
                new FlatButton(onPressed: () => Navigator.pop(context), child: new Text('ยกเลิก'))
              ],
            )

        );
      }
      mylist.add(Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              child: Column(
                children: <Widget>[
                  Slidable(
                    delegate: new SlidableDrawerDelegate(),
                    actionExtentRatio: 0.23,
                    child: new Container(
                      child: new ListTile(
                        title: new Text(listteam.data[i].empId.empName),
                        subtitle: Column(children: <Widget>[
                          Row(children: <Widget>[
                            Text('ตำแหน่ง  ',style: TextStyle(color: Colors.black),),
                            Text(listteam.data[i].positionId.positionName,style: TextStyle(color: Colors.green),),
                          ],),
                          Row(children: <Widget>[
                            Text('วันที่เริ่มต้น  ',style: TextStyle(color: Colors.black),),
                            Text(listteam.data[i].empStartDateFormat,style: TextStyle(color: Colors.blue),),
                          ],),
                          Row(children: <Widget>[
                            Text('วันที่สิ้นสุด:  ',style: TextStyle(color: Colors.black),),
                            Text(listteam.data[i].empEndDateFormat,style: TextStyle(color: Colors.blue),),
                          ],)

                        ],),
                      ),
                    ),
                    secondaryActions: <Widget>[
                      new IconSlideAction(
                        caption: 'แก้ไขข้อมูล',
                        color: Colors.black45,
                        icon: Icons.edit,
                           onTap: () {
                             Navigator.push(
                               context,
                               MaterialPageRoute(
                                 builder: (context) => updatesprint(teamid: listteam.data[i].id,
                                     empid: listteam.data[i].empId.id,
                                     startdate: listteam.data[i],
                                     enddate: listteam.data[i].empEndDate),
                               ),
                             );}
                      ),
                      new IconSlideAction(
                        caption: 'ลบข้อมูล',
                        color: Colors.red,
                        icon: Icons.delete,
                           onTap: ()=> _showAlert(context, 'ต้องการลบ ${listteam.data[i].empId.empName} หรือไม่!') /*{

                             deletemember(listteam.data[i].id.toString());

                             print(widget.team_id);
                             print(widget.project_id);

                             //  print(listteam.data[i].empId);
                           }*/
                      ),
                    ],
                  ),
                  Divider()
                ],
              ),
            )


          ]
      )
      );
    }
    return mylist;
  }
}
/*
                  ListTile(
                    title: Text(listteam.data[i].empId.empName),
                    subtitle: Column(children: <Widget>[
                      Row(children: <Widget>[
                        Text('ตำแหน่ง  ',style: TextStyle(color: Colors.black),),
                        Text(listteam.data[i].positionId.positionName,style: TextStyle(color: Colors.green),),
                      ],),
                      Row(children: <Widget>[
                        Text('วันที่เริ่มต้น  ',style: TextStyle(color: Colors.black),),
                         Text(listteam.data[i].empStartDateFormat,style: TextStyle(color: Colors.blue),),
                      ],),
                      Row(children: <Widget>[
                        Text('วันที่สิ้นสุด:  ',style: TextStyle(color: Colors.black),),
                        Text(listteam.data[i].empEndDateFormat,style: TextStyle(color: Colors.blue),),
                      ],)

                    ],),
                 trailing:  Column(children: <Widget>[
                   IconButton(icon: Icon(Icons.edit,color: Colors.blue,), onPressed: (){
                     Navigator.push(
                       context,
                       MaterialPageRoute(
                         builder: (context) => updatesprint(teamid: listteam.data[i].id,
                             empid: listteam.data[i].empId.id,
                             startdate: listteam.data[i],
                             enddate: listteam.data[i].empEndDate),
                       ),
                     );}
                   ),
                   IconButton(icon: Icon(Icons.delete,color: Colors.blue,),
                       ///ลบสมาชิกทีม

                       onPressed: (){
                     deletemember(listteam.data[i].id.toString());
                     print(widget.team_id);
                     print(widget.project_id);

                   //  print(listteam.data[i].empId);
                   }
                   ),

                 ]
                ,)),
 */