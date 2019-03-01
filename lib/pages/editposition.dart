import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'position.dart';
import 'package:shared_preferences/shared_preferences.dart';





/*
Future<http.Response> postRequest () async {
  var url ='http://localhost:1337/position/create';
  var body = {
    'position_name' : position_name
  } ;

  print("Body: " + position_name );

  http.post(url,
      headers: {"Content-Type": "application/json"},
      body: body
  ).then((http.Response response) {
    print("Response status: ${response.statusCode}");
    print("Response body: ${response.contentLength}");
    print(response.headers);
    print(response.request);

  }
  );
  }
*/
class Editpo {

  String positionName;

  Editpo({this.positionName});
}

//
class editposition extends StatefulWidget {
  @override
  _editpositionState createState() => new _editpositionState();
  int id;
  String positionName;
  editposition({this.id,this.positionName,});



}

class _editpositionState extends State<editposition> {
  @override
  void initState() {
    super.initState();
    myController.text = widget.positionName;
    idcon.text = widget.id.toString();
  }
  Color colorappbar = const Color(0xFF2ac3fe);

  String positionName;
  final myController = TextEditingController();
  final idcon = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(backgroundColor: colorappbar,
        title: Text('แก้ไขรายละเอียดตำแหน่ง'),
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

                        hintText: myController.text),
                    onChanged: (String value) {
                    //  myController.text = value;
                     // print('ID = ${}');
                    },
                    controller: myController,
                  ),
                ),
                //  Text(_position),
                //   new Text(_position),
                Divider(color: Colors.grey,),
                RaisedButton(onPressed: (){
                if (myController.text ==''){
                  _showDialog();
                }else{
                  _showDialogsave();
                }

                 },child: Text('บันทึก',style: TextStyle(color: Colors.white),),color: Colors.green,)
              ]
          ),
        ),
      ),
    );
  }
  void _showDialog() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("ผิดพลาด !"),
          content: new Text("กรุณากรอกข้อมูลให้ครบถ้วน"),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("ปิด"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
  void _showDialogsave() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("ต้องการบันทึกข้อมูลหรือไม่"),
          //   content: new Text("รูปแบบข้อมูลผิดพลาด"),
          actions: <Widget>[
            new FlatButton(
              child: new Text("ยืนยัน"),
              onPressed: () {
                Updateposition(idcon.text, myController.text);
                print(idcon);
                print(myController);
              },
            ),
            new FlatButton(
              child: new Text("ยกเลิก"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future<dynamic> Updateposition(id,position) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String Token = prefs.getString("prefsToken");
    var url = 'http://35.198.219.154:1337/position/update';
    var body = {
      'id': id,
      'position_name': position,
    };


    print(body);
    http.Response response = await http.post(
        url,
        headers: {'authorization': "Bearer "+Token},
        body: body);

    final Map<String, dynamic> responseData = await json.decode(
        response.body);
    print(responseData);
    if(response.statusCode == 200){
      Navigator.of(context).pushReplacementNamed('/position');

    }
    return responseData['code'];

  }
}

//


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