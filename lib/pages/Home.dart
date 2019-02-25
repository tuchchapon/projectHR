import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:math';
import 'package:charts_flutter/flutter.dart' as charts;
import '../model/manday.dart';
import '../model/project.dart';



class Home extends StatefulWidget {
  @override
  _HomeState createState() => new _HomeState();

}


  @override
  Widget build(BuildContext context) {

}
class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    getmanday();
    getprojectsell();

  }
  ///
  int loopproject =0;
  int loopmanday =0;
  int projectisTrue =0;
  int mandayisTrue =0;
  Project listproject = new Project();
  Manday listmanday = new Manday();
  ///
  void _makeData() {

  }
  ///
  Future<void> getprojectsell() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("prefsToken");
    final response =
    await http.get('http://35.198.219.154:1337/projectmanage/datatable',
        headers: {'authorization': "Bearer "+token});
    String jsonString = response.body.toString();
    final jsonResponse = json.decode(jsonString);
  //  print(jsonResponse);

    if (response.statusCode == 200) {

      // If the call to the server was successful, parse the JSON
//      return Position.fromJson(json.decode(response.body));
      listproject = new Project.fromJson(jsonResponse);
      setState(() {
        loopproject = listproject.data.length;
        this.projectisTrue = 1;
      });
   //   print('AAAAAA');
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
    // print('print+++++++'+listPosition.data[1].positionName);
  }

  Future<void> getmanday() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("prefsToken");
    final response =
    await http.get('http://35.198.219.154:1337/manday/emp/datatable',
        headers: {'authorization': "Bearer "+token});
    String jsonString = response.body.toString();
    final jsonResponse = json.decode(jsonString);
  //  print(jsonResponse);

    if (response.statusCode == 200) {

      // If the call to the server was successful, parse the JSON
//      return Position.fromJson(json.decode(response.body));
      listmanday = new Manday.fromJson(jsonResponse);
      setState(() {
        loopmanday = listmanday.data.length;
        this.mandayisTrue = 1;
      });
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
    // print('print+++++++'+listPosition.data[1].positionName);
  }

  @override
  Widget build(BuildContext context) {

    Color colorappbar = const Color(0xFF2ac3fe);
    MediaQueryData queryData = MediaQuery.of(context);

    double screenWidth = queryData.size.width;
    double screenHeight = queryData.size.height*0.4;
    return new Scaffold(
      appBar: new AppBar(
          backgroundColor: colorappbar,
          title: new Text('หน้าหลัก ',style:TextStyle(color: Colors.brown[500]),),

      ),

      drawer: Drawer(
        child: Column(
          children: <Widget>[
            Container(width: screenWidth,height: screenHeight*0.6,
              color: colorappbar,
              child: Center(
                child: Column(mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Padding(padding: EdgeInsets.only(top: 20,)),
                  CircleAvatar(child: Icon(Icons.image),radius: 30,backgroundColor: Colors.grey,),
                  Padding(padding: EdgeInsets.only(top: 20,left: 50)),
                  Text('admin',style: TextStyle(fontSize: 20),)
                  ],
                ),
              )
              ,padding: EdgeInsets.only(right: 200,top: 10),
            ),
            //FlatButton(onPressed: (){Navigator.of(context).pushNamed('/member');}, child: new Text('asagasf') ),
            ListTile(
              leading: Icon(Icons.dashboard,color: Colors.black),
              title: Text('Dashboard'),
              onTap: (){Navigator.of(context).pushNamed('/Home');},
            ),
            ListTile(
              leading: Icon(Icons.assignment,color: Colors.black),
              title: Text('โปรเจค'),
              onTap:(){Navigator.of(context).pushNamed('/project');},
            ),
            ListTile(
              leading: Icon(Icons.people,color: Colors.black),
              title: Text('พนักงาน'),
              onTap: (){Navigator.of(context).pushNamed('/employee');},
            ),
            ListTile(
              leading: Icon(Icons.account_balance,color: Colors.black),
              title: Text('สาขา'),
              onTap:(){Navigator.of(context).pushNamed('/branch');},
            ),
            ListTile(
              leading: Icon(Icons.work,color: Colors.black),
              title: Text('ตำแหน่ง'),
              onTap:(){Navigator.of(context).pushNamed('/position');},
            ),
 /*           ListTile(
              leading: Icon(Icons.card_giftcard,color: Colors.black),
              title: Text('สิทธิประโยชน์'),
              onTap:(){Navigator.of(context).pushNamed('/benefit');},

            ),*/
          ],
        ),
      ),
      body:ListView(children: <Widget>[
        Container(width: screenWidth,margin: EdgeInsets.all(10),padding: EdgeInsets.all(10),
          child: Column(children: <Widget>[



            Divider(),
            Row(children: <Widget>[
              Text('Selling rate',style: TextStyle(fontSize: 20),),Padding(padding: EdgeInsets.only(top: 20,bottom: 20)),
            IconButton(icon: Icon(Icons.list), onPressed: (){Navigator.of(context).pushNamed('/allmanday');},tooltip: 'ดูทั้งหมด',)],
            mainAxisAlignment: MainAxisAlignment.spaceBetween,),
            Divider(),
            Container(
                width: screenWidth,
                child: Column( children: mandayisTrue == 0 ? [
                  Text('ไม่มีข้อมูลค่าใช้จ่าย'),
                ] : detailmanday()
                )
            ),
          Padding(padding: EdgeInsets.only(top: 20,bottom: 20)),
            Divider(),
          Row(children: <Widget>[Text('Project  sell',style: TextStyle(fontSize: 20),),Padding(padding: EdgeInsets.only(top: 20,bottom: 20)),] ),
            Divider(),
            Container(
                width: screenWidth,
                child: Column( children: projectisTrue == 0 ? [
                  Text('ไม่มีข้อมูลค่าใช้จ่าย'),
                ] : detailproject()
                )
            ),
            Container(
                width: screenWidth,
                child: Column( children: projectisTrue == 0 ? [
                  Text('ไม่มีข้อมูลค่าใช้จ่าย'),
                ] : totalsell()
                )
            ),
          ],
          ),)
      ],)
      );

  }
  List<Widget> totalsell(){
    List<Widget> mylist = new List();
    for(int i = 0; i < 1 ; i++ ){

      double totalsell = listproject.allprojectCost *3;
      mylist.add(Column(
          children: <Widget>[
            Row(children: <Widget>[Text('ราคาต้นทุนทั้งหมด')],),
            Padding(padding: EdgeInsets.only(bottom: 5,top: 5)),
            Row(children: <Widget>[Text(listproject.allprojectCost.toString()+'  บาท',style: TextStyle(color: Colors.red),),],),
            Padding(padding: EdgeInsets.only(bottom: 5,top: 5)),
            Row(children: <Widget>[Text('ราคาขายทั้งหมด'),],),
            Padding(padding: EdgeInsets.only(bottom: 5,top: 5)),
            Row(children: <Widget>[Text(totalsell.toString()+'  บาท',style: TextStyle(color: Colors.green),),],),
            Divider()

 ]

      )
      );
    }
    return mylist;
  }
  List<Widget> detailproject(){
    List<Widget> mylist = new List();
    for(int i = 0; i < loopproject ; i++ ){
      double sellingrate = listproject.data[i].projectTotalCost*3;
      mylist.add(Column(
          children: <Widget>[

            Row(children: <Widget>[Text(listproject.data[i].projectName),],),
            Row(children: <Widget>[Text('ลูกค้า '),Text(listproject.data[i].projectCostomerName),],),
            Row(mainAxisAlignment: MainAxisAlignment.start,children: <Widget>[
              Text('ราคาต้นทุน : '),
              Text(listproject.data[i].projectTotalCost.toString(),style: TextStyle(color: Colors.red),),
              Text('   บาท')
            ],
            ),
            Row(mainAxisAlignment: MainAxisAlignment.start,children: <Widget>[
              Text('ราคาขาย    : '),
              Text(sellingrate.toString(),style: TextStyle(color: Colors.green),),
              Text('   บาท')
            ],),
            Divider()
          ]

      )
      );
    }
    return mylist;
  }
  List<Widget> detailmanday(){
    List<Widget> mylist = new List();
    for(int i = 0; i < 5 ; i++ ){
      mylist.add(Column(
          children: <Widget>[

             Row(children: <Widget>[Text(listmanday.data[i].empName),],),
            Row(children: <Widget>[
              Text(listmanday.data[i].selling.toString(),style: TextStyle(color: Colors.green),),
              Text('  บาท/วัน')
            ],),
              Divider()
               ]

      )
      );
    }
    return mylist;
  }
}


/**
    Container(
    padding: EdgeInsets.all(10),
    margin: EdgeInsets.only(left: 5,right: 5),width: screenWidth,
    child: Row( children: additisTrue == 0 ? [
    Text('ไม่มีข้อมูลค่าใช้จ่าย'),
    ] : totalcost()
    )
    ),
 */

