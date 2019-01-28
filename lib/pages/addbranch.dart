import 'package:flutter/material.dart';
import './addmember.dart';
class addbranch extends StatefulWidget {
  @override
  _addbranchState createState() => new _addbranchState();
}

class _addbranchState extends State<addbranch> {
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('เพิ่มสาขา'),
      ),

      body: new Container(
        child: new Center(child: new Column(
          children: <Widget>[
            Padding(padding: EdgeInsets.all(6)),
          /*  ListTile(
              leading: CircleAvatar(child: Icon(Icons.add_photo_alternate,size: 26.0,),radius: 30,),
            ),
            Divider(color: Colors.grey,),*/
            ListTile(
              leading: Text('ชื่อสาขา'),
                    title:TextField(
                      decoration: InputDecoration.collapsed(hintText: 'ป้อนชื่อสาขา'),

                    )
                ),
            Divider(color: Colors.grey,),
            ListTile(
                leading: Text('ที่อยู่      '),
                title:TextField(
                  decoration: InputDecoration.collapsed(hintText: 'ป้อนที่อยู่'),

                )
            ),
            Divider(color: Colors.grey,),
            RaisedButton(
              padding: EdgeInsets.only(left: 25,right: 25),
              onPressed: save,child: Text('บันทึก'),color:(Colors.green),textColor: (Colors.white),),
          ],
        ),
        ),
      ),

    );
  }
}