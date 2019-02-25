import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:project/model/manday.dart';

class allmanday extends StatefulWidget {
  @override
  _allmandayState createState() => _allmandayState();
}

class _allmandayState extends State<allmanday> {
  int mandayisTrue =0;
  int loopmanday =0;
  Manday listmanday = new Manday();

  @override
  void initState() {
    super.initState();
    getmanday();

  }
  Future<void> getmanday() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("prefsToken");
    final response =
    await http.get('http://35.198.219.154:1337/manday/emp/datatable',
        headers: {'authorization': "Bearer "+token});
    String jsonString = response.body.toString();
    final jsonResponse = json.decode(jsonString);
   // print(jsonResponse);

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
    double screenHeight = queryData.size.height;
    return    Scaffold(
        appBar: new AppBar(backgroundColor: colorappbar,
          title: new Text('Manday',style: TextStyle(color: Colors.brown[500]),),

        ),
      body:  ListView(children: <Widget>[
        Container(margin: EdgeInsets.all(10),
            width: screenWidth,
            child: Column( children: mandayisTrue == 0 ? [
              Text('ไม่มีข้อมูล'),
            ] : detailmanday()
            )
        ),
      ],)
    );
  }
  List<Widget> detailmanday(){
    List<Widget> mylist = new List();
    for(int i = 0; i < listmanday.data.length ; i++ ){
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
