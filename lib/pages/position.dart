import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
//import 'listposition.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../model/Position.dart';

//


//
class position extends StatefulWidget {
  @override
  _positionState createState() => new _positionState();
}
class Getposition {
  int createdAt;
  int updatedAt;
  int id;
  String positionName;
  int status;

  Getposition({
    this.createdAt,
    this.updatedAt,
    this.id,
    this.positionName,
    this.status,
  });

  factory Getposition.fromJson(Map<String, dynamic> json) => new Getposition(
    createdAt: json["createdAt"],
    updatedAt: json["updatedAt"],
    id: json["id"],
    positionName: json["position_name"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "createdAt": createdAt,
    "updatedAt": updatedAt,
    "id": id,
    "position_name": positionName,
    "status": status,
  };
}


class _positionState extends State<position>  {
  List data;
  Future<Position> fetchPost() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("prefsToken");
    final response =
    await http.get('http://35.198.219.154:1337/position/datatable',
        headers: {'authorization': "Bearer "+token});
//for (i=0 ,i>)
    final Map<String, dynamic> responseData = await json.decode(response.body);
  //  response.body;
   //* print('respondata ${responseData['data']}');
    String jsonString = response.body.toString();
    final jsonResponse = json.decode(jsonString);
    Position positiondata = new Position.fromJson(jsonResponse);
   //
    for (int i = 0 ; i < positiondata.data.length; i++)
    {
      print('createdAt is:' + positiondata.data[i].createdAt.toString());
      print('updatedAt is:' + positiondata.data[i].updatedAt.toString());
      print('id is:' + positiondata.data[i].id.toString());
      print('positionName is:' + positiondata.data[i].positionName);
      print('status is:' + positiondata.data[i].status.toString());
    }

    if (response.statusCode == 200) {
      print('ok');
      // If the call to the server was successful, parse the JSON
      return Position.fromJson(json.decode(response.body));
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }

/*
  List data;
  Future<String> getSWData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("prefsToken");
    var res = await http.get(Uri.parse(url),
        headers: {'authorization': "Bearer "+token});

    setState(() {
      var resBody = json.decode(res.body);
      data = resBody["data".toString()];
      print(data);
    });

    return "Success!";
  }
*/
  Future<String> DeletePo() async{

  }

  @override
  void initState() {
    super.initState();
    fetchPost();
  }

  Widget build(BuildContext context){
    Color buttoncolor = const Color(0xFF4fa2e1);
    Color colorappbar = const Color(0xFF2ac3fe);
    MediaQueryData queryData = MediaQuery.of(context);

    double screenWidth = queryData.size.width;
    double screenHeight = queryData.size.height;
    return new Scaffold(
        appBar: new AppBar(backgroundColor:Colors.lightBlue[300],
            title: new Text('ตำแหน่ง',style: TextStyle(color: Colors.brown[500]),),
            actions: <Widget>[
              new IconButton(icon: new Icon(Icons.search), onPressed: null),
              //  new IconButton(icon: new Icon(Icons.home), onPressed: () {Navigator.of(context).pushNamed('/Home');})
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
              ListTile(
                leading: Icon(Icons.card_giftcard,color: Colors.black),
                title: Text('สิทธิประโยชน์'),
                onTap:(){Navigator.of(context).pushNamed('/benefit');},

              ),
            ],
          ),
        ),
        body: Container
          (width: screenWidth,height: screenHeight,margin: EdgeInsets.all(5),
          child: ListView.builder(
            itemCount: data == null ? 0 : data.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Container(
                          child: ListTile(
                            leading: Text(data[index]["position_name"], style: TextStyle(fontSize: 18.0, color: Colors.black87)),
                            subtitle: Row(mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                IconButton(icon: Icon(Icons.edit), onPressed: null),
                                IconButton(icon: Icon(Icons.delete), onPressed: null)
                              ],
                            ),
                            /*      onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailScreen(),
                      ),
                    );
                  },*/
                          )
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: buttoncolor,
          onPressed: (){Navigator.of(context).pushNamed('/addposition');},
          child: Icon(Icons.add),)
    );
  }

}
