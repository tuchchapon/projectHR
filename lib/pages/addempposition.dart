import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import 'package:shared_preferences/shared_preferences.dart';
import 'package:project/model/positionemp.dart';




class addempposition extends StatefulWidget {
  @override
  _addemppositionState createState() => new _addemppositionState();
  int empid;
  addempposition({this.empid});

}

class _addemppositionState extends State<addempposition> {

  @override
  void initState() {
    super.initState();
    getempdata();
  }
  Future _askUser() async {

    await showDialog(
        context: context,
        child: new SimpleDialog(
          title: new Text('เลือกสาขา'),
          children: <Widget>[
            Container(
                child: Column( children: isTrue == 0 ? [
                  Text('Waiting Data'),
                ] : choiceposition()
                )
            ),

          ],
        )
    );
  }
  int idposiiton;
  Position listposition = new Position();
  int choiceloop = 0;
  int isTrue = 0;
  String position;
  String _position = 'เลือกตำแหน่ง';
  Widget build(BuildContext context) {
    MediaQueryData queryData = MediaQuery.of(context);

    double screenWidth = queryData.size.width;
    double screenHeight = queryData.size.height;
    Color colorappbar = const Color(0xFF2ac3fe);
    return new Scaffold(
      appBar: new AppBar(backgroundColor: colorappbar,
        title: new Text('เพิ่มข้อมูล',style: TextStyle(color: Colors.brown[500]),),

      ),

      body: new Container(
        height: screenHeight,
        width: screenWidth,
        margin: EdgeInsets.all(10),
        child: new Center(
          child: new ListView(
              children: <Widget>[
                ListTile(
                  leading: new Text('ตำแหน่ง      ',style: TextStyle(fontSize: 16),),
                  title: Text('${_position}',style: TextStyle(fontSize: 14),),
                  trailing: new IconButton(icon: new Icon(Icons.list), onPressed: _askUser),
                ),
                //  Text(_position),
                //   new Text(_position),
                Divider(color: Colors.grey,),
                RaisedButton(onPressed: (){
                  print('emp id'+widget.empid.toString());
                  print('po id'+idposiiton.toString());
                  Addposition(widget.empid.toString(), idposiiton.toString());

                },child: Text('บันทึก',style: TextStyle(color: Colors.white),),color: Colors.green,)
              ]
          ),
        ),
      ),

    );
  }


  Future<void> getempdata() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("prefsToken");
    final response =
    await http.get('http://35.198.219.154:1337/position/datatable',
      headers: {'authorization': "Bearer "+token},);
    //  print(response.body);
    String jsonString = response.body.toString();
    final jsonResponse = json.decode(jsonString);
    // print(jsonResponse["data"]);
    listposition = new Position.fromJson(jsonResponse);

   choiceloop = listposition.data.length;
   print(choiceloop);

    if (response.statusCode == 200) {
      //listBrabch = new Branch.fromJson(jsonResponse);
      setState(() {
        this.isTrue = 1;
      });

      // print(listEmp.data[0].empName);
    } else {

      throw Exception('Failed to load post');
    }
  }

  Future<dynamic> Addposition(empid,position_id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String Token = prefs.getString("prefsToken");
    //  print(user);
    // print(pass);
    // print(password);
    var url = 'http://35.198.219.154:1337/positionemp/create';
    var body = {
      'emp_id': empid,
      'position_id': position_id,
    };
    print(body);
    http.Response response = await http.post(
        url,
        headers: {'authorization': "Bearer "+Token},
        body: body);
    Navigator.of(context).pushReplacementNamed('/employee');
    final Map<String, dynamic> responseData = await json.decode(
        response.body);
    print(responseData);
    return responseData['code'];

  }
  List<Widget> choiceposition(){
    List<Widget> mylist = new List();
    for(int i = 0; i < this.choiceloop ; i++ ){
      mylist.add(Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            new SimpleDialogOption(child: new Text(listposition.data[i].positionName),onPressed: ()
            {Navigator.pop(context);setState(() {_position = listposition.data[i].positionName;idposiiton = listposition.data[i].id;
            });},),
          ]
      )
      );
    }
    return mylist;
  }
}
