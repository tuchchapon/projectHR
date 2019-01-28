import 'package:flutter/material.dart';
import './addmember.dart';

class addbenefit extends StatefulWidget {
  @override
  _addbenefitState createState() => new _addbenefitState();
}

class _addbenefitState extends State<addbenefit> {
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('เพิ่มข้อมูล'),
      ),

      body: new Container(
        child: new Center(child: new Column(
          children: <Widget>[
          ListTile(leading: Text('รายการ   '),
            title:
            TextField(
              decoration: InputDecoration.collapsed(
                hintText: ' ป้อนรายการสิทธิประโยชน์',
              ),
            ),
          ),
          Divider(color: Colors.grey,),
          ListTile(leading: Text('มูลค่า      '),
            title: TextField(
              decoration: InputDecoration.collapsed(
                hintText: ' ป้อนมูลค่า',
              ),
            ),
          ),
          Divider(color: Colors.grey,),
          ListTile(leading: Text('หมายเหตุ '),
            title:
            TextField(
              decoration: InputDecoration.collapsed(
                hintText: 'ระบุหมายเหตุ',
              ),
            ),
          ),
          Divider(color: Colors.grey,),
          ],
        ),
        ),
      ),floatingActionButton: RaisedButton(
      padding: EdgeInsets.fromLTRB(150,0 /*top*/, 150/*right*/, 0/*bottom*/),
      onPressed: save,child: Text('บันทึก'),color:(Colors.green),textColor: (Colors.white),),
    );
  }
}