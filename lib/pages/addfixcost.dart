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
    print('id is'+widget.id.toString());
  }
  String title;
  String price;
  String note;
  Widget build(BuildContext context) {
    Color colorappbar = const Color(0xFF2ac3fe);
    MediaQueryData queryData = MediaQuery.of(context);

    double screenWidth = queryData.size.width;
    double screenHeight = queryData.size.height;
    return new Scaffold(
      appBar: new AppBar(backgroundColor: colorappbar,
        title: new Text('เพิ่มค่าใช้จ่ายทั่วไป',style: TextStyle(color: Colors.brown[500]),),
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
          title:            TextField(
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
          onPressed: (){Addfixcost(title, price, note, widget.id.toString());},
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