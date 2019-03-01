import 'package:flutter/material.dart';
import 'package:moment/moment.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:project/model/empfreetimes.dart';
import 'package:project/pages/empfreetimes.dart';

class updatesprint extends StatefulWidget {
  @override
  _updatesprintState createState() => _updatesprintState();
  int projectid;
 // int teamid;
  int positionid;
  String positionname;
  updatesprint({this.projectid,this.positionname,this.positionid});
}

class _updatesprintState extends State<updatesprint> {
  @override
  void initState() {
    super.initState();
    print(widget.projectid);
  startdate = DateTime.now().millisecondsSinceEpoch;
  enddate = DateTime.now().millisecondsSinceEpoch;
 // enddate =widget.enddate;

  }
  void _er403() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("เกิดข้อผิดพลาด !!",style: TextStyle(fontSize: 20),),
          content: new Text("โปรดเลือกระยะเวลาให้ถูกต้อง",style: TextStyle(fontSize: 12),),
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
  void _er402() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("เกิดข้อผิดพลาด !!",style: TextStyle(fontSize: 20),),
          content: new Text("โปรดเลือกวันที่ภายในระยะเวลาโปรเจ็ค"),
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

  int startdate ;
  int enddate ;

  //int startdate;
  //int enddate;
  Future<dynamic> setSprint(emp_startdate,emp_enddate,projectid) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String Token = prefs.getString("prefsToken");
    var url = 'http://35.198.219.154:1337/freetime/emp/${widget.projectid}/${widget.positionid}';
    var body = {
     // 'id': teamid,
      'emp_start_date': startdate.toString(),
      'emp_end_date': enddate.toString(),
      'position_id':widget.positionid.toString(),
      'project_id':widget.projectid.toString(),
    };
    http.Response response = await http.post(
        url,
        headers: {'authorization': "Bearer "+Token},
        body: body);
    final Map<String, dynamic> responseData = await json.decode(
        response.body);
    print(response.body);

    print('aaaaaaaa'+response.statusCode.toString());
    if (response.statusCode == 200) {
      Freetime listfreetime = Freetime.fromJson(responseData);
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => empfreetimes(positionname: widget.positionname,
              position_id: widget.positionid,project_id: widget.projectid,emp_enddate: enddate,emp_startdate: startdate,listfreetimes: listfreetime,),
          ),
        );
      setState(() {

      });
      print('AAAAAA');
    } else if (response.statusCode ==403){
     _er403();

    }
    else if(response.statusCode == 402){
      _er402();
      throw Exception('Failed to load post');
    }
    else{

    }
    return responseData['code'];

  }

  Future _startdate() async {
    DateTime picked = await showDatePicker(
      context: context,

      initialDate: new DateTime.now(),
      firstDate: new DateTime(2018),
      lastDate: new DateTime(2022),

    ) ;
    if(picked != null) {
      setState(() {
        startdate = picked.millisecondsSinceEpoch;
        print('startdate is ${startdate}');
      });
    };
  }
  Future _enddate() async {
    DateTime picked = await showDatePicker(
      context: context,

      initialDate: new DateTime.now(),
      firstDate: new DateTime(2018),
      lastDate: new DateTime(2022),

    ) ;

    if(picked != null) {


      setState(() {
        enddate = picked.millisecondsSinceEpoch;
        print('Time stamp is ${enddate}');
      });
    };
  }
  @override
  Widget build(BuildContext context) {

    Color colorappbar = const Color(0xFF2ac3fe);
    MediaQueryData queryData = MediaQuery.of(context);

    double screenWidth = queryData.size.width;
    double screenHeight = queryData.size.height;
    return new Scaffold(
      appBar: new AppBar(backgroundColor: colorappbar,
        title: new Text('กำหนดเวลาทำงาน',style: TextStyle(color: Colors.white),),
      ),

      body: new Container(
        width: screenWidth,height: screenHeight,margin: EdgeInsets.all(5),
        child: new Center(
            child: ListView(
              children: <Widget>[
                ListTile(
                  leading: Text('วันที่เริ่มงาน     '),
                  title: startdate == 0? Text(startdate.toString())
                      : Text(Moment(startdate).format("dd/MMM/yyyy")) ,
                  trailing: IconButton(icon:Icon(Icons.event), onPressed: _startdate),
                ),
                Divider(color: Colors.grey,),
                ListTile(
                  leading: Text('วันสิ้นสุด          '),
                  title: enddate == 0? Text(enddate.toString())
                  :Text(Moment(enddate).format("dd/MMM/yyyy")),
                  trailing: IconButton(icon:Icon(Icons.event), onPressed: _enddate),
                ),
                RaisedButton(
                  onPressed: (){
                   setSprint( startdate, enddate, widget.projectid);
        },

                  child: Text('บันทึก'),color:(Colors.green),textColor: (Colors.white),
                ),
              ],
            )
        ),
      ),
    );
  }
}
