import 'package:flutter/material.dart';

class showfixcost extends StatefulWidget {
  @override
  _showfixcostState createState() => _showfixcostState();
}

class _showfixcostState extends State<showfixcost> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('ข้อมูลค่าใช้จ่ายที่จำเป็น'),
      ),
      body: new Container(
        //  padding: new EdgeInsets.all(10.0),
        child: new ListView(
          children: <Widget>[
            ListTile(
              leading: Text('รายการ    '),
              title: Text('ค่าเน็ต'),
            ),
            ListTile(
              leading: Text('มูลค่า     '),
              title: Text('500000'),
            ),
            ListTile(
              leading: Text('หมายเหตุ'),
              title: Text('ค่าเน็ต 1000 GB'),
            ),
          ],
        ),
      ),
    );

  }
}
