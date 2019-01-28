import 'package:flutter/material.dart';

class showvacation extends StatefulWidget {
  @override
  _showvacationState createState() => _showvacationState();
}

class _showvacationState extends State<showvacation> {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('ข้อมูลการลา'),
      ),
      body: new AspectRatio(aspectRatio: 16.0/24.0,
        //  padding: new EdgeInsets.all(10.0),
        child: new ListView(
          children: <Widget>[
            ListTile(
              leading: Text('ลำดับใบลา   '),
              title: Text('1'),
            ),
            ListTile(
              leading: Text('ชื่อ-นามสกุล    '),
              title: Text('นายธัชพลลลลล สุธรรมมา'),
            ),
            ListTile(
              leading: Text('วันที่ยื่นใบลา   '),
              title: Text('01/oct/2019'),
              trailing: Icon(Icons.event),
            ),
            ListTile(
              leading: Text('วันที่เริ่มลา       '),
              title: Text('01/oct/2019'),
              trailing: Icon(Icons.event),
            ),
            ListTile(
              leading: Text('ถึงวันที่            '),
              title: Text('01/oct/2020'),
              trailing: Icon(Icons.event),
            ),
            ListTile(
              leading: Text('ประเภทการลา  '),
              title: Text('ลาป่วย'),
            ),
            ListTile(
              leading: Text('หมายเหตุ         '),
              title: Text('ป่วยยยยยยย'),
            ),
        ],
        ),
      ),
    );
  }
}
