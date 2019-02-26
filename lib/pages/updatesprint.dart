import 'package:flutter/material.dart';
import 'package:moment/moment.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class updatesprint extends StatefulWidget {
  @override
  _updatesprintState createState() => _updatesprintState();
  int teamid;
  int empid;
  var startdate;
  var enddate;
  updatesprint({this.teamid,this.enddate,this.startdate,this.empid});
}

class _updatesprintState extends State<updatesprint> {
  @override
  void initState() {
    super.initState();
    print(widget.teamid);
    print(widget.empid);
  //startdate = widget.startdate;
 // enddate =widget.enddate;

  }

  var startdate ;
  var enddate ;

  //int startdate;
  //int enddate;
  Future<dynamic> setSprint(id,startdate,enddate) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String Token = prefs.getString("prefsToken");
    var url = 'http://35.198.219.154:1337/team/update';
    var body = {
      'id': id,
      'emp_start_date': startdate,
      'emp_end_date': enddate,
    };
    http.Response response = await http.post(
        url,
        headers: {'authorization': "Bearer "+Token},
        body: body);
    final Map<String, dynamic> responseData = await json.decode(
        response.body);
    print(responseData);
    Navigator.of(context).pushReplacementNamed('/project');
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
        title: new Text('จัดการ sprint',style: TextStyle(color: Colors.white),),
      ),

      body: new Container(
        width: screenWidth,height: screenHeight,margin: EdgeInsets.all(5),
        child: new Center(
            child: ListView(
              children: <Widget>[
                ListTile(
                  leading: Text('วันที่        '),
                  title: startdate == 0? Text(startdate.toString())
                      : Text(Moment(startdate).format("dd/MMM/yyyy")) ,
                  trailing: IconButton(icon:Icon(Icons.event), onPressed: _startdate),
                ),
                Divider(color: Colors.grey,),
                ListTile(
                  leading: Text('วันที่        '),
                  title: enddate == 0? Text(enddate.toString())
                  :Text(Moment(enddate).format("dd/MMM/yyyy")),
                  trailing: IconButton(icon:Icon(Icons.event), onPressed: _enddate),
                ),
                RaisedButton(
                  onPressed: (){
                    setSprint(widget.teamid.toString(), startdate.toString(), enddate.toString());
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
