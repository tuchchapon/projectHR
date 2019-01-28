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
    screenHeight = screenHeight*0.9;
    screenWidth = screenWidth ;

    return new Scaffold(
      appBar: new AppBar(
        title: new Text('เพิ่มข้อมูล'),

      ),

      body: new Container(
        height: screenHeight,
        width: screenWidth,
        child: new Center(child: new Column(
          children: <Widget>[
         ListTile(
          leading: Text('ตำแหน่ง'),
          title: TextField(decoration: InputDecoration.collapsed(
              hintText: 'ป้อนตำแหน่ง'),autofocus: true,),
        ),
Divider(color: Colors.grey,),
         RaisedButton(
           padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
           onPressed: save,child: Text('บันทึก'),color:(Colors.green),textColor: (Colors.white),),
          ]
        ),
        ),
      ),
    );
  }
}