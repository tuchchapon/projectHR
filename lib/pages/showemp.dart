import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import '../model/benefit.dart';
import '../model/positionemp.dart';
class showemp extends StatefulWidget {
  @override
  _showempState createState() => _showempState();

  int id;
  String empname;
  String empnickname;
  String emptel;
  String emp_address;
  int emp_salary;
  String conname;
  String con_relation;
  String contel;
  String con_address;
  showemp({
    this.id,
    this.empname,
    this.empnickname,
    this.emptel,
    this.emp_address,
    this.emp_salary,
    this.conname,
    this.con_relation,
    this.contel,
    this.con_address
  });

}

class _showempState extends State<showemp> {

  int positionIstrue = 0;
  int benefitIstrue = 0;
  int loopposition = 0;
  int loopbenefit = 0;
  Position listposition = new Position();
  Benefit listbenefit = new Benefit();
  @override
  void initState() {
    super.initState();
    getbenefit();
    getposition();
  }
  Future<void> getposition() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("prefsToken");
    final response =
    await http.get('http://35.198.219.154:1337/emp/position/${widget.id}/view',
      headers: {'authorization': "Bearer "+token},);
     //print(response.body);
    String jsonString = response.body.toString();
    final jsonResponse = json.decode(jsonString);
    listposition = new Position.fromJson(jsonResponse);
    setState(() {
      positionIstrue = 1;
      this.loopposition = listposition.data.length;
    });
    //  print(listfixcost.data[0].fixcostBranchId.id.toString());

    if (response.statusCode == 200) {

    } else {
      throw Exception('Failed to load post');
    }
  }
  Future<void> getbenefit() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("prefsToken");
    final response =
    await http.get('http://35.198.219.154:1337/employee/benefit/${widget.id}/view',
      headers: {'authorization': "Bearer "+token},);
    // print(response.body);
    String jsonString = response.body.toString();
    final jsonResponse = json.decode(jsonString);
    listbenefit = new Benefit.fromJson(jsonResponse);
    setState(() {
      benefitIstrue = 1;
      this.loopbenefit = listbenefit.data.length;
    });
    //  print(listfixcost.data[0].fixcostBranchId.id.toString());

    if (response.statusCode == 200) {

    } else {
      throw Exception('Failed to load post');
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
        title: new Text('ข้อมูลพนักงาน',style: TextStyle(color: Colors.brown[500]),),
      ),
      body: ListView(
        children: <Widget>[
          Text('  ข้อมูลส่วนตัว',style: TextStyle(fontSize: 16),),
        Container(margin: EdgeInsets.all(5),
        child: Center(child: Column(children: <Widget>[
          ListTile(leading: Text('ชื่อ-นามสกุล',style: TextStyle(fontSize: 12),),
            title: Text(widget.empname,style: TextStyle(fontSize: 12),),),
          ListTile(leading: Text('ที่อยู่',style: TextStyle(fontSize: 12),),
            title: Text(widget.emp_address,style: TextStyle(fontSize: 12),),),
          ListTile(leading: Text('เบอร์โทร',style: TextStyle(fontSize: 12),),
            title: Text(widget.emptel,style: TextStyle(fontSize: 12),),),
          ListTile(leading: Text('เงินเดือน',style: TextStyle(fontSize: 12),),
            title: Text(widget.emp_salary.toString(),style: TextStyle(fontSize: 12),),),
        ],
        ),),),
          Text('  ตำแหน่ง',style: TextStyle(fontSize: 16),),
          Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.only(left: 5,right: 5),width: screenWidth,
              child: Column( children: positionIstrue == 0 ? [
                Text('Waiting Data'),
              ] : detailposition()
              )
          ),
        Divider(),
        Text('  ข้อมูลผู้ติดต่อ',style: TextStyle(fontSize: 16),),
          Container(child: Center(child: Column(children: <Widget>[
            ListTile(leading: Text('ผู้ติดต่อฉุกเฉิน',style: TextStyle(fontSize: 12),),
              title: Text(widget.conname,style: TextStyle(fontSize: 12),),),
            ListTile(leading: Text('เบอร์ติดต่อ',style: TextStyle(fontSize: 12),),
              title: Text(widget.contel,style: TextStyle(fontSize: 12),),),
            ListTile(leading: Text('ที่อยู่',style: TextStyle(fontSize: 12),),
              title: Text(widget.con_address,style: TextStyle(fontSize: 12),),),
          ],),),),
          Text('    สิทธิประโยชน์',style: TextStyle(fontSize: 12),),
          ListTile(leading: Text('รายการ'),trailing: Text('มูลค่า'),),
          Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.only(left: 5,right: 5),width: screenWidth,
              child: Column( children: benefitIstrue == 0 ? [
                Text('Waiting Data'),
              ] : detailbenefit()
              )
          ),
        ]
        ,)
      );
  }
  List<Widget> detailposition(){
    List<Widget> mylist = new List();
    for(int i = 0; i < this.loopposition ; i++ ){
      mylist.add(Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
      Text(listposition.data[i].positionName)
          ]
      )
      );
    }
    return mylist;
  }
  List<Widget> detailbenefit(){
    List<Widget> mylist = new List();
    for(int i = 0; i < this.loopbenefit ; i++ ){
      mylist.add(Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
             Text(listbenefit.data[i].benefitTitle,style: TextStyle(color: Colors.grey,fontSize: 12),),
             Text(listbenefit.data[i].benefitPrice.toString()+' \$',style: TextStyle(color: Colors.grey,fontSize: 12),)

          ]
      )
      );
    }
    return mylist;
  }

}
