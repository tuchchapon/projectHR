import 'package:flutter/material.dart';

class showbenefit extends StatefulWidget {
  @override
  _showbenefitState createState() => _showbenefitState();
}

class _showbenefitState extends State<showbenefit> {

  @override
  Widget build(BuildContext context) {
    Color colorappbar = const Color(0xFF2ac3fe);
    return new Scaffold(
      appBar: new AppBar(backgroundColor: colorappbar,
        title: new Text('ข้อมูลสิทธิประโยชน์',style: TextStyle(color: Colors.brown[500]),),
      ),
      body: new Container(
        //  padding: new EdgeInsets.all(10.0),
        child: new ListView(
          children: <Widget>[
            ListTile(
              leading: Text('ลำดับ     '),
              title: Text('1'),
            ),
            ListTile(
              leading: Text('รายการ    '),
              title: Text('ฟิตเนส'),
            ),
            ListTile(
              leading: Text('มูลค่า       '),
              title: Text('2200'),
            ),
            ListTile(
              leading: Text('หมายเหตุ '),
              title: Text('2200/เดือน'),
            ),
          ],
        ),
      ),
    );

  }
}
