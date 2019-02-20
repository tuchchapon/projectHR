import 'package:flutter/material.dart';
import 'addemp.dart';

class memberstatus extends StatefulWidget {
  @override
  _memberstatusState createState() => _memberstatusState();
}

class _memberstatusState extends State<memberstatus> {
  @override
  Widget build(BuildContext context) {
    Color colorappbar = const Color(0xFF2ac3fe);
    MediaQueryData queryData = MediaQuery.of(context);

    double screenWidth = queryData.size.width;
    double screenHeight = queryData.size.height;
    return new Scaffold(
        appBar: new AppBar(backgroundColor: colorappbar,
          title: new Text('ข้อมูลสมาชิก',style: TextStyle(color: Colors.brown[500]),),
        ),
        body: new Container(width: screenWidth,height: screenHeight,margin: EdgeInsets.all(5),
          child: new Center(
            child: new ListView(
              children: <Widget>[
                ListTile(
                  leading: Text('ชื่อ-นามสกุล     '),
                  title: Text('นายธัชพล สุธรรมมา'),

                ),
                Divider(color: Colors.grey,),
                ListTile(
                  leading: Text('ตำแหน่ง         '),
                  title: Text('Mobile-dev'),
                ),
                Divider(color: Colors.grey,),
                ListTile(
                  leading: Text('สถานะ             '),
                 title: Container(
                   child: Row(
                     children: <Widget>[
                       CircleAvatar(child: Container(),backgroundColor:(Colors.green),radius: 8,),
                       Text(' ว่าง')
                     ],
                   ),
                 ),
                ),
                Divider(color: Colors.grey,),
                ListTile(
                  leading: Text('ระยะเวลาทำงาน'),
                  title: Text('90 วัน'),

                ),
                Divider(color: Colors.grey,),
                ListTile(
                  leading: Text('จำนวน sprint   '),
                    title: Text('9'),

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
