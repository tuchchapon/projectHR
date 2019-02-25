import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'editposition.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:project/model/Position.dart';

//


//
class position extends StatefulWidget {

  @override
  _positionState createState() => new _positionState();
}

class _positionState extends State<position>  {


 // List positionlist;
  Position listPosition = new Position();
  int isTrue = 0;
  @override
  void initState() {
    super.initState();
    fetchPost();
  }
  Future<void> fetchPost() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("prefsToken");
    final response =
    await http.get('http://35.198.219.154:1337/position/datatable',
        headers: {'authorization': "Bearer "+token});
  //for (i=0 ,i>)
  //  final Map<String, dynamic> responseData = await json.decode(response.body);
  //  response.body;
   //* print('respondata ${responseData['data']}');
    String jsonString = response.body.toString();
    final jsonResponse = json.decode(jsonString);


    if (response.statusCode == 200) {

      // If the call to the server was successful, parse the JSON
//      return Position.fromJson(json.decode(response.body));
      listPosition = new Position.fromJson(jsonResponse);
      setState(() {
        this.isTrue = 1;
      });
      print('AAAAAA');
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
   // print('print+++++++'+listPosition.data[1].positionName);
  }

  Future<dynamic> update(position) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String Token = prefs.getString("prefsToken");
    var url = 'http://35.198.219.154:1337/position/update';
    var body = {
      'position_name': position,
    };
    print(body);
    http.Response response = await http.post(
        url,
        headers: {'authorization': "Bearer "+Token},
        body: body);
    Navigator.of(context).pushReplacementNamed('/position');
    final Map<String, dynamic> responseData = await json.decode(
        response.body);
    print(responseData);
    return responseData['code'];

  }
//
  Future<dynamic> deletePosition(id) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String Token = prefs.getString("prefsToken");
    var url = 'http://35.198.219.154:1337/position/delete';
    var body = {
      'id': id,
    };
     http.Response response = await http.post(url,
     headers: {'authorization': "Bearer "+Token},
    body: body);
     print(response.body);
    fetchPost();
  }
//
//
  Widget build(BuildContext context){
    Color buttoncolor = const Color(0xFF4fa2e1);
    Color colorappbar = const Color(0xFF2ac3fe);
    MediaQueryData queryData = MediaQuery.of(context);

    double screenWidth = queryData.size.width;
    double screenHeight = queryData.size.height*0.4;
//    print('mylength'+listposition.data.length.toString());
    return new Scaffold(
        appBar: new AppBar(backgroundColor:Colors.lightBlue[300],
            title: new Text('ตำแหน่ง',style: TextStyle(color: Colors.brown[500]),),

        ),
        drawer: Drawer(
          child: Column(
            children: <Widget>[
              Container(width: screenWidth,height: screenHeight*0.6,
                color: colorappbar,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
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

            ],
          ),
        ),
        body: Container(width: screenWidth,height: screenHeight*2.1,margin: EdgeInsets.all(5),color: Colors.white,
          child:  isTrue != 0 ?
          ListView.builder(
            itemCount: listPosition.data.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                  child: DetailPosition( id: listPosition.data[index].id,
                    positionName:listPosition.data[index].positionName ,del: deletePosition,)
              );
            },
          ):Text('Waiting')

        ,padding: EdgeInsets.only(left: 10),),
        floatingActionButton: FloatingActionButton(
          backgroundColor: buttoncolor,
          onPressed: (){Navigator.of(context).pushNamed('/addposition');},
          child: Icon(Icons.add),)
    );
  }

}



