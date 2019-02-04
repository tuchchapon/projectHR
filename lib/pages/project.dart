import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'listproject.dart';

Future<List<Project>> fetchPosts(http.Client client) async {
  final response = await client.get('http://35.198.219.154:1337/Projectmanage'); // ดึงข้อมูลจาก API

  return compute(parsePosts, response.body); // compute ต้องประกาศ import 'package:flutter/foundation.dart';
}
List<Project> parsePosts(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<Project>((json) => Project.fromJson(json)).toList();
}

class project extends StatefulWidget {
  @override
  _projectState createState() => new _projectState();
}

class _projectState extends State<project>  {

  Widget build(BuildContext context) {
    Color buttoncolor = const Color(0xFF4fa2e1);
    Color colorappbar = const Color(0xFF2ac3fe);
    MediaQueryData queryData = MediaQuery.of(context);

    double screenWidth = queryData.size.width;
    double screenHeight = queryData.size.height;
    String bkk ='twinsynergy BKK';
    return new Scaffold(
      appBar: new AppBar(backgroundColor: colorappbar,
          title: new Text('โปรเจค'),
          actions: <Widget>[
            new IconButton(icon: new Icon(Icons.search), onPressed: null),
            new IconButton(icon: new Icon(Icons.home), onPressed: () {Navigator.of(context).pushNamed('/Home');})
          ]
      ),

        drawer: Drawer(
          child: Column(
            children: <Widget>[
              Container(width: screenWidth,height: screenHeight*0.22,
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
              /*   ListTile(
              leading: Icon(Icons.event,color: Colors.black),
              title: Text('การลา') ,
              onTap: (){Navigator.of(context).pushNamed('/vacation');},
            ),
            ListTile(
              leading: Icon(Icons.card_giftcard,color: Colors.black),
              title: Text('สิทธิประโยชน์'),
              onTap:(){Navigator.of(context).pushNamed('/benefit');},

            ),*/
            ],
          ),
        ),
        body: Container(
          child: FutureBuilder<List<Project>>(
            future: fetchPosts(http.Client()),
            builder: (context, snapshot) {
              if (snapshot.hasError) print(snapshot.error);

              return snapshot.hasData
                  ? ListViewPosts(posts: snapshot.data)
                  : Center(child: CircularProgressIndicator());
            },
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: buttoncolor,
          onPressed: (){Navigator.of(context).pushNamed('/addproject');},
          child: Icon(Icons.add),)
    );
  }
}