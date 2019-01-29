import 'package:flutter/material.dart';
import './addmember.dart';

class addbenefit extends StatefulWidget {
  @override
  _addbenefitState createState() => new _addbenefitState();
}

class _addbenefitState extends State<addbenefit> {
  Widget build(BuildContext context) {
    Color colorappbar = const Color(0xFF2ac3fe);
    MediaQueryData queryData = MediaQuery.of(context);

    double screenWidth = queryData.size.width;
    double screenHeight = queryData.size.height;
    return new Scaffold(
      appBar: new AppBar(backgroundColor: colorappbar,
        title: new Text('เพิ่มข้อมูล'),
      ),

      body: new Container(height: screenHeight,width: screenWidth,margin: EdgeInsets.all(10),
        child: new Center(
          child: new ListView(
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
          RaisedButton(onPressed: save,child: Text('บันทึก',style: TextStyle(color: Colors.white),),color: Colors.green,)
          ],
        ),
        ),
      ),
    );
  }
}