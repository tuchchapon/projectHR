import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import '../model/projectmanage.dart';
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
    fetchPost();

  }
  int isTrue =0;
  Project listProject = new Project();
  Future<void> fetchPost() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("prefsToken");
    final response =
    await http.get('http://35.198.219.154:1337/projectmanage/${widget.project_id}/view',
        headers: {'authorization': "Bearer "+token});
    String jsonString = response.body.toString();
    final jsonResponse = json.decode(jsonString);
   // print(jsonResponse);

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
        body: new Container(height: screenHeight,width: screenWidth,margin: EdgeInsets.all(5),
          //padding: new EdgeInsets.all(10.0),
          child: new ListView(
            children: <Widget>[],
          ),
        ),
      );
    }
  }
