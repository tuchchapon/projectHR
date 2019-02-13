import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import '../model/Position.dart';
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

class addposition extends StatefulWidget {
  @override
  _addpositionState createState() => new _addpositionState();
}

/*
void save(){
 if (_position != '' ){
   print(_position);
 }
}
*/

class _addpositionState extends State<addposition> {
 String position;
 //final myController = TextEditingController();
/*
  void addPosition(String name,) {
   _position ;
    http.post('http://localhost:1337/position/create',
        body: json.encode(_position)).then((http.Response response) {
      final Position newPosition = Position(
          positionName: name);
      _position;
    }
    );
  }
*/
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
         RaisedButton(onPressed: (){
           Position(position);
           print(position);
         },child: Text('บันทึก',style: TextStyle(color: Colors.white),),color: Colors.green,)
          ]
        ),
        ),
      ),

    );
  }
  Future<dynamic> Position(position) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String Token = prefs.getString("prefsToken");
    //  print(user);
    // print(pass);
    print(position);
    // print(password);
    var url = 'http://35.198.219.154:1337/position/create';
    var body = {
      'position_name': position,
    };
    print(body);
    http.Response response = await http.post(
        url,
 headers: {'authorization': "Bearer"+Token},
          body: body);
    Navigator.of(context).pushReplacementNamed('/position');
    final Map<String, dynamic> responseData = await json.decode(
        response.body);
    print(responseData);
    return responseData['code'];

  }
}
//

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
