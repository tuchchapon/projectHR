import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:moment/moment.dart';
class projectaddit extends StatefulWidget {
  @override
  _projectadditState createState() => _projectadditState();
  int projectid;
  String projectname;
  projectaddit({this.projectid,this.projectname});

}

class _projectadditState extends State<projectaddit> {
  String addit_title;
  String addit_price;
  int loopaddit =0;
  var timestamp = DateTime.now().millisecondsSinceEpoch;
  var timestampa;
  String adddate = 'วว/ดด/ปปปป';


  Widget build(BuildContext context) {
    Color colorappbar = const Color(0xFF2ac3fe);
    MediaQueryData queryData = MediaQuery.of(context);

    double screenWidth = queryData.size.width;
    double screenHeight = queryData.size.height;
    return new Scaffold(
      appBar: new AppBar(backgroundColor: colorappbar,
        title: new Text('ค่าใช้จ่าย',style: TextStyle(color: Colors.brown[500]),),
      ),

      body: new Container(
        width: screenWidth,height: screenHeight,margin: EdgeInsets.all(5),
        child: new Center(
            child: ListView(
    children: <Widget>[

    ],
    ),
      ),
    )
    );
    }
  List<Widget> detailadddit(){
    List<Widget> mylist = new List();
    for(int i = 0; i < this.loopaddit ; i++ ){
      mylist.add(Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[

          ]
      )
      );
    }
    return mylist;
  }
}
