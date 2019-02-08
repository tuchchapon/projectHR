import 'package:flutter/material.dart';

class teammanage extends StatefulWidget {
  @override
  _teammanageState createState() => _teammanageState();
}

class _teammanageState extends State<teammanage> {

  @override
  Widget build(BuildContext context) {
    Color buttoncolor = const Color(0xFF4fa2e1);
    Color colorappbar = const Color(0xFF2ac3fe);
    MediaQueryData queryData = MediaQuery.of(context);

    double screenWidth = queryData.size.width;
    double screenHeight = queryData.size.height;
    return new Scaffold(
      appBar: new AppBar(backgroundColor: colorappbar,
        title: new Text('เพิ่มข้อมูล',style: TextStyle(color: Colors.brown[500]),),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search),color: Colors.black, onPressed: null)
        ],
      ),
      body:  ListView(
        children: <Widget>[
          Container(width: screenWidth,height: screenHeight,margin: EdgeInsets.all(5),
            child: Column(
              children: <Widget>[
                ListTile(
                  leading: Text('สมาชิก:',style: TextStyle(fontSize: 16),),
                  title: Text('Team A',style: TextStyle(color: Colors.blue),),
                ),
                ListTile(
                  onTap: (){Navigator.of(context).pushNamed('/memberstatus');},
                  title: Text('ธัชพล สุธรรมมา'),
                  subtitle: Column(children: <Widget>[
                    Row(children: <Widget>[
                      Text('ตำแหน่ง:',style: TextStyle(color: Colors.black),),
                      Text('Mobile',style: TextStyle(color: Colors.blue),),
                    ],),
                    Row(children: <Widget>[
                      Text('จำนวน Sprint:  ',style: TextStyle(color: Colors.black),),
                      Text('9',style: TextStyle(color: Colors.blue),),
                    ],)
                  ],),
                ),
              ],
            ),
          )
        ],
      ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: buttoncolor,
          onPressed: (){Navigator.of(context).pushNamed('/addteammember');},
          child: Icon(Icons.add,size: 30,),)
    );
  }
}