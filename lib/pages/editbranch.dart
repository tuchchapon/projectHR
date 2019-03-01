import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';



//
class editbranch extends StatefulWidget {
  @override
  _editbranchState createState() => new _editbranchState();
  int id;
  String branchname;
  String branch_address;
  editbranch({this.id,this.branchname,this.branch_address});



}

class _editbranchState extends State<editbranch> {
  @override
  void initState() {
    super.initState();
    print('++++++++++++++++');
    branchAddcon.text = widget.branch_address;
    idcon.text = widget.id.toString();
    branchnamecon.text = widget.branchname;
  }

  Color colorappbar = const Color(0xFF2ac3fe);
  //String branchname;
  final branchnamecon = TextEditingController();
  final branchAddcon = TextEditingController();
  final idcon = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(backgroundColor: colorappbar,
        title: Text('แก้ไขข้อมูลสาขา'),
      ),
      body: new Container(
        margin: EdgeInsets.all(10),
        child: new Center(
          child: new ListView(
              children: <Widget>[
                ListTile(
                  leading: Text('ตำแหน่ง'),
                  title: TextField(
                    //     controller: myController,
                    decoration: InputDecoration.collapsed(

                        hintText: branchnamecon.text),
                    onChanged: (String value) {
                      //  myController.text = value;
                      // print('ID = ${}');
                    },
                    controller: branchnamecon,
                  ),
                ),
               Divider() ,
                ListTile(
                  leading: Text('ที่อยู่'),
                  title: TextField(
                    //     controller: myController,
                    decoration: InputDecoration.collapsed(

                        hintText: branchAddcon.text),
                    onChanged: (String value) {
                      //  myController.text = value;
                      // print('ID = ${}');
                    },
                    controller: branchAddcon,
                  ),
                ),
                //  Text(_position),
                //   new Text(_position),
                Divider(color: Colors.grey,),
                RaisedButton(onPressed: (){
              if(branchnamecon.text ==''|| branchAddcon.text ==''){
                _showDialog();
              }
                else{
                  _showDialogsave();
              }

                },child: Text('บันทึก',style: TextStyle(color: Colors.white),),color: Colors.green,)
              ]
          ),
        ),
      ),
    );
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
  void _showDialogsave() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("ต้องการบันทึกข้อมูลหรือไม่"),
          //   content: new Text("รูปแบบข้อมูลผิดพลาด"),
          actions: <Widget>[
            new FlatButton(
              child: new Text("ยืนยัน"),
              onPressed: () {
                Updatebranch(idcon.text, branchnamecon.text,branchAddcon.text);
                Navigator.of(context).pushReplacementNamed('/branch');

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
}

//

Future<dynamic> Updatebranch(id,branchname,branchAdd) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String Token = prefs.getString("prefsToken");
  var url = 'http://35.198.219.154:1337/branch/update';
  var body = {
    'id': id,
    'branch_name': branchname,
    'branch_address': branchAdd,

  };
  http.Response response = await http.post(
      url,
      headers: {'authorization': "Bearer "+Token},
      body: body);
  final Map<String, dynamic> responseData = await json.decode(
      response.body);
  print(responseData);

  return responseData['code'];

}
//
/*

 */
//
String validateName(String value) {
  Pattern pattern =
      '[a-zA-Zก-ฮ1-9]';
  RegExp regex = new RegExp(pattern);
  if (value.length < 1) {
    return 'กรุณาป้อนตำแหน่ง';
  } else if (!regex.hasMatch(value)) {
    return 'รูปแบบไม่ถูกต้อง';
  }
  else
    return null;
}
/*
int id;
String positionName;
Positiondetail({this.id,this.positionName,});


Color colorappbar = const Color(0xFF2ac3fe);
//  final  Position position;
String position;
@override
Widget build(BuildContext context) {
  MediaQueryData queryData = MediaQuery.of(context);

  double screenWidth = queryData.size.width;
  double screenHeight = queryData.size.height;

  return new Container(
    height: screenHeight,
    width: screenWidth,
    margin: EdgeInsets.all(10),
    child: new Center(
      child: new ListView(
          children: <Widget>[
            ListTile(
              leading: Text('ตำแหน่ง'),
              title: TextField(
                //     controller: myController,
                decoration: InputDecoration.collapsed(
                    hintText: 'ป้อนตำแหน่ง'),
                onChanged: (String value) {
                  position = value;
                  print(position);
                },
              ),
            ),
            //  Text(_position),
            //   new Text(_position),
            Divider(color: Colors.grey,),
            RaisedButton(onPressed: () {
              Updateposition(id, position);
              print(position);
            },
              child: Text('บันทึก', style: TextStyle(color: Colors.white),),
              color: Colors.green,)
          ]
      ),
    ),
  );
}
*/