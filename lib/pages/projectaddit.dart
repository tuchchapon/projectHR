import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:moment/moment.dart';
import 'package:project/model/projectaddit.dart';
import 'package:project/pages/addprojectaddit.dart';

class projectaddit extends StatefulWidget {
  @override
  _projectadditState createState() => _projectadditState();
  int projectid;
 String projectname;
   projectaddit({this.projectname,this.projectid});

}

class _projectadditState extends State<projectaddit> {
  @override
  void initState() {
    super.initState();
    getprojectaddit();

  }
  Projectaddit listaddit  =new Projectaddit();
  int additisTrue = 0;
  int loopaddit =0;
  Future<void> getprojectaddit() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("prefsToken");
    final response =
    await http.get('http://35.198.219.154:1337/project/projectaddit/${widget.projectid}/view',
      headers: {'authorization': "Bearer "+token},);
    //  print(response.body);
    String jsonString = response.body.toString();
    final jsonResponse = json.decode(jsonString);
    listaddit = new Projectaddit.fromJson(jsonResponse);
    print(listaddit.data[0].projectAdditTitle);
    setState(() {
      additisTrue = 1;
      loopaddit = listaddit.data.length;
      print(loopaddit);
    });
    //  print(listfixcost.data[0].fixcostBranchId.id.toString());

    if (response.statusCode == 200) {

    } else {
      throw Exception('Failed to load post');
    }
  }
  Future<dynamic> deleteaddit(id) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String Token = prefs.getString("prefsToken");
    var url = 'http://35.198.219.154:1337/projectaddit/delete';
    var body = {
       'id': id,
    };
    print(id.toString());
    http.Response response = await http.post(url,
        headers: {'authorization': "Bearer "+Token},
        body: body);
    getprojectaddit();
  }

  Widget build(BuildContext context) {
    Color colorappbar = const Color(0xFF2ac3fe);
    Color buttoncolor = const Color(0xFF4fa2e1);
    MediaQueryData queryData = MediaQuery.of(context);

    double screenWidth = queryData.size.width;
    double screenHeight = queryData.size.height;
    return new Scaffold(
      appBar: new AppBar(backgroundColor: colorappbar,
        title: new Text('ค่าใช้จ่าย',style: TextStyle(color: Colors.brown[500]),),
      ),

      body: ListView(
        children: <Widget>[
          Padding(padding: EdgeInsets.only(top: 15)),
          Row(children: <Widget>[

            Text('   ค่าใช้จ่าย ',style: TextStyle(fontSize: 16),),
            Text(widget.projectname,style: TextStyle(color: Colors.blue,fontSize: 16),)
          ],),
          Container(
              margin: EdgeInsets.only(left: 5,right: 5,top: 10),width: screenWidth,
              child: Column( children: additisTrue == 0 ? [
                Text('ไม่มีข้อมูลค่าใช้จ่าย'),
              ] : detailadddit()
              )
          ),
        ],
      ), floatingActionButton: FloatingActionButton(
      backgroundColor: buttoncolor,
      onPressed:(){
    Navigator.push(
    context,
    MaterialPageRoute(
    builder: (context) => addprojectaddit(projectid: widget.projectid,)
    ),
    );
    },
      child: Icon(Icons.add),)
    );
    }
  List<Widget> detailadddit(){
    List<Widget> mylist = new List();
    for(int i = 0; i < this.loopaddit; i++ ){
      mylist.add(Column(
          children: <Widget>[
            ListTile(title: Text(listaddit.data[i].projectAdditTitle),subtitle: Column(children: <Widget>[
              Row(children: <Widget>[
                Text(listaddit.data[i].projectAdditPrice.toString()),
                Text(' \฿',style: TextStyle(color: Colors.green),)
              ],
              ),
              Row(children: <Widget>[
                Text(listaddit.data[i].projectAdditDateFormat)
              ],
              )
            ],),
            trailing: IconButton(icon: Icon(Icons.delete), onPressed: (){deleteaddit(listaddit.data[i].id.toString());}),)
          ]
      )
      );
    }
    return mylist;
  }
}
