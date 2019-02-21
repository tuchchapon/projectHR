import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import '../model/Position.dart';
import 'position.dart';
import 'package:shared_preferences/shared_preferences.dart';



//
class editproject extends StatefulWidget {
  @override
  _editprojectState createState() => new _editprojectState();
  int id;
  String projectname;
  String costomername;
  editproject({this.id,this.projectname,this.costomername});



}

class _editprojectState extends State<editproject> {
  @override
  void initState() {
    super.initState();
    print('++++++++++++++++');
    branchAddcon.text = widget.costomername;
    idcon.text = widget.id.toString();
    branchnamecon.text = widget.projectname;
  }


  String positionName;
  final branchnamecon = TextEditingController();
  final branchAddcon = TextEditingController();
  final idcon = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text('แก้ไขข้อมูล'),
      ),
      body: new Container(
        margin: EdgeInsets.all(10),
        child: new Center(
          child: new ListView(
              children: <Widget>[
                ListTile(
                  leading: Text('ตำแหน่ง'),
                  title: TextField(
                    //     controller: myController,
                    decoration: InputDecoration.collapsed(

                        hintText: branchnamecon.text),
                    onChanged: (String value) {
                      //  myController.text = value;
                      // print('ID = ${}');
                    },
                    controller: branchnamecon,
                  ),
                ),
                Divider() ,
                ListTile(
                  leading: Text('ที่อยู่'),
                  title: TextField(
                    //     controller: myController,
                    decoration: InputDecoration.collapsed(

                        hintText: branchAddcon.text),
                    onChanged: (String value) {
                      //  myController.text = value;
                      // print('ID = ${}');
                    },
                    controller: branchAddcon,
                  ),
                ),
                //  Text(_position),
                //   new Text(_position),
                Divider(color: Colors.grey,),
                RaisedButton(onPressed: (){
                  Updatebranch(idcon.text, branchnamecon.text,branchAddcon.text);
                  print(idcon);
                  print(branchnamecon);
                  Navigator.of(context).pushReplacementNamed('/branch');
                },child: Text('บันทึก',style: TextStyle(color: Colors.white),),color: Colors.green,)
              ]
          ),
        ),
      ),
    );
  }
}

//

Future<dynamic> Updatebranch(id,branchname,branchAdd) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String Token = prefs.getString("prefsToken");
  var url = 'http://35.198.219.154:1337/branch/update';
  var body = {
    'id': id,
    'branch_name': branchname,
    'branch_address': branchAdd,

  };
  print(body);
  http.Response response = await http.post(
      url,
      headers: {'authorization': "Bearer "+Token},
      body: body);
  final Map<String, dynamic> responseData = await json.decode(
      response.body);
  print(responseData);
  return responseData['code'];

}
//
/*

 */
//
String validateName(String value) {
  Pattern pattern =
      '[a-zA-Zก-ฮ1-9]';
  RegExp regex = new RegExp(pattern);
  if (value.length < 1) {
    return 'กรุณาป้อนตำแหน่ง';
  } else if (!regex.hasMatch(value)) {
    return 'รูปแบบไม่ถูกต้อง';
  }
  else
    return null;
}
/*
int id;
String positionName;
Positiondetail({this.id,this.positionName,});


Color colorappbar = const Color(0xFF2ac3fe);
//  final  Position position;
String position;
@override
Widget build(BuildContext context) {
  MediaQueryData queryData = MediaQuery.of(context);

  double screenWidth = queryData.size.width;
  double screenHeight = queryData.size.height;

  return new Container(
    height: screenHeight,
    width: screenWidth,
    margin: EdgeInsets.all(10),
    child: new Center(
      child: new ListView(
          children: <Widget>[
            ListTile(
              leading: Text('ตำแหน่ง'),
              title: TextField(
                //     controller: myController,
                decoration: InputDecoration.collapsed(
                    hintText: 'ป้อนตำแหน่ง'),
                onChanged: (String value) {
                  position = value;
                  print(position);
                },
              ),
            ),
            //  Text(_position),
            //   new Text(_position),
            Divider(color: Colors.grey,),
            RaisedButton(onPressed: () {
              Updateposition(id, position);
              print(position);
            },
              child: Text('บันทึก', style: TextStyle(color: Colors.white),),
              color: Colors.green,)
          ]
      ),
    ),
  );
}
*/