import 'package:flutter/material.dart';
import './addmember.dart';

class addfixcost extends StatefulWidget {
  @override
  _addfixcostState createState() => new _addfixcostState();
}

class _addfixcostState extends State<addfixcost> {
  Widget build(BuildContext context) {
    Color colorappbar = const Color(0xFF2ac3fe);
    MediaQueryData queryData = MediaQuery.of(context);

    double screenWidth = queryData.size.width;
    double screenHeight = queryData.size.height;
    return new Scaffold(
      appBar: new AppBar(backgroundColor: colorappbar,
        title: new Text('เพิ่มค่าใช้จ่ายทั่วไป',style: TextStyle(color: Colors.brown[500]),),
      ),

      body: new Container(height: screenHeight,width: screenWidth,margin: EdgeInsets.all(5),
        child: new Center(child: new Column(
          children: <Widget>[
            ListTile(
              leading: Text('รายการ   '),
            title:            TextField(
              decoration: InputDecoration.collapsed(
                hintText: ('ป้อนรายการค่าใช้จ่าย'),
              ),
            ),
            ),
            Divider(color: Colors.grey,),
            ListTile(
              leading: Text('มูลค่า      '),
              title:            TextField(
                decoration: InputDecoration.collapsed(
                  hintText: ('ระบุมูลค่า'),
                ),
              ),
            ),
            Divider(color: Colors.grey,),
            ListTile(
              leading: Text('หมายเหตุ '),
              title:            TextField(
                decoration: InputDecoration.collapsed(
                  hintText: ('ระบุหมายเหตุ'),
                ),
              ),
            ),
            Divider(color: Colors.grey,),
          ],
        ),
        ),
      ),floatingActionButton: RaisedButton(
      padding: EdgeInsets.fromLTRB(160,0 /*top*/, 150/*right*/, 0/*bottom*/),
      onPressed: save,child: Text('บันทึก'),color:(Colors.green),textColor: (Colors.white),),
    );
  }
}