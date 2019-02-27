import 'package:flutter/material.dart';
import 'dart:async';
import 'package:moment/moment.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
class addproject extends StatefulWidget {
  @override
  _addprojectState createState() => new _addprojectState();
}
class _addprojectState extends State<addproject> {

  String projectname='';
  String customer_name='';
  int startdate =DateTime.now().millisecondsSinceEpoch;
  int enddate   =DateTime.now().millisecondsSinceEpoch;
  String teamname='';
  String note='';
  String selling ='';

  Future<dynamic> Addnewproject(projectname,customer_name,startdate,enddate,teamname,note,selling) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String Token = prefs.getString("prefsToken");
    //  print(user);
    // print(pass);

    // print(password);
    var url = 'http://35.198.219.154:1337/projectmanage/create';
    var body = {
      'project_name': projectname,
      'project_costomer_name': customer_name,
      'project_start_date': startdate,
      'project_end_date': enddate,
      'project_team_name' : teamname,
      'project_note': note,
      "selling": selling,

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

  Future _startday() async {
    DateTime picked = await showDatePicker(
        context: context,
        initialDate: new DateTime.now(),
        firstDate: new DateTime(2018),
        lastDate: new DateTime(2020)
    );
    if(picked != null){
      setState(() {
        startdate = picked.millisecondsSinceEpoch;
      });

    }
    }

 Future _endday() async {
   DateTime picked = await showDatePicker(
       context: context,
       initialDate: new DateTime.now(),
       firstDate: new DateTime(2018),
       lastDate: new DateTime(2020)
   );
   // picked.millisecondsSinceEpoch;
   if(picked != null){
     setState(() {
       enddate = picked.millisecondsSinceEpoch;
     });
   }
 }
  
  Widget build(BuildContext context) {
    Color buttoncolor = const Color(0xFF4fa2e1);
    Color colorappbar = const Color(0xFF2ac3fe);
    MediaQueryData queryData = MediaQuery.of(context);

    double screenWidth = queryData.size.width;
    double screenHeight = queryData.size.height;
    return new Scaffold(
      appBar: new AppBar(backgroundColor: colorappbar,
        title: new Text('เพิ่มโปรเจค',style:TextStyle(color: Colors.white),),
      ),

      body: new Container(width: screenWidth,height: screenHeight,margin: EdgeInsets.all(10),
        child: new Center(
          child: new ListView(
          children: <Widget>[
            ListTile(
                leading: Text('ชื่อโปรเจค     '),
                title: TextField(
                  onChanged: (String projectinput) {
                  projectname  = projectinput;
                  print(projectname);
                },
                  decoration: InputDecoration.collapsed(hintText: 'ป้อนโปรเจค'),),
              ),
          Divider(color: Colors.grey),
            ListTile(
              leading: Text('ลูกค้า          '),
              title: TextField(
                onChanged: (String cus_input) {
                customer_name  = cus_input;
                print(customer_name);
              },
                decoration: InputDecoration.collapsed(hintText: 'ป้อนชื่อลูกค้า'),),
            ),
            Divider(color: Colors.grey),
         ListTile(
                leading: Text('วันเริ่มต้น     '),
                title: Text(Moment(startdate).format('dd/MMM/yyyy')),
                trailing: IconButton(icon:Icon(Icons.event), onPressed: _startday),
              ),
            Divider(color: Colors.grey),
        ListTile(
                leading: Text('วันเสร็จสิ้น    '),
                title: Text(Moment(enddate).format('dd/MMM/yyyy')),
                trailing: IconButton(icon:Icon(Icons.event), onPressed: _endday),
              ),
            Divider(color: Colors.grey),
            ListTile(
              leading: Text('ทีมรับผิดชอบ'),
              title: TextField(
                onChanged: (String teaminput) {
                teamname  = teaminput;
                print(teamname);
              },
                decoration: InputDecoration.collapsed(hintText: 'ป้อนทีมรับผิดชอบ'),),
            ),
            Divider(color: Colors.grey),
            ListTile(
              leading: Text('Selling Rate'
                  ''),
              title: TextField(
                  onChanged: (String sellingrate) {
                selling  = sellingrate;
                print(selling);
              },
                decoration: InputDecoration.collapsed(hintText: 'selling rate'),),
            ),
            Divider(color: Colors.grey),
            ListTile(
              leading: Text('หมายเหตุ      '),
              title: TextField(
                onChanged: (String noteinput) {
                  note  = noteinput;
                  print(note);
                },
                decoration: InputDecoration.collapsed(hintText: 'ระบุหมายเหตุ'),),
            ),
            Divider(color: Colors.grey),
            RaisedButton(onPressed: (){
            if(projectname == '' ||customer_name == ''|| teamname ==''|| note =='' || selling ==''){

            }
          Addnewproject(projectname, customer_name, startdate.toString(), enddate.toString(), teamname, note,selling);
            },child:Text('บันทึก',style: TextStyle(color: Colors.white),),color: Colors.green,),
          ],
        ),
        ),
      ),
    );
  }

}
