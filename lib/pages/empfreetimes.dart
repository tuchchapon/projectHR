import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../model/empfreetimes.dart';

class empfreetimes extends StatefulWidget {
  @override
  _empfreetimesState createState() => _empfreetimesState();
  int project_id;
  int position_id;
  String positionname;
  empfreetimes({this.project_id,this.position_id,this.positionname});
}

class _empfreetimesState extends State<empfreetimes> {

  @override
  void initState() {
    super.initState();
    getfreetime();
    print('position id is'+widget.position_id.toString());
    print('project id is'+widget.project_id.toString());
  }
  int loopfreetimes=0;
  int isTrue =0;
  Freetime listfreetimes = new Freetime();
  Future<void> getfreetime() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("prefsToken");
    final response =
    await http.get('http://35.198.219.154:1337/freetime/emp/${widget.project_id}/${widget.position_id}',
        headers: {'authorization': "Bearer "+token});
    String jsonString = response.body.toString();
    final jsonResponse = json.decode(jsonString);
   // print(response.body);
    if (response.statusCode == 200) {

      listfreetimes = new Freetime.fromJson(jsonResponse);
      setState(() {
        this.loopfreetimes = listfreetimes.data.length;
        this.isTrue = 1;
        print(loopfreetimes);
        print(isTrue);
      });
      print('AAAAAA');
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
    // print('print+++++++'+listPosition.data[1].positionName);
  }
  Future<dynamic> addteammember(position_id,project_id,emp_id,) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String Token = prefs.getString("prefsToken");

    var url = 'http://35.198.219.154:1337/m/team/create';
    var body = {
      'position_id': position_id,
      'project_id':project_id,
      'emp_id':emp_id,
    };
    print(body);
    http.Response response = await http.post(
        url,
        headers: {'authorization': "Bearer "+Token},
        body: body);
    Navigator.of(context).pushReplacementNamed('/project');
    final Map<String, dynamic> responseData = await json.decode(
        response.body);
    print(responseData);
    return responseData['code'];

  }


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
      body: ListView(
        children: <Widget>[
          Padding(padding: EdgeInsets.only(top: 10)),
          Text('    ตำแหน่ง '+widget.positionname,style: TextStyle(fontSize: 16),),
          Container(
            margin: EdgeInsets.all(5),height:screenHeight ,width: screenWidth,
            padding: EdgeInsets.all(16.0),
            child: Column(
                children: isTrue == 0 ? [
                  Text('Waiting Data'),
                ] : detailfreetime()
            )


        ),],
      )

    );
  }
  List<Widget> detailfreetime(){
    List<Widget> mylist = new List();
    for(int i = 0; i < this.loopfreetimes ; i++ ){
      mylist.add(Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            ListTile(title: Text(listfreetimes.data[i].empName),
              subtitle: Row(children: <Widget>[
              Text('สถานะ ',style: TextStyle(color: Colors.green),),
              Text(listfreetimes.data[i].freetime,style: TextStyle(color: Colors.black),),

              ],)

              ,onTap: (){addteammember(widget.position_id.toString(), widget.project_id.toString(), listfreetimes.data[i].empId.toString());}
            ),
            Divider()]
      )
      );
    }
    return mylist;
  }

}

