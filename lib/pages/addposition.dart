import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import '../model/Position.dart';
import 'position.dart';





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
 String _position;
 final myController = TextEditingController();
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
          title: TextFormField(
            controller: myController,
              decoration: InputDecoration.collapsed(
              hintText: 'ป้อนตำแหน่ง'),
            onSaved: (String value) {
              _position = value;
            },



          ),
        ),
     //  Text(_position),
       //   new Text(_position),
        Divider(color: Colors.grey,),
         RaisedButton(onPressed: _submitForm,child: Text('บันทึก',style: TextStyle(color: Colors.white),),color: Colors.green,)
          ]
        ),
        ),
      ),

    );
  }
  Future<http.Response>  _submitForm() async {

    var url ='http://localhost:1337/position/create';
    String data =  myController.text;
    print(data);
     http.post(url, body: myController);

  // Navigator.pushReplacementNamed(context, '/position');
 }
}
//

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
