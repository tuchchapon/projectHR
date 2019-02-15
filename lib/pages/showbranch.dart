import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'branch.dart';
import '../model/fixcost.dart';
import '../model/branchaddit.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class showbranch extends StatefulWidget {
  @override
  _showbranchState createState() => new _showbranchState();
  int id;
  String branch_name;
  String branchaddress;

  showbranch({this.id, this.branch_name, this.branchaddress});
}


class _showbranchState extends State<showbranch> {
  int additisTrue = 0;
  int fixisTrue = 0;
  int loopfixcost = 0;
  int loopaddit = 0;

  @override
  void initState() {
    super.initState();
    getbranchaddit();
    getbranchfixcost();
     bid.text = widget.id.toString();
    bname.text = widget.branch_name;
     baddress.text = widget.branchaddress;
  }
  //String branchname;
  final bid = TextEditingController();
  final bname = TextEditingController();
  final baddress = TextEditingController();

  Branchfixcost listfixcost = new Branchfixcost();
  Branchaddit listadditcost = new Branchaddit();

  Future<void> getbranchfixcost() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("prefsToken");
    final response =
    await http.get('http://35.198.219.154:1337/branchcost/fixcost/${bid.text}/view',
      headers: {'authorization': "Bearer "+token},);
     print(response.body);
    String jsonString = response.body.toString();
    final jsonResponse = json.decode(jsonString);
    listfixcost = new Branchfixcost.fromJson(jsonResponse);
    setState(() {
      additisTrue = 1;
      this.loopaddit = listadditcost.data.length;
      print(loopaddit.toString());
      //this.listfixcost = jsonResponse.length;
    });
  //  print(listfixcost.data[0].fixcostBranchId.id.toString());

    if (response.statusCode == 200) {

    } else {
      throw Exception('Failed to load post');
    }
  }
  Future<void> getbranchaddit() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("prefsToken");
    final response =
    await http.get('http://35.198.219.154:1337/branchcost/addit/${bid.text}/view',
      headers: {'authorization': "Bearer "+token},);
    String jsonString = response.body.toString();
    final jsonResponse = json.decode(jsonString);
    listadditcost = new Branchaddit.fromJson(jsonResponse);
    setState(() {
      fixisTrue = 1;
      this.loopaddit = listadditcost.data.length;
      print(loopaddit.toString());
      //this.listfixcost = jsonResponse.length;
    print(loopaddit);
    });
    if (response.statusCode == 200) {

    } else {

      throw Exception('Failed to load post');
    }
  }


 // DetailScreen({this.id,this.branchname,this.branchaddress});


  Color colorappbar = const Color(0xFF2ac3fe);
  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData = MediaQuery.of(context);

    double screenWidth = queryData.size.width;
    double screenHeight = queryData.size.height;

    return Scaffold(
      appBar: AppBar(backgroundColor: colorappbar,
        title: Text('ข้อมูลสาขา',style: TextStyle(color: Colors.brown[500]),),
      ),
      body: ListView(
        children: <Widget>[
          Container(color: Colors.amber,
              margin: EdgeInsets.only(right: 5,left: 5),height:screenHeight*0.3,width: screenWidth,
              child: Center(child: Column(
                children: <Widget>[
                //  Text(bid.text),
                  ListTile(leading: Text('ชื่อสาขา           ',style: TextStyle(fontSize: 12),), title: Text(bname.text,style: TextStyle(fontSize: 12),),),
                  ListTile(leading: Text('ที่อยู่สาขา         ',style: TextStyle(fontSize: 12),), title: Text(baddress.text,style: TextStyle(fontSize: 12),),),
                  ListTile(leading: Text('รวมค่าใช้จ่ายของสาขา',style: TextStyle(fontSize: 12),), title: FlatButton(onPressed: null, child: Text(('จัดการค่าใช้จ่าย>'),style: TextStyle(fontSize: 12),))),
                ],
              ),

              ),

          ),
          Text('     ค่าใช้จ่ายทั่วไป           ',style: TextStyle(fontSize: 12)),
          ListTile(leading: Text('รายการ'),trailing: Text('มูลค่า'),),
          Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.only(left: 5,right: 5),width: screenWidth,
              child: Column( children: fixisTrue == 0 ? [
                Text('Waiting Data'),
              ] : detailfixcost()
              )
          ),
          Text('     ค่าใช้จ่ายอื่นๆ           ',style: TextStyle(fontSize: 12)),
          ListTile(leading: Text('รายการ'),trailing: Text('มูลค่า'),),
          Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.only(left: 5,right: 5),width: screenWidth,
              child: Column( children: additisTrue == 0 ? [
                Text('Waiting Data'),
              ] : detailadddit()
              )
          ),
        ]
      ),

      );

  }
  List<Widget> detailfixcost(){
    List<Widget> mylist = new List();
    for(int i = 0; i < this.loopfixcost ; i++ ){
      mylist.add(Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
        Text(listfixcost.data[i].fixcostTitle,style: TextStyle(color: Colors.grey),),
        Text(listfixcost.data[i].fixcostPrice.toString()+'\$',style: TextStyle(color: Colors.grey),)
      ]
      ));
    }
    return mylist;
  }
  List<Widget> detailadddit(){
    List<Widget> mylist = new List();
    for(int i = 0; i < this.loopaddit ; i++ ){
      mylist.add(Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(listadditcost.data[i].branchAdditTitle,style: TextStyle(color: Colors.grey),),
            Text(listadditcost.data[i].branchAdditPrice.toString()+'\$',style: TextStyle(color: Colors.grey),)
          ]
      )
      );
    }
    return mylist;
  }

}
