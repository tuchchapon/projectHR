import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
class addbranch extends StatefulWidget {
  @override
  _addbranchState createState() => new _addbranchState();
}

class _addbranchState extends State<addbranch> {
void initState(){
  super.initState();
  branchname ='';
  branchad ='';
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
  Future<dynamic> AddBranch(branchName,branchAD) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String Token = prefs.getString("prefsToken");
    //  print(user);
    // print(pass);
    // print(password);
    var url = 'http://35.198.219.154:1337/branch/create';
    var body = {
      'branch_name': branchName,
      'branch_address':branchAD,
    };
    print(body);
    http.Response response = await http.post(
        url,
        headers: {'authorization': "Bearer "+Token},
        body: body);
    Navigator.of(context).pushReplacementNamed('/branch');
  }

  String branchname ;
  String branchad ;
  Widget build(BuildContext context) {
    Color colorappbar = const Color(0xFF2ac3fe);
    MediaQueryData queryData = MediaQuery.of(context);

    double screenWidth = queryData.size.width;
    double screenHeight = queryData.size.height;
    return new Scaffold(
      appBar: new AppBar(backgroundColor: colorappbar,
        title: new Text('เพิ่มข้อมูล',style: TextStyle(color: Colors.white),),
      ),

      body: new Container(height: screenHeight,width: screenWidth,
        margin: EdgeInsets.all(10),
        child: new Center(
          child: new ListView(
          children: <Widget>[
            Padding(padding: EdgeInsets.all(6)),
          /*  ListTile(
              leading: CircleAvatar(child: Icon(Icons.add_photo_alternate,size: 26.0,),radius: 30,),
            ),
            Divider(color: Colors.grey,),*/
            ListTile(
              leading: Text('ชื่อสาขา'),
                    title:TextField(
                      decoration: InputDecoration.collapsed(hintText: 'ป้อนชื่อสาขา'),
                      autocorrect: false,
                      onChanged: (String branchinput){
                        branchname  = branchinput;
                      },

                    )
                ),
            Divider(color: Colors.grey,),
            ListTile(
                leading: Text('ที่อยู่      '),
                title:TextField(
                  decoration: InputDecoration.collapsed(hintText: 'ป้อนที่อยู่'),
                  autocorrect: false,
                  onChanged: (String addressinput){
                    branchad  = addressinput;
                  },
                )
            ),
            Divider(color: Colors.grey,),
            RaisedButton(
              padding: EdgeInsets.only(right: 25),
              onPressed: (){
              if (branchname == '' || branchad == ''){
                _showDialog();
              }
              else{
                _showDialogsave();
              }
              },child: Text('บันทึก'),color:(Colors.green),textColor: (Colors.white),),
          ],
        ),
        ),
      ),

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
              AddBranch(branchname, branchad);

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