import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
class addfixcost extends StatefulWidget {
  @override
  _addfixcostState createState() => new _addfixcostState();
  int id;
  addfixcost({this.id});
}

class _addfixcostState extends State<addfixcost> {
  @override
  void initState() {
    super.initState();
    title ='';
    price = '';
    note = '';
  }
  String title;
  String price;
  String note;
  Widget build(BuildContext context) {

    void _showDialog() {
      // flutter defined function
      showDialog(
        context: context,
        builder: (BuildContext context) {
          // return object of type Dialog
          return AlertDialog(
            title: new Text("ผิดพลาด !"),
            content: new Text("กรุณากรอกข้อมูลให้ครบถ้วน"),
            actions: <Widget>[
              // usually buttons at the bottom of the dialog
              new FlatButton(
                child: new Text("ปิด"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
    void _showDialognumber() {
      // flutter defined function
      showDialog(
        context: context,
        builder: (BuildContext context) {
          // return object of type Dialog
          return AlertDialog(
            title: new Text("ต้องการบันทึกข้อมูลหรือไม่"),
         //   content: new Text("รูปแบบข้อมูลผิดพลาด"),
            actions: <Widget>[
              new FlatButton(
                child: new Text("ยืนยัน"),
                onPressed: () {
                  Addfixcost(title, price, note, widget.id.toString()) ;
                },
              ),
              new FlatButton(
                child: new Text("ยกเลิก"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }

    Color colorappbar = const Color(0xFF2ac3fe);
    MediaQueryData queryData = MediaQuery.of(context);

    double screenWidth = queryData.size.width;
    double screenHeight = queryData.size.height;
    return new Scaffold(
      appBar: new AppBar(backgroundColor: colorappbar,
        title: new Text('เพิ่มค่าใช้จ่ายทั่วไป',style: TextStyle(color: Colors.white),),
      ),

      body: new Container(
        height: screenHeight,width: screenWidth,margin: EdgeInsets.all(5),
          child: new Center(child: ListView(
            children: <Widget>[
              ListTile(
              leading: Text('รายการ   '),
            title:            TextField(
              decoration: InputDecoration.collapsed(
                hintText: ('ป้อนรายการค่าใช้จ่าย'),
              ),
              onChanged: (String fixtitle) {
                title = fixtitle;
                print(title);
              },
            ),
          ),
        Divider(color: Colors.grey,),
        ListTile(
          leading: Text('มูลค่า      '),
          title:            TextField(keyboardType: TextInputType.numberWithOptions(),
            decoration: InputDecoration.collapsed(
              hintText: ('ระบุมูลค่า'),
            ),
            onChanged: (String fixprice) {
              price = fixprice;
              print(price);
            },
          ),
        ),
        Divider(color: Colors.grey,),
        ListTile(
          leading: Text('หมายเหตุ '),
          title:            TextField(
            decoration: InputDecoration.collapsed(
              hintText: ('ระบุหมายเหตุ'),
            ),
            onChanged: (String fixnote) {
              note = fixnote;
              print(note);
            },
          ),
        ),
        Divider(color: Colors.grey,),
        RaisedButton(
          padding: EdgeInsets.only(right: 25),
          onPressed: (){
            if (title == ''|| price == '' || note ==''){
              _showDialog();
            }
            else{_showDialognumber();}

          },
          child: Text('บันทึก'),color:(Colors.green),textColor: (Colors.white),),
            ],
          ),

        ),
      ),
    );
  }
  Future<dynamic> Addfixcost(title ,price,note ,branchid) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String Token = prefs.getString("prefsToken");
    //  print(user);
    // print(pass);
    print(title);
    // print(password);
    var url = 'http://35.198.219.154:1337/fixcost/create';
    var body = {
      'fixcost_title': title,
      'fixcost_price': price,
      'fixcost_note' : note,
      'fixcost_branch_id': branchid,
    };
    print(body);
    http.Response response = await http.post(
        url,
        headers: {'authorization': "Bearer "+Token},
        body: body);
    Navigator.of(context).pushReplacementNamed('/branch');
    final Map<String, dynamic> responseData = await json.decode(
        response.body);
    print(responseData);
    return responseData['code'];

  }


}