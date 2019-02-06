import 'package:flutter/material.dart';
import 'listposition.dart';




class addposition extends StatefulWidget {
  @override
  _addpositionState createState() => new _addpositionState();
}


void save(){
 if (_position != '' ){
   print(_position);
 }
}
String _position = '';

class _addpositionState extends State<addposition> {
  Widget build(BuildContext context) {
    MediaQueryData queryData = MediaQuery.of(context);

    double screenWidth = queryData.size.width;
    double screenHeight = queryData.size.height;
    Color colorappbar = const Color(0xFF2ac3fe);
    return new Scaffold(
      appBar: new AppBar(backgroundColor: colorappbar,
        title: new Text('เพิ่มข้อมูล'),

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
          title: TextFormField(decoration: InputDecoration.collapsed(
              hintText: 'ป้อนตำแหน่ง'),autofocus: true,
              validator: validateName,autovalidate: true,

          ),
        ),
        Divider(color: Colors.grey,),
         RaisedButton(onPressed: save,child: Text('บันทึก'),color: Colors.green,)
          ]
        ),
        ),
      ),
    );
  }
}

String validateName(String value) {
  Pattern pattern =
    '[a-zA-Zก-ฮ]';
  RegExp regex = new RegExp(pattern);
  if (value.length < 3) {
    return 'ชื่อตำแหน่งต้องมีพยัญชนะมากกว่า 2 ตัว';
  } else if (!regex.hasMatch(value)) {
    return 'รูปแบบไม่ถูกต้อง';
  }
  else
    return null;
}
