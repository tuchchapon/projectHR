import 'package:flutter/material.dart';
//import 'addmember.dart';
import 'dart:async';

class addteammember extends StatefulWidget {
  @override
  _addteammemberState createState() => _addteammemberState();
}

enum Answers{Front1,Front2,Front3,Front4,back1,back2,back3,back4,mobile1,mobile2,mobile3,mobile4,design1,design2,design3,design4}

class _addteammemberState extends State<addteammember> {
  
  String _member = '';
void _setValue(String member) => setState(() => _member = member);
  Future _addmember() async {
    switch(
    await showDialog(
        context: context,
        child: new SimpleDialog(
          title: new Text('เลือกตำแหน่ง'),
          children: <Widget>[
            Text('        Frontend',style: TextStyle(fontSize: 18),),
            new SimpleDialogOption(child: new Text('ธัชพล1 สุธรรมมา'),onPressed: (){Navigator.pop(context, Answers.Front1);},),
            new SimpleDialogOption(child: new Text('นายธัชพล2 สุธรรมมา'),onPressed: (){Navigator.pop(context, Answers.Front2);},),
            new SimpleDialogOption(child: new Text('นายธัชพล3 สุธรรมมา'),onPressed: (){Navigator.pop(context, Answers.Front3);},),
            new SimpleDialogOption(child: new Text('นายธัชพล4 สุธรรมมา'),onPressed: (){Navigator.pop(context, Answers.Front4);},),
            Text('         Backend',style: TextStyle(fontSize: 18),),
            new SimpleDialogOption(child: new Text('นางธัชพล5 สุธรรมมา'),onPressed: (){Navigator.pop(context, Answers.back1);},),
            new SimpleDialogOption(child: new Text('นางสาวธัชพล6 สุธรรมมา'),onPressed: (){Navigator.pop(context, Answers.back2);},),
            new SimpleDialogOption(child: new Text('นางธัชพล7 สุธรรมมา'),onPressed: (){Navigator.pop(context, Answers.back3);},),
            new SimpleDialogOption(child: new Text('นางธัชพล8 สุธรรมมา'),onPressed: (){Navigator.pop(context, Answers.back4);},),
            Text('         Design',style: TextStyle(fontSize: 18),),
            new SimpleDialogOption(child: new Text('นางธัชพล9 สุธรรมมา'),onPressed: (){Navigator.pop(context, Answers.design1);},),
            new SimpleDialogOption(child: new Text('นางธัชพล10 สุธรรมมา'),onPressed: (){Navigator.pop(context, Answers.design2);},),
            new SimpleDialogOption(child: new Text('นางธัชพล11 สุธรรมมา'),onPressed: (){Navigator.pop(context, Answers.design3);},),
            new SimpleDialogOption(child: new Text('นางธัชพล12 สุธรรมมา'),onPressed: (){Navigator.pop(context, Answers.design4);},),
            Text('         Mobile',style: TextStyle(fontSize: 18),),
            new SimpleDialogOption(child: new Text('นางธัชพล13 สุธรรมมา'),onPressed: (){Navigator.pop(context, Answers.mobile1);},),
            new SimpleDialogOption(child: new Text('นางธัชพล14 สุธรรมมา'),onPressed: (){Navigator.pop(context, Answers.mobile2);},),
            new SimpleDialogOption(child: new Text('นางธัชพล15 สุธรรมมา'),onPressed: (){Navigator.pop(context, Answers.mobile3);},),
            new SimpleDialogOption(child: new Text('นางธัชพล16 สุธรรมมา'),onPressed: (){Navigator.pop(context, Answers.mobile4);},),
          ],
        )
    )
    ) {
      case Answers.Front1:
        _setValue('ธัชพล สุธรรมมา1');
        break;
      case Answers.Front2:
        _setValue('นายธัชพล สุธรรมมา2');
        break;
      case Answers.Front3:
        _setValue('นางธัชพล สุธรรมมา3');
        break;
      case Answers.Front4:
        _setValue('นางสาวธัชพล สุธรรมมา4');
        break;
      case Answers.back1:
        _setValue('ธัชพล สุธรรมมา5');
        break;
      case Answers.back2:
        _setValue('ธัชพล สุธรรมมา6');
        break;
      case Answers.back3:
        _setValue('ธัชพล สุธรรมมา7');
        break;
      case Answers.back4:
        _setValue('ธัชพล สุธรรมมา8');
        break;
      case Answers.design1:
        _setValue('ธัชพล สุธรรมมา9');
        break;
      case Answers.design2:
        _setValue('ธัชพล สุธรรมมา10');
        break;
      case Answers.design3:
        _setValue('ธัชพล สุธรรมมา11');
        break;
      case Answers.design4:
        _setValue('ธัชพล สุธรรมมา12');
        break;
      case Answers.mobile1:
        _setValue('ธัชพล สุธรรมมา13');
        break;
      case Answers.mobile2:
        _setValue('ธัชพล สุธรรมมา14');
        break;
      case Answers.mobile3:
        _setValue('ธัชพล สุธรรมมา15');
        break;
      case Answers.mobile4:
        _setValue('ธัชพล สุธรรมมา16');
        break;
    }
  }


  @override
  Widget build(BuildContext context) {
    Color colorappbar = const Color(0xFF2ac3fe);
    MediaQueryData queryData = MediaQuery.of(context);

    double screenWidth = queryData.size.width;
    double screenHeight = queryData.size.height;
    return new Scaffold(
        appBar: new AppBar(backgroundColor: colorappbar,
          title: new Text('เพิ่มข้อมูล'),
        ),
        body: new Container(width: screenWidth,height: screenHeight,margin: EdgeInsets.all(5),
          child: new Center(
            child: new ListView(
              children: <Widget>[
                ListTile(
                  leading: Text('เลือกสมาชิก'),
                  title: Text(_member,style: TextStyle(fontSize: 12),),
                  trailing: FlatButton(onPressed: _addmember, child: Text('เลือกสมาชิกในทีม')),
                ),
                Divider(color: Colors.grey),
                ListTile(
                  leading: Text('ระยะเวลาทำงาน      '),
                  title: TextField(decoration: InputDecoration.collapsed(hintText: 'ป้อนระยะเวลาทำงาน'),),
                ),
                Divider(color: Colors.grey),
                ListTile(
                  leading: Text('จำนวน Sprint         '),
                  title: TextField(decoration: InputDecoration.collapsed(hintText: 'ป้อนจำนวน Sprint'),),
                ),
                Divider(color: Colors.grey),
            ],
            ),
          ),
        ),
     // floatingActionButton: RaisedButton(padding: EdgeInsets.fromLTRB(150, 10 /*top*/, 150/*right*/, 10/*bottom*/),onPressed: save,child: Text('บันทึก'),color:(Colors.green),textColor: (Colors.white),),

    );
  }
}
