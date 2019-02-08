import 'package:flutter/material.dart';
import 'dart:async';

class addmember extends StatefulWidget {
  @override
  _addmemberState createState() => new _addmemberState();
}
enum Answers{Frontend,Backend,Mobiledev,design}
void save(){

}

class _addmemberState extends State<addmember> {
  String _position = 'กรุณาเลือกตำแหน่ง';
  void _setValue(String position) => setState(() => _position = position);
  Future _askUser() async {
    switch(
    await showDialog(
        context: context,
        child: new SimpleDialog(
          title: new Text('เลือกตำแหน่ง'),
          children: <Widget>[
            new SimpleDialogOption(child: new Text('Front-end'),onPressed: (){Navigator.pop(context, Answers.Frontend);},),
            new SimpleDialogOption(child: new Text('Back-end'),onPressed: (){Navigator.pop(context, Answers.Backend);},),
            new SimpleDialogOption(child: new Text('Mobiledev'),onPressed: (){Navigator.pop(context, Answers.Mobiledev);},),
            new SimpleDialogOption(child: new Text('design'),onPressed: (){Navigator.pop(context, Answers.design);},),
          ],
        )
    )
    ) {
      case Answers.Frontend:
        _setValue('Frontend');
        break;
      case Answers.Backend:
        _setValue('Backend');
        break;
      case Answers.Mobiledev:
        _setValue('Mobile-Dev');
        break;
      case Answers.design:
        _setValue('Design');
        break;
    }
  }
  bool _value1 = false;
  bool _value2 = false;
  bool _value3 = false;

  void _check(bool value) => setState(() => _value1 = value);
  void _check2(bool value) => setState(() => _value2 = value);
  void _check3(bool value) => setState(() => _value3 = value);

  Widget build(BuildContext context) {
    MediaQueryData queryData = MediaQuery.of(context);

    double screenWidth = queryData.size.width;
    double screenHeight = queryData.size.height;
    screenHeight = screenHeight*0.9;
    screenWidth = screenWidth ;
    Color colorappbar = const Color(0xFF2ac3fe);

    return new Scaffold(
      appBar: new AppBar(backgroundColor: colorappbar,
        title: new Text('เพิ่มข้อมูล',style: TextStyle(color: Colors.brown[500]),),
      ),
      body: Container(
        height: screenHeight,
        width: screenWidth,
        padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
        margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
        child: Center(
          child: ListView(
              children: <Widget>[
                ListTile(
                  leading: Text('ข้อมูลส่วนตัว',style: TextStyle(fontSize: 20),),
                ),
                Divider(),
                ListTile(
                  leading: Text('ชื่อ-นามสกุล     \n',style: TextStyle(),),
                  title: TextField(maxLength: 40,
                    decoration: InputDecoration.collapsed(
                        hintText: 'ป้อนชื่อนามสกุล'
                    ),
                  ),
                ),
                Divider(),
                ListTile(
                  leading: Text('ที่อยู่                 '),
                  title: TextField(maxLength: 50,
                    decoration: InputDecoration.collapsed(
                        hintText: 'ป้อนที่อยู่'
                    ),
                  ),
                ),
                Divider(),
                ListTile(
                  leading: Text('เบอร์ติดต่อ       '),
                  title: TextField(keyboardType: TextInputType.phone ,maxLength: 10,
                    decoration: InputDecoration.collapsed(
                        hintText: 'ป้อนเบอร์ติดต่อ'
                    ),
                  ),
                ),
                Divider(),
                ListTile(
                  leading: Text('เงินเดือน          '),
                  title: TextField(keyboardType: TextInputType.phone ,maxLength: 10,
                    decoration: InputDecoration.collapsed(
                        hintText: 'ป้อนเงินเดือน'
                    ),
                  ),
                ),
                Divider(),
                ListTile(
                  leading: Text('สาขา                '),
                  title: TextField(maxLength: 20,
                    decoration: InputDecoration.collapsed(
                        hintText: 'ป้อนสาขา'
                    ),
                  ),
                ),
                Divider(),
                ListTile(
                  leading: new Text('ตำแหน่ง      ',style: TextStyle(fontSize: 16),),
                  title: Text('${_position}',style: TextStyle(fontSize: 14),),
                  trailing: new IconButton(icon: new Icon(Icons.list), onPressed: _askUser),
                ),
                Divider(),
                ListTile(
                  leading: Text('ข้อมูลผู้ติดต่อ',style: TextStyle(fontSize: 20),),),
                Divider(),
                ListTile(
                  leading: Text('ผู้ติดต่อฉุกเฉิน  '),
                  title: TextField(maxLength: 40,
                    decoration: InputDecoration.collapsed(
                        hintText: 'ป้อนผู้ติดต่อฉุกเฉิน'
                    ),
                  ),
                ),

                Divider(),
                ListTile(
                  leading: Text('ที่อยู่                 '),
                  title: TextField(maxLength: 50,
                    decoration: InputDecoration.collapsed(
                        hintText: 'ป้อนที่อยู่'
                    ),
                  ),
                ),
          Divider(),
          ListTile(
            leading: Text('เกี่ยวข้องเป็น     '),
            title: TextField(maxLength: 20,
              decoration: InputDecoration.collapsed(
                  hintText: 'ป้อนสถานะ'
              ),
            ),
          ),
                Divider(),
                ListTile(
                  leading: Text('เบอร์ติดต่อ      '),
                  title: TextField(maxLength: 10,keyboardType: TextInputType.phone,
                    decoration: InputDecoration.collapsed(
                        hintText: 'ป้อนเบอร์ติดต่อ'
                    ),
                  ),
                ),
                Divider(),
                ListTile(
                  leading: new Text('สิทธิประโยชน์      ',style: TextStyle(fontSize: 16),),
                  trailing: new IconButton(icon: new Icon(Icons.list),
                      onPressed: (){Navigator.of(context).pushNamed('/addbenefit');},),
                ),

            /*    ListTile(
                  leading: Text('สิทธิประโยชน์'),
                  title: Container(
                    child: Column(
                      children: <Widget>[

                        new Row(children: <Widget>[
                          Checkbox(value: _value1, onChanged: _check),
                          Text('ฟิตเนส',style: TextStyle(fontSize: 12)),
                          Checkbox(value: _value2, onChanged: _check2),
                          Text('ค่าโทรศัพท์',style: TextStyle(fontSize: 12),
                          ),
                        ],
                        ),
                        new Row(
                          children: <Widget>[
                            Checkbox(value: _value3, onChanged: _check3),
                            Text('ค่าอาหารกลางวัน',style: TextStyle(fontSize: 12)),
                          ],
                        ),

                      ],
                    ),
                  ),
                ),*/
              //  Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 30)),
                RaisedButton(onPressed: save,
                  child: Text('บันทึก'),
                  color:(Colors.green),
                  textColor: (Colors.white),
                  padding: EdgeInsets.all(10),),
              ]
          ),


        ),
      ),

    );
  }
}