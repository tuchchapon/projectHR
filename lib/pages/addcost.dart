import 'package:flutter/material.dart';
import './addmember.dart';
class addcost extends StatefulWidget {
  @override
  _addcostState createState() => new _addcostState();
}

class _addcostState extends State<addcost> {

  String _value = 'ปปปป-ดด-วว';
  Future _selectday() async {
    DateTime picked = await showDatePicker(
        context: context,
        initialDate: new DateTime.now(),
        firstDate: new DateTime(2018),
        lastDate: new DateTime(2020)
    );
    if(picked != null) setState(() => _value = picked.toString());
  }

  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('เพิ่มค่าใช้จ่ายอื่นๆ'),
      ),

      body: new Container(
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
            leading: Text('วันที่        '),
            title: Text(_value),
            trailing: IconButton(icon:Icon(Icons.event), onPressed: _selectday),
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