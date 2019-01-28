import 'package:flutter/material.dart';
import './addmember.dart';
class addbranch extends StatefulWidget {
  @override
  _addbranchState createState() => new _addbranchState();
}

class _addbranchState extends State<addbranch> {
  Widget build(BuildContext context) {
    Color colorappbar = const Color(0xFF2ac3fe);
    MediaQueryData queryData = MediaQuery.of(context);

    double screenWidth = queryData.size.width;
    double screenHeight = queryData.size.height;
    return new Scaffold(
      appBar: new AppBar(backgroundColor: colorappbar,
        title: new Text('เพิ่มสาขา'),
      ),

      body: new Container(height: screenHeight,width: screenWidth,
        margin: EdgeInsets.all(10),
        child: new Center(child: new ListView(
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
              padding: EdgeInsets.only(right: 25),
              onPressed: save,child: Text('บันทึก'),color:(Colors.green),textColor: (Colors.white),),
          ],
        ),
        ),
      ),

    );
  }
}