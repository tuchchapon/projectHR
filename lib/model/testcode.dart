import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of the application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shared preferences demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Shared preferences demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  @override
  void initState() {
    super.initState();
    _loadCounter();
  }

  //Loading counter value on start
  _loadCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _counter = (prefs.getInt('counter') ?? 0);
    });
  }

  //Incrementing counter after click
  _incrementCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _counter = (prefs.getInt('counter') ?? 0) + 1;
      prefs.setInt('counter', _counter);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

/*
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
//import 'listposition.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

/*
class DetailScreen extends StatelessWidget {
  // Declare a field that holds the Todo
  final Positiondata todo;

  // In the constructor, require a Todo
  DetailScreen({Key key, @required this.todo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Use the Todo to create our UI
    return Scaffold(
      appBar: AppBar(
        title: Text(todo.id.toString()),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Text(todo.position_name),
      ),
    );
  }
}
*/


//
Position positionFromJson(String str) {
  final jsonData = json.decode(str);
  return Position.fromJson(jsonData);
}

String positionToJson(Position data) {
  final dyn = data.toJson();
  return json.encode(dyn);
}

class Position {
  int draw;
  int recordsTotal;
  int recordsFiltered;
  List<Data> data;

  Position({
    this.draw,
    this.recordsTotal,
    this.recordsFiltered,
    this.data,
  });

  factory Position.fromJson(Map<String, dynamic> json) => new Position(
    draw: json["draw"],
    recordsTotal: json["recordsTotal"],
    recordsFiltered: json["recordsFiltered"],
    data: new List<Data>.from(json["data"].map((x) => Data.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "draw": draw,
    "recordsTotal": recordsTotal,
    "recordsFiltered": recordsFiltered,
    "data": new List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Data {
  int createdAt;
  int updatedAt;
  int id;
  String positionName;
  int status;

  Data({
    this.createdAt,
    this.updatedAt,
    this.id,
    this.positionName,
    this.status,
  });

  factory Data.fromJson(Map<String, dynamic> json) => new Data(
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


//
class position extends StatefulWidget {
  @override
  _positionState createState() => new _positionState();
}


class _positionState extends State<position>  {

  final String url = "http://35.198.219.154:1337/position/datatable";
 // List data;
  Future<String> getSWData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String name = prefs.getString("name");

    var res = await http.get(Uri.parse(url),
        headers: {'authorization': "Bearer "+name});
   // final responseJson = json.decode(res.body);

    final Map<String, dynamic> responseData = await json.decode(
        res.body);
    print(responseData);
    String jsonString = res.body.toString();
    final jsonResponse = json.decode(jsonString);
    Data token = new Data.fromJson(jsonResponse);
   // print('Token is:'+token.positionName);
    print(token);

    return "Success!";
  }

  Future<String> DeletePo() async{

  }


  @override
  void initState() {
    super.initState();
    getSWData();

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

  /*      body: Container
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
        ),*/
        floatingActionButton: FloatingActionButton(
          backgroundColor: buttoncolor,
          onPressed: (){Navigator.of(context).pushNamed('/addposition');},
          child: Icon(Icons.add),)
    );
  }
}


*/