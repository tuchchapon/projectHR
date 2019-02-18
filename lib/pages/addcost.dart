import 'package:flutter/material.dart';
import './addmember.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:moment/moment.dart';
class addcost extends StatefulWidget {
  @override
  _addcostState createState() => new _addcostState();
  int id;
  addcost({this.id});
}

class _addcostState extends State<addcost> {
  String addit_title;
  String addit_price;
  var timestamp;
  int timestampa;
  String adddate = 'วว/ดด/ปปปป';

  Future _adddate() async {
    DateTime picked = await showDatePicker(
        context: context,

        initialDate: new DateTime.now(),
        firstDate: new DateTime(2018),
        lastDate: new DateTime(2022),

    ) ;

    if(picked != null) {


      setState(() {
        timestamp = picked.millisecondsSinceEpoch;
        adddate = picked.toString();
        print('Time stamp is ${timestamp}');
        print(adddate);
      });
    };
  }

  Widget build(BuildContext context) {
    Color colorappbar = const Color(0xFF2ac3fe);
    MediaQueryData queryData = MediaQuery.of(context);

    double screenWidth = queryData.size.width;
    double screenHeight = queryData.size.height;
    return new Scaffold(
      appBar: new AppBar(backgroundColor: colorappbar,
        title: new Text('เพิ่มค่าใช้จ่ายอื่นๆ',style: TextStyle(color: Colors.brown[500]),),
      ),

      body: new Container(
        width: screenWidth,height: screenHeight,margin: EdgeInsets.all(5),
        child: new Center(
          child: ListView(
            children: <Widget>[

                  ListTile(
                    leading: Text('รายการ   '),
                    title:            TextField(
                      decoration: InputDecoration.collapsed(
                        hintText: ('ป้อนรายการค่าใช้จ่าย'),
                      ),
                      onChanged: (String titleinput) {
                        addit_title = titleinput;
                        print(addit_title);

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
                      onChanged: (String priceinput) {
                        addit_price = priceinput;
                        print(addit_price);

                      }, ),
                  ),
                  Divider(color: Colors.grey,),
                  ListTile(
                    leading: Text('วันที่        '),
                    title: Text(Moment(timestamp).format("dd/MMM/yyyy")),
                    trailing: IconButton(icon:Icon(Icons.event), onPressed: _adddate),
                  ),
                  Divider(color: Colors.grey,),
                  RaisedButton(
                    onPressed: (){
                      Addbranchaddit(addit_title, addit_price, timestamp.toString(), widget.id.toString());},
                    child: Text('บันทึก'),color:(Colors.green),textColor: (Colors.white),
                  ),
              Text(widget.id.toString())
            ],
          )
        ),
      ),
    );
  }
  Future<dynamic> Addbranchaddit(title ,price,adddate,branchid) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String Token = prefs.getString("prefsToken");

    print(title);
    var url = 'http://35.198.219.154:1337/branchaddit/create';
    var body = {
      'branch_addit_branch_id': branchid,
      'branch_addit_title': title,
      'branch_addit_price': price,
      'branch_addit_date' : adddate,

    };
    print('Body is ${body}');
    http.Response response = await http.post(
        url,
        headers: {'authorization': "Bearer "+Token},
        body: body);
    print(response);
    Navigator.of(context).pushReplacementNamed('/branch');
    final Map<String, dynamic> responseData = await json.decode(
        response.body);
    print(responseData);
    return responseData['code'];

  }
}