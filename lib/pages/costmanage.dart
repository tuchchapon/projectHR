import 'package:flutter/material.dart';
import 'addemp.dart';

class costmanage extends StatefulWidget {
  @override
  _costmanageState createState() => _costmanageState();
}

class _costmanageState extends State<costmanage> {

  String _date = 'ปปปป-ดด-วว';

  Future _selectdate() async {
    DateTime picked = await showDatePicker(
        context: context,
        initialDate: new DateTime.now(),
        firstDate: new DateTime(2018),
        lastDate: new DateTime(2020)
    );
    if(picked != null) setState(() => _date = picked.toString());
  }

  @override
  Widget build(BuildContext context) {
    Color colorappbar = const Color(0xFF2ac3fe);
    MediaQueryData queryData = MediaQuery.of(context);

    double screenWidth = queryData.size.width;
    double screenHeight = queryData.size.height;
    return new Scaffold(
      appBar: new AppBar(backgroundColor: colorappbar,
        title: new Text('เพิ่มข้อมูลค่าใช้จ่าย',style: TextStyle(color: Colors.brown[500]),),
      ),
      body: new Container(height: screenHeight,width: screenWidth,margin: EdgeInsets.all(10),
        child: new Center(
          child: new ListView(
            children: <Widget>[
              ListTile(
                leading: Text('รายการ          '),
                title: TextField(decoration: InputDecoration.collapsed(hintText: 'ป้อนรายการค่าใช้จ่าย'),),
              ),
              Divider(color: Colors.grey,),
              ListTile(
                leading: Text('มูลค่า             '),
                title: TextField(decoration: InputDecoration.collapsed(hintText: 'ระบุมูลค่า'),),
              ),
              Divider(color: Colors.grey,),
               ListTile(
                  leading: Text('วันที่ทำรายการ'),
                  title: Text(_date),
                  trailing: IconButton(
                      icon: Icon(Icons.event), onPressed: _selectdate),
                ),
              Divider(color: Colors.grey,),
              ListTile(
                leading: Text('หมายเหตุ        '),
                title: TextField(decoration: InputDecoration.collapsed(hintText: 'ระบุหมายเหตุ'),),
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