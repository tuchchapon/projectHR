import 'package:flutter/material.dart';
import './addmember.dart';
class addposition extends StatefulWidget {
  @override
  _addpositionState createState() => new _addpositionState();
}

void click () {

}

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
          title: TextField(decoration: InputDecoration.collapsed(
              hintText: 'ป้อนตำแหน่ง'),autofocus: true,),
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