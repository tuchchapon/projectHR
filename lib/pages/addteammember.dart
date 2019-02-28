import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
//import 'empfreetimes.dart';
import 'package:project/model/Position.dart';
import 'package:project/pages/empfreetimes.dart';
import 'package:project/pages/updatesprint.dart';

//


//
class addteammember extends StatefulWidget {

  @override
  _addteammemberState createState() => new _addteammemberState();
  int project_id;
  addteammember({this.project_id});
}

class _addteammemberState extends State<addteammember>  {


  // List positionlist;
  Position listPosition = new Position();
  int isTrue = 0;
  @override
  void initState() {
    super.initState();
    getposition();
  }

  Future<void> getposition() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("prefsToken");
    final response =
    await http.get('http://35.198.219.154:1337/position/datatable',
        headers: {'authorization': "Bearer "+token});
    String jsonString = response.body.toString();
    final jsonResponse = json.decode(jsonString);

    if (response.statusCode == 200) {

      listPosition = new Position.fromJson(jsonResponse);
      setState(() {
        this.isTrue = 1;
      });
      print('AAAAAA');
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }


//
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
        appBar: new AppBar(backgroundColor:colorappbar,
            title: new Text('ตำแหน่ง',style: TextStyle(color: Colors.white),),

        ),
        body: Container
          (width: screenWidth,height: screenHeight*2.1,margin: EdgeInsets.all(5),color: Colors.transparent,
          child:  isTrue != 0 ?
          ListView.builder(
            itemCount: listPosition.data.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                  child: DetailPosition( positionid:  listPosition.data[index].id,
                    positionName:listPosition.data[index].positionName ,projectid: widget.project_id,
                    )
              );
            },
          ):Text('Waiting')

          ,),

    );
  }

}

class DetailPosition extends StatelessWidget {
  //

 // int id;
  int projectid;
  String positionName;
  int positionid;

  DetailPosition({this.positionName,this.projectid,this.positionid});
  @override
  Widget build(BuildContext context) {
    return Card(child:
    ListTile(
      leading: Text(positionName),
      trailing: IconButton(icon: Icon(Icons.view_list,color: Colors.blue,), onPressed: null),
      onTap: () {
        print(projectid);
        print(positionName);
        print(positionid);

        Navigator.push(context,
          MaterialPageRoute(

              builder: (context) => updatesprint(projectid: projectid,positionid: positionid,positionname: positionName,)
          ),
        );
      },
    ));
  }
}

/*
() {
                             Navigator.push(
                               context,
                               MaterialPageRoute(
                                 builder: (context) => updatesprint(teamid: listteam.data[i].id,
                                    projectid: widget.project_id,
                                 ),
                               ),
                             );}
 */