class DetailPosition extends StatelessWidget {
  //
  Future _showAlert(BuildContext context, String message) async {
    return showDialog(
        context: context,
        child: new AlertDialog(
          title: new Text(message),
          actions: <Widget>[
            new FlatButton(onPressed: () {del(id.toString());Navigator.pop(context);}, child: new Text('ยืนยัน')
            ),
            new FlatButton(onPressed: () => Navigator.pop(context), child: new Text('ยกเลิก'))
          ],
        )

    );
  }
  Function del;
  int id;
  String positionName;
  DetailPosition({this.id,this.positionName,this.del});
  @override
  Widget build(BuildContext context) {
    return Container(child: Column(children: <Widget>[
    Slidable(
    delegate: new SlidableDrawerDelegate(),
      actionExtentRatio: 0.23,
      child: new Container(
        color: Colors.white,
        child: new ListTile(
          title: new Text(positionName),
          onTap: () {
            Navigator.push(context,
              MaterialPageRoute(
                  builder: (context) => DetailScreen(id: id,positionName: positionName,)
              ),
            );
          }, ),
      ),
      secondaryActions: <Widget>[
        new IconSlideAction(
          caption: 'Edit',
          color: Colors.black45,
          icon: Icons.edit,
             onTap: (){
               Navigator.push(
                 context,
                 MaterialPageRoute(
                   builder: (context) => editposition(id: id,positionName: positionName,),
                 ),
               );
             }
        ),
        new IconSlideAction(
          caption: 'Delete',
          color: Colors.red,
          icon: Icons.delete,
             onTap: () => _showAlert(context, 'ต้องการลบ ${positionName} หรือไม่!')
        ),
      ],
    ),
   Divider() ],),);
  }
}
class DetailScreen extends StatelessWidget {

  int id;
  String positionName;
  DetailScreen({this.id,this.positionName,});


  Color colorappbar = const Color(0xFF2ac3fe);
//  final  Position position;
  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData = MediaQuery.of(context);

    double screenWidth = queryData.size.width;
    double screenHeight = queryData.size.height;

    return Scaffold(
      appBar: AppBar(backgroundColor: colorappbar,
        title: Text('ข้อมูลตำแหน่ง',style: TextStyle(color: Colors.brown[500]),),
      ),
      body: Container(
        margin: EdgeInsets.all(5),height:screenHeight ,width: screenWidth,
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
           // Text('id  '+id.toString(),style: TextStyle(fontSize: 16),),
            Text('ตำแหน่ง  '+positionName,style: TextStyle(fontSize: 16),),
          ],
        )
      ),
    );
  }
}
/*
Container(
      child:Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          InkWell(
            onTap: (){ print('ok');},
            child: Text(positionName),
          ),
          Row(
            children: <Widget>[
              IconButton(
                onPressed: () {
    Navigator.push(context,
    MaterialPageRoute(
    builder: (context) => Positiondetail(id: id,positionName: positionName,)),);},
                icon: Icon(Icons.edit),
              ),
              IconButton(
                onPressed: (){
                  print(id);
                  del(id.toString());
                },
                icon: Icon(Icons.delete),
              )
            ],
          )
        ],
      ),
    );
 */
/**
    Slidable(
    delegate: new SlidableDrawerDelegate(),
    actionExtentRatio: 0.23,
    child: new Container(
    color: Colors.white,
    child: new ListTile(
    title: new Text(listPosition.data[index].positionName),
    ),
    ),
    secondaryActions: <Widget>[
    new IconSlideAction(
    caption: 'Edit',
    color: Colors.black45,
    icon: Icons.edit,
    //   onTap: () => _showSnackBar('More'),
    ),
    new IconSlideAction(
    caption: 'Delete',
    color: Colors.red,
    icon: Icons.delete,
    //   onTap: () => _showSnackBar('Delete'),
    ),
    ],
    ),
    */

/**
 * class DetailPosition extends StatelessWidget {
    //
    Future _showAlert(BuildContext context, String message) async {
    return showDialog(
    context: context,
    child: new AlertDialog(
    title: new Text(message),
    actions: <Widget>[
    new FlatButton(onPressed: () {del(id.toString());}, child: new Text('ยืนยัน')
    ),
    new FlatButton(onPressed: () => Navigator.pop(context), child: new Text('ยกเลิก'))
    ],
    )

    );
    }
    Function del;
    int id;
    String positionName;
    DetailPosition({this.id,this.positionName,this.del});
    @override
    Widget build(BuildContext context) {
    return ListTile(
    leading: Text(positionName),
    title: Row(mainAxisAlignment: MainAxisAlignment.end,
    children: <Widget>[
    IconButton(icon: Icon(Icons.edit), onPressed: (){
    Navigator.push(
    context,
    MaterialPageRoute(
    builder: (context) => editposition(id: id,positionName: positionName,),
    ),
    );
    }),
    IconButton(icon: Icon(Icons.delete), onPressed: () => _showAlert(context, 'ต้องการลบ ${positionName} หรือไม่!')
    // del(id.toString());

    ),
    ],
    ),
    onTap: () {
    Navigator.push(context,
    MaterialPageRoute(
    builder: (context) => DetailScreen(id: id,positionName: positionName,)
    ),
    );
    },
    );
    }
    }
*/