import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:moment/moment.dart';
class addprojectaddit extends StatefulWidget {
  @override
  _addprojectadditState createState() => _addprojectadditState();
  int projectid;

  addprojectaddit({this.projectid});

}

class _addprojectadditState extends State<addprojectaddit> {
  String addit_title='';
  String addit_price='';
  var timestamp = DateTime.now().millisecondsSinceEpoch;
  Future _adddate() async {
    DateTime picked = await showDatePicker(
      context: context,

      initialDate: new DateTime.now(),
      firstDate: new DateTime(2018),
      lastDate: new DateTime(2022),

    );

    if(picked != null) {


      setState(() {
        timestamp = picked.millisecondsSinceEpoch;
      //  adddate = picked.toString();
        print('Time stamp is ${timestamp}');
      //  print(adddate);
      });
    };
  }
  void _showDialog() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("ผิดพลาด !"),
          content: new Text("กรุณากรอกข้อมูลให้ครบถ้วน"),
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

  Widget build(BuildContext context) {
    Color colorappbar = const Color(0xFF2ac3fe);
    MediaQueryData queryData = MediaQuery.of(context);

    double screenWidth = queryData.size.width;
    double screenHeight = queryData.size.height;
    return new Scaffold(
      appBar: new AppBar(backgroundColor: colorappbar,
        title: new Text('เพิ่มค่าใช้จ่ายอื่นๆ',style: TextStyle(color: Colors.white),),
      ),

      body: new Container(
        width: screenWidth,height: screenHeight,margin: EdgeInsets.all(5),
        child: new Center(
            child: ListView(
              children: <Widget>[

                ListTile(
                  leading: Text('รายการ   '),
                  title:            TextField(
                    decoration: InputDecoration.collapsed(
                      hintText: ('ป้อนรายการค่าใช้จ่าย'),
                    ),
                    onChanged: (String titleinput) {
                      addit_title = titleinput;
                      print(addit_title);

                    },
                  ),
                ),
                Divider(color: Colors.grey,),
                ListTile(
                  leading: Text('มูลค่า      '),
                  title:            TextField(
                    decoration: InputDecoration.collapsed(
                      hintText: ('ระบุมูลค่า'),
                    ),
                    onChanged: (String priceinput) {
                      addit_price = priceinput;
                      print(addit_price);

                    }, ),
                ),
                Divider(color: Colors.grey,),
                ListTile(
                  leading: Text('วันที่        '),
                  title: Text(Moment(timestamp).format("dd/MMM/yyyy")),
                  trailing: IconButton(icon:Icon(Icons.event), onPressed: _adddate),
                ),
                Divider(color: Colors.grey,),
                RaisedButton(
                  onPressed: (){
                    if(addit_title == ''|| addit_price == ''){
                  _showDialog();
                    }
                    else{
                      Addprojectaddit(addit_title, addit_price, timestamp.toString(), widget.projectid.toString());
                    }

                  },

                  child: Text('บันทึก'),color:(Colors.green),textColor: (Colors.white),
                ),
              ],
            )
        ),
      ),
    );
  }
  Future<dynamic> Addprojectaddit(title ,price,adddate,project_id ) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String Token = prefs.getString("prefsToken");

    print(title);
    var url = 'http://35.198.219.154:1337/projectaddit/create';
    var body = {
      'project_id': project_id,
      'project_addit_title': title,
      'project_addit_price': price,
      'project_addit_date' : adddate,

    };
    print('Body is ${body}');
    http.Response response = await http.post(
        url,
        headers: {'authorization': "Bearer "+Token},
        body: body);
    print(response);
    Navigator.of(context).pushNamed('/project');
    final Map<String, dynamic> responseData = await json.decode(
        response.body);
    print(responseData);
    return responseData['code'];

  }
}
