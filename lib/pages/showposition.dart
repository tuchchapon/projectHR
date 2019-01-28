import 'package:flutter/material.dart';

class showposition extends StatefulWidget {
  @override
  _showpositionState createState() => _showpositionState();
}

class _showpositionState extends State<showposition> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('ข้อมูลตำแหน่ง'),
      ),
      body: new Container(
        //  padding: new EdgeInsets.all(10.0),
        child: new ListView(
          children: <Widget>[
            ListTile(
              leading: Text('ลำดับ        '),
              title: Text('1'),
            ),
            ListTile(
              leading: Text('ชื่อตำแหน่ง'),
              title: Text('mobile dev'),
            ),
 ],
        ),
      ),
    );

  }
}
