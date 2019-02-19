import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import '../model/employee.dart';

class member extends StatefulWidget {
  @override
  _memberState createState() => new _memberState();
}

class _memberState extends State<member>  {

  Employee listEmp = new Employee();
  int isTrue = 0;

  Future<void> getempdata() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("prefsToken");
    final response =
    await http.get('http://35.198.219.154:1337/emp/datatable',
      headers: {'authorization': "Bearer "+token},);
    //  print(response.body);
    String jsonString = response.body.toString();
    final jsonResponse = json.decode(jsonString);
    // print(jsonResponse["data"]);
    listEmp = new Employee.fromJson(jsonResponse);
    print('createdAt is'+listEmp.data[0].createdAt.toString());
    print('updatedAt is'+listEmp.data[0].updatedAt.toString());
    print('id is'+listEmp.data[0].id.toString());
    print('empName is'+listEmp.data[0].empName);
    print('empName is'+listEmp.data[0].empEmerConName);
    print('empSalary is'+listEmp.data[0].empSalary.toString());
    print('empEmerConTel is'+listEmp.data[0].empEmerConTel);

    if (response.statusCode == 200) {
      //listBrabch = new Branch.fromJson(jsonResponse);
      setState(() {
        this.isTrue = 1;
      });

     // print(listEmp.data[0].empName);
    } else {

      throw Exception('Failed to load post');
    }
  }
//
  @override
  void initState() {
    super.initState();
    getempdata();
  }
//
Widget build(BuildContext context) {
  Color buttoncolor = const Color(0xFF4fa2e1);
  Color colorappbar = const Color(0xFF2ac3fe);
  MediaQueryData queryData = MediaQuery.of(context);

  double screenWidth = queryData.size.width;
  double screenHeight = queryData.size.height*0.4;
  return new Scaffold(
    appBar: new AppBar(
      backgroundColor: colorappbar,
        title: new Text('พนักงาน',style: TextStyle(color: Colors.brown[500]),),
        actions: <Widget>[
          new IconButton(icon: new Icon(Icons.search), onPressed: null),
       //   new IconButton(icon: new Icon(Icons.home), onPressed: () {Navigator.of(context).pushNamed('/Home');})
        ]
    ),

      drawer: Drawer(
        child: Column(
          children: <Widget>[
            Container(width: screenWidth,height: screenHeight*0.6,
              color: colorappbar,
              child: Center(
                child: Column(mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[Padding(padding: EdgeInsets.only(top: 20,)),
                  CircleAvatar(child: Icon(Icons.image),radius: 30,backgroundColor: Colors.grey,),
                  Padding(padding: EdgeInsets.only(top: 20,left: 50)),
                  Text('admin',style: TextStyle(fontSize: 20),)
                  ],
                ),
              ),padding: EdgeInsets.only(right: 200,top: 10),
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
              onTap: (){Navigator.of(context).pushNamed('/member');},
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
            ListTile(
              leading: Icon(Icons.card_giftcard,color: Colors.black),
              title: Text('สิทธิประโยชน์'),
              onTap:(){Navigator.of(context).pushNamed('/benefit');},

            ),
          ],
        ),
      ),

      body: ListView(children: <Widget>[
        Container(child: null
          ,)
      ],),

      floatingActionButton: FloatingActionButton(
  backgroundColor: buttoncolor,
      onPressed: (){Navigator.of(context).pushNamed('/addmember');},
    child: Icon(Icons.add),)

  );
}
}