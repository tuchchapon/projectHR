import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../model/teammember.dart';
import './addteammember.dart';

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

  @override
  Widget build(BuildContext context) {

    Color buttoncolor = const Color(0xFF4fa2e1);
    Color colorappbar = const Color(0xFF2ac3fe);
    MediaQueryData queryData = MediaQuery.of(context);

    double screenWidth = queryData.size.width;
    double screenHeight = queryData.size.height;
    return new Scaffold(
      appBar: new AppBar(backgroundColor: colorappbar,
        title: new Text('จัดการทีมและ sprint',style: TextStyle(color: Colors.brown[500]),),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search),color: Colors.black, onPressed: null)
        ],
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
      mylist.add(Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              child: Column(
                children: <Widget>[
                  ListTile(
                    onTap: (){Navigator.of(context).pushNamed('/memberstatus');},
                    title: Text(listteam.data[i].empId.empName),
                    subtitle: Column(children: <Widget>[
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