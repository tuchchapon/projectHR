import 'package:flutter/material.dart';
import 'dart:async';
import './addmember.dart';

class addproject extends StatefulWidget {
  @override
  _addprojectState createState() => new _addprojectState();
}
String _value = 'ปปปป-ดด-วว';
String _value2 = 'ปปปป-ดด-วว';



class _addprojectState extends State<addproject> {

  Future _startday() async {
    DateTime picked = await showDatePicker(
        context: context,
        initialDate: new DateTime.now(),
        firstDate: new DateTime(2018),
        lastDate: new DateTime(2020)
    );
    if(picked != null) setState(() => _value = picked.toString());

  }

  Future _endday() async {
    DateTime picked = await showDatePicker(
        context: context,
        initialDate: new DateTime.now(),
        firstDate: new DateTime(2018),
        lastDate: new DateTime(2020)
    );
    if(picked != null) setState(() => _value2 = picked.toString());
  }
  
  Widget build(BuildContext context) {
    Color buttoncolor = const Color(0xFF4fa2e1);
    Color colorappbar = const Color(0xFF2ac3fe);
    MediaQueryData queryData = MediaQuery.of(context);

    double screenWidth = queryData.size.width;
    double screenHeight = queryData.size.height;
    return new Scaffold(
      appBar: new AppBar(backgroundColor: colorappbar,
        title: new Text('เพิ่มโปรเจค',style:TextStyle(color: Colors.brown[500]),),
      ),

      body: new Container(width: screenWidth,height: screenHeight,margin: EdgeInsets.all(10),
        child: new Center(
          child: new ListView(
          children: <Widget>[
            ListTile(
                leading: Text('โปรเจค       '),
                title: TextField(decoration: InputDecoration.collapsed(hintText: 'ป้อนโปรเจค'),),
              ),
          Divider(color: Colors.grey),
            ListTile(
              leading: Text('ลูกค้า          '),
              title: TextField(decoration: InputDecoration.collapsed(hintText: 'ป้อนชื่อลูกค้า'),),
            ),
            Divider(color: Colors.grey),
         ListTile(
                leading: Text('วันเริ่มต้น     '),
                title: Text(_value),
                trailing: IconButton(icon:Icon(Icons.event), onPressed: _startday),
              ),
            Divider(color: Colors.grey),
        ListTile(
                leading: Text('วันเสร็จสิ้น    '),
                title: Text(_value2),
                trailing: IconButton(icon:Icon(Icons.event), onPressed: _endday),
              ),
            Divider(color: Colors.grey),
            ListTile(
              leading: Text('ทีมรับผิดชอบ'),
              title: TextField(decoration: InputDecoration.collapsed(hintText: 'ป้อนทีมรับผิดชอบ'),),
            ),
            Divider(color: Colors.grey),
            ListTile(
              leading: Text('หมายเหตุ      '),
              title: TextField(decoration: InputDecoration.collapsed(hintText: 'ระบุหมายเหตุ'),),
            ),
            Divider(color: Colors.grey),
            RaisedButton(onPressed: save,child:Text('บันทึก',style: TextStyle(color: Colors.white),),color: Colors.green,),
          ],
        ),
        ),
      ),
    );
  }
}