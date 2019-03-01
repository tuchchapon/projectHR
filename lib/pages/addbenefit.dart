import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:moment/moment.dart';
class addbenefit extends StatefulWidget {
  @override
  _addbenefitState createState() => new _addbenefitState();
  int empid;
  addbenefit({this.empid});
}

class _addbenefitState extends State<addbenefit> {

  int timestamp;
//  String adddate = 'วว/ดด/ปปปป';
  String benefit_title='';
  String benefit_price='';
  String benefit_note='';
  var benefit_date = DateTime.now().millisecondsSinceEpoch;
  Future _adddate() async {
    DateTime picked = await showDatePicker(
      context: context,

      initialDate: new DateTime.now(),
      firstDate: new DateTime(2018),
      lastDate: new DateTime(2022),

    ) ;

    if(picked != null) {
      setState(() {
         benefit_date = picked.millisecondsSinceEpoch;

        print('benefit_date is ${benefit_date}');

      });
    };
  }

  Future<dynamic> Addbenefit(emp_id,title,price,date,note) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String Token = prefs.getString("prefsToken");

    //print(title);
    var url = 'http://35.198.219.154:1337/benefit/create';
    var body = {
      'benefit_emp_id': emp_id,
      'benefit_title': title,
      'benefit_price': price,
      'benefit_date' : date,
      'benefit_note' : note,

    };
    print('Body is ${body}');
    http.Response response = await http.post(
        url,
        headers: {'authorization': "Bearer "+Token},
        body: body);
    print(response.body);
    Navigator.of(context).pushReplacementNamed('/employee');
    final Map<String, dynamic> responseData = await json.decode(
        response.body);
    print(responseData);
    return responseData['code'];

  }


  Widget build(BuildContext context) {
    Color colorappbar = const Color(0xFF2ac3fe);
    MediaQueryData queryData = MediaQuery.of(context);

    double screenWidth = queryData.size.width;
    double screenHeight = queryData.size.height;
    return new Scaffold(
      appBar: new AppBar(backgroundColor: colorappbar,
        title: new Text('เพิ่มข้อมูล',style: TextStyle(color: Colors.white),),
      ),

      body: new Container(height: screenHeight,width: screenWidth,margin: EdgeInsets.all(10),
        child: new Center(
          child: new ListView(
          children: <Widget>[
          ListTile(leading: Text('รายการ   '),
            title: TextField(
              decoration: InputDecoration.collapsed(
                hintText: ' ป้อนรายการสิทธิประโยชน์',
              ),
           onChanged: (String titleinput){
                benefit_title = titleinput;
                print(benefit_title);
           },
            ),
          ),
          Divider(color: Colors.grey,),
          ListTile(leading: Text('มูลค่า      '),
            title: TextField(
              decoration: InputDecoration.collapsed(
                hintText: ' ป้อนมูลค่า',
              ),
              onChanged: (String priceinput){
                benefit_price = priceinput;
                print(benefit_price);
              }, ),
          ),
          Divider(color: Colors.grey,),
          ListTile(
            leading: Text('วันที่        '),
            title: Text(Moment(benefit_date).format("dd/MMM/yyyy")),
            trailing: IconButton(icon:Icon(Icons.event), onPressed: _adddate),
          ),
          Divider(color: Colors.grey,),
          ListTile(leading: Text('หมายเหตุ '),
            title:
            TextField(
              decoration: InputDecoration.collapsed(
                hintText: 'ระบุหมายเหตุ',
              ),
              onChanged: (String noteinput){
                benefit_note = noteinput;
                print(benefit_note);
              }, ),
          ),
          Divider(color: Colors.grey,),
          RaisedButton(onPressed: (){

          if(benefit_title ==''|| benefit_price ==''||benefit_date ==''||benefit_note ==''){

          }
          Addbenefit(widget.empid.toString(), benefit_title, benefit_price, benefit_date.toString(), benefit_note);
          },
            child: Text('บันทึก',style: TextStyle(color: Colors.white),),color: Colors.green,)
          ],
        ),
        ),
      ),
    );
  }
}