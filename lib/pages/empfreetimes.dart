import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:project/model/empfreetimes.dart';

class empfreetimes extends StatefulWidget {
  @override
  _empfreetimesState createState() => _empfreetimesState();
  int project_id;
  int position_id;
  Freetime listfreetimes;
  String positionname;
  int emp_startdate;
  int emp_enddate;
  /*

  String positionname;
  int startdate;
  int enddate;
  int empid;*/

  empfreetimes({this.listfreetimes,this.project_id,this.position_id,this.positionname,this.emp_enddate,this.emp_startdate});
}

class _empfreetimesState extends State<empfreetimes> {

  @override
  void initState() {
    super.initState();
   loopfreetimes = widget.listfreetimes.data.length;
   print(loopfreetimes);

   isTrue = 1;
  }
  int loopfreetimes;
  int isTrue =0;

 // Freetime listfreetimes = new Freetime();
/*  Future<void> getfreetime() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("prefsToken");
    final response =
    await http.get('http://35.198.219.154:1337/freetime/emp/${widget.project_id}/${widget.position_id}',
        headers: {'authorization': "Bearer "+token});
    String jsonString = response.body.toString();
    final jsonResponse = json.decode(jsonString);
    print(widget.project_id);
    print(widget.position_id);
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
  */
  void _showbusy() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("พนักงาน",style: TextStyle(fontSize: 20),),
          content: new Text("พนักงานคนนี้ไม่ว่างในเวลาที่เลือก"),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("ปิด"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }


  Future<dynamic> addteammember(position_id,project_id,emp_id,emp_startdate,emp_enddate) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String Token = prefs.getString("prefsToken");

    var url = 'http://35.198.219.154:1337/m/team/create';
    var body = {
      'position_id': position_id.toString(),
      'project_id':project_id.toString(),
      'emp_id':emp_id.toString(),
      'emp_start_date': emp_startdate.toString(),
      'emp_end_date':emp_enddate.toString()
    };
    http.Response response = await http.post(
        url,
        headers: {'authorization': "Bearer "+Token},
        body: body);
    print('statue = '+response.statusCode.toString());
    print(response.body);
   if (response.statusCode == 200){
     Navigator.of(context).pushReplacementNamed('/project');

   }
    final Map<String, dynamic> responseData = await json.decode(
        response.body);
  //  print(responseData);


    return responseData['code'];

  }
  Future <void> clearpref()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove("prefsToken");
    print("prefsToken");
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
        title: Text('ข้อมูลตำแหน่ง',style: TextStyle(color: Colors.white),),
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
                  ]: detailfreetime()
              )


          ),],
      )

    );
  }
  List<Widget> detailfreetime(){
    int status =0;
    List<Widget> mylist = new List();
    for(int i = 0; i < this.loopfreetimes; i++ ){
      void _showfree() {
        // flutter defined function
        showDialog(
          context: context,
          builder: (BuildContext context) {
            // return object of type Dialog
            return AlertDialog(
              title: new Text("เพิ่มสมาชิกทีม ",style: TextStyle(fontSize: 20),),
              content: new Text("ต้องการเพิ่ม ${widget.listfreetimes.data[i].empName} "),
              actions: <Widget>[
                // usually buttons at the bottom of the dialog
                new FlatButton(
                  child: new Text("ยืนยัน"),
                  onPressed: () {
                    addteammember(widget.position_id, widget.project_id, widget.listfreetimes.data[i].empId, widget.emp_startdate, widget.emp_enddate);
                  },
                ),
                new FlatButton(
                  child: new Text("ยกเลิก"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      }
      //Text('        '+widget.listfreetimes.data[i].freetime,style: TextStyle(fontSize: 12),)
      mylist.add(Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
      ListTile(title: Row(children: <Widget>[Icon(Icons.face),Text(' '+widget.listfreetimes.data[i].empName)],),
        subtitle: widget.listfreetimes.data[i].freetime == 'ไม่ว่าง' ?
        Text('        ไม่ว่าง',style: TextStyle(color: Colors.red,fontSize: 12),)
            :Text('        ว่าง',style: TextStyle(color: Colors.green,fontSize: 12),),
      onTap: (){
        if (widget.listfreetimes.data[i].freetime == 'ไม่ว่าง'){
          _showbusy();
        }
        else{
       _showfree();


        }
      },)

          ]
      )
      );
    }
    return mylist;
  }

}

/*\
ListView(
        children: <Widget>[
          Padding(padding: EdgeInsets.only(top: 10)),
          Text('    ตำแหน่ง '+widget.positionname,style: TextStyle(fontSize: 16),),
          Container(
            margin: EdgeInsets.all(5),height:screenHeight ,width: screenWidth,
            padding: EdgeInsets.all(16.0),
            child: Column(
                children: isTrue == 0 ? [
                  Text('Waiting Data'),
                ]:Text('dsfsdf') //: detailfreetime()
            )


        ),],
      )
 */