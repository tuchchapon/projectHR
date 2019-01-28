import 'package:flutter/material.dart';

class showcost extends StatefulWidget {
  @override
  _showcostState createState() => _showcostState();
}

class _showcostState extends State<showcost> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('ข้อมูลค่าใช้จ่ายเพิ่มเติม'),
      ),
      body: new Container(
        //  padding: new EdgeInsets.all(10.0),
        child: new ListView(
          children: <Widget>[
            ListTile(
              leading: Text('ลำดับ  ',style: TextStyle(fontSize: 18),),
              title: Text('1'),
            ),
            ListTile(
              leading: Text('รายการ ',style: TextStyle(fontSize: 18),),
              title: Text('ค่าซ่อมท่อน้ำ'),
            ),
            ListTile(
              leading: Text('มูลค่า    ',style: TextStyle(fontSize: 18),),
              title: Text('450'),
            ),
            ListTile(
              leading: Text('วันที่      ',style: TextStyle(fontSize: 18),),
              title: Text('23/11/2018'),
              trailing: Icon(Icons.event),
            ),
          ],
        ),
      ),
    );

  }
}
