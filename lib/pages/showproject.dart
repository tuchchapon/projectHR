import 'package:flutter/material.dart';

class showproject extends StatefulWidget {
  @override
  _showprojectState createState() => _showprojectState();
}

class _showprojectState extends State<showproject> {
  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData = MediaQuery.of(context);

    double screenWidth = queryData.size.width;
    double screenHeight = queryData.size.height;
    Color colorappbar = const Color(0xFF2ac3fe);
      return new Scaffold(
        appBar: new AppBar(backgroundColor: colorappbar,
          title: new Text('ข้อมูลโปรเจค'),
        ),
        body: new Container(height: screenHeight,width: screenWidth,margin: EdgeInsets.all(5),
          //padding: new EdgeInsets.all(10.0),
          child: new ListView(
            children: <Widget>[
              ListTile(
                leading: Text('ลำดับที่       ',style: TextStyle(fontSize: 16),),
                title: Text('1',style: TextStyle(fontSize: 14)),
              ),
              ListTile(
                leading: Text('ชื่อโปรเจค   ',style: TextStyle(fontSize: 16),),
                title: Text('ระบบ HR',style: TextStyle(fontSize: 14)),
              ),
              ListTile(
                leading: Text('ลูกค้า   ',style: TextStyle(fontSize: 16),),
                title: Text('Twin Synergy',style: TextStyle(fontSize: 14)),
              ),
              ListTile(
                leading: Text('วันที่เริ่ม       ',style: TextStyle(fontSize: 16),),
                title: Text('01/oct/2019',style: TextStyle(fontSize: 14)),
                trailing: Icon(Icons.event),
              ),
              ListTile(
                leading: Text('วันที่สินสุด    ',style: TextStyle(fontSize: 16),),
                title: Text('01/oct/2019',style: TextStyle(fontSize: 14)),
                trailing: Icon(Icons.event),
              ),
              ListTile(
                leading: Text('ทีมรับผิดชอบ',style: TextStyle(fontSize: 16),),
                title: Text('Team A',style: TextStyle(fontSize: 14)),
                trailing: FlatButton(onPressed: (){Navigator.of(context).pushNamed('/teammanage');}, child: Text('จัดการทีม >')),
              ),
              ListTile(
                leading: Text('หมายเหตุ      ',style: TextStyle(fontSize: 16),),
                title: Text('ระบบ HR aaaaaaaaaaaaaaaaaaaaaaaaaaaaaa',style: TextStyle(fontSize: 14),),
              ),
              ListTile(
                leading: Text('รายการค่าใช้จ่ายของโปรเจ็ค'),
                trailing: FlatButton(onPressed: (){Navigator.of(context).pushNamed('/costmanage');}, child: Text('จัดการค่าใช้จ่าย >')),
              ),
              ListTile(
                leading: Column(
                  children: <Widget>[
                    Text('รายการ'),
                    Text('ค่าเซิฟเวอร์'),
                    Text('ค่าหฟกฟหก'),
                    Text('sdajasd'),
                  ],),
                subtitle: Column(
                  children: <Widget>[
                    Text('วันที่'),
                    Text('01/oct/2019'),
                    Text('01/oct/2019'),
                    Text('01/oct/2019'),
                  ],
                ),
                trailing: Column(
                  children: <Widget>[
                    Text('มูลค่า'),
                    Text('5000'),
                    Text('5000'),
                    Text('3000'),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    }
  }
