import 'package:flutter/material.dart';
import 'dart:async';
import './addmember.dart';
class addvacation extends StatefulWidget {
  @override
  _addvacationState createState() => new _addvacationState();
}




class _addvacationState extends State<addvacation> {

  int _vacationtype = 0;

  void _setValue1(int vacationtype) => setState(() => _vacationtype = vacationtype);


  String _value = 'ปปปป-ดด-วว';
  String _value2 = 'ปปปป-ดด-วว';
  String _value3 = 'ปปปป-ดด-วว';

  Future _selectvacation() async {
    DateTime picked = await showDatePicker(
        context: context,
        initialDate: new DateTime.now(),
        firstDate: new DateTime(2018),
        lastDate: new DateTime(2020)
    );
    if(picked != null) setState(() => _value = picked.toString());
  }

  Future _selectfirstday() async {
    DateTime picked = await showDatePicker(
        context: context,
        initialDate: new DateTime.now(),
        firstDate: new DateTime(2018),
        lastDate: new DateTime(2020)
    );
    if(picked != null) setState(() => _value2 = picked.toString());
  }

  Future _selectLastday() async {
    DateTime picked = await showDatePicker(
        context: context,
        initialDate: new DateTime.now(),
        firstDate: new DateTime(2018),
        lastDate: new DateTime(2020)
    );
    if(picked != null) setState(() => _value3 = picked.toString());



  }

  int groupvalue;

  void vacationtype (int e){
    setState(() {
      if(e == 1) {
        groupvalue = 1;
      }else if (e == 2) {
        groupvalue = 2;
      }else if (e == 3){
        groupvalue = 3;
      }
    });
  }

  Widget build(BuildContext context) {
    MediaQueryData queryData = MediaQuery.of(context);

    double screenWidth = queryData.size.width;
    double screenHeight = queryData.size.height;
    Color colorappbar = const Color(0xFF2ac3fe);
    return new Scaffold(
      appBar: new AppBar(backgroundColor: colorappbar,
        title: new Text('เพิ่มข้อมูล'),
      ),

      body: new Container(
        width: screenWidth,height: screenHeight,margin: EdgeInsets.all(5),
        child: new Center(
          child: new ListView(
          children: <Widget>[
            ListTile(
              leading: Text('ชื่อ-นามสกุล       ',style: TextStyle(),),
              title: TextField(
                decoration: InputDecoration.collapsed(
                    hintText: 'ป้อนชื่อนามสกุล'
                ),
              ),
            ),
            Divider(color: Colors.grey,),
              ListTile(
              leading: Text('วันที่ยื่นใบลา      '),
                title: Text(_value),
                trailing: IconButton(icon:Icon(Icons.date_range), onPressed: _selectvacation),
                ),
            Divider(color: Colors.grey,),
               ListTile(
                leading: Text('เริ่มลาวันที่         '),
                title: Text(_value2),
                trailing: IconButton(icon:Icon(Icons.date_range), onPressed: _selectfirstday),
              ),
            Divider(color: Colors.grey,),
         ListTile(
                leading: Text('ถึงวันที่              '),
                title: Text(_value3),
                trailing: IconButton(icon:Icon(Icons.date_range), onPressed: _selectLastday),
              ),
            Divider(color: Colors.grey,),
         Padding(padding: EdgeInsets.fromLTRB(16, 5, 0, 0),child: Text('ประเภทการลา'),),
         ListTile(
                leading: Container(
                  child: Row(
                  children: <Widget>[
                    Padding(padding: EdgeInsets.fromLTRB(0, 20, 0, 20)),
                     Radio(
                        value: 1,
                        groupValue: groupvalue,
                        onChanged: (int e) => vacationtype(e),
                      ),
                     Text('ลากิจ'),

                     Radio(
                        value: 2,
                        groupValue: groupvalue,
                        onChanged: (int e) => vacationtype(e),

                      ),
                     Text('ลาป่วย'),
                    Radio(
                        value: 3,
                        groupValue: groupvalue,
                        onChanged: (int e) => vacationtype(e),
                      ),
                      Text('ลาพักร้อน'),
                ]
                ),
                ),
              ),
            Divider(color: Colors.grey,),
            ListTile(
              leading: Text('หมายเหตุ      ',style: TextStyle(),),
              title: TextField(
                decoration: InputDecoration.collapsed(
                    hintText: 'ระบุหมายเหตุ'
                ),
              ),
            ),
            Divider(color: Colors.grey,),Padding(
                padding: EdgeInsets.only(bottom: 50),child: RaisedButton(onPressed: save,child: Text('บันทึก'),color: Colors.green,),)
            
          ],
        ),
        ),
      ),
    );
  }
}