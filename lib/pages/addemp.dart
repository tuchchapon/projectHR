import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../model/Branch.dart';

class addmember extends StatefulWidget {
  @override
  _addmemberState createState() => new _addmemberState();

}

class _addmemberState extends State<addmember> {
  int choiceloop;
  String _branch = 'กรุณาเลือกตำแหน่ง';
  int idbranch;
//
  Future<dynamic> Addemp(emp_name,emp_nickname,emp_salary,emp_address,
      emp_tel,emp_emer_contactname,emp_contact_relation,emp_emer_contact_address,
      emp_emer_contect_tel,branch_id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String Token = prefs.getString("prefsToken");
    var url = 'http://35.198.219.154:1337/emp/create';
    var body = {
      'emp_name': emp_name,
      'emp_nickname':emp_nickname,
      'emp_salary':emp_salary,
      'emp_address':emp_address,
      'emp_tel':emp_tel,
      'emp_emer_con_name':emp_emer_contactname,
      'emp_emer_con_relation':emp_contact_relation,
      'emp_emer_con_address':emp_emer_contact_address,
      'emp_emer_con_tel':emp_emer_contect_tel,
      'emp_branch_id':branch_id,

    };
    print(body);
    http.Response response = await http.post(
        url,
        headers: {'authorization': "Bearer "+Token},
        body: body);
    Navigator.of(context).pushReplacementNamed('/branch');
  }
//
  Future _askUser() async {

    await showDialog(
        context: context,
        child: new SimpleDialog(
          title: new Text('เลือกสาขา'),
          children: <Widget>[
            Container(
                child: Column( children: isTrue == 0 ? [
                  Text('Waiting Data'),
                ] : choicebranch()
                )
            ),

          ],
        )
    );
  }

  Branch listBranch = new Branch();
  int isTrue = 0;

  Future<void> getbranchdata() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("prefsToken");
    final response =
    await http.get('http://35.198.219.154:1337/branch/datatable',
      headers: {'authorization': "Bearer "+token},);
    // print(response.body);
    String jsonString = response.body.toString();
    final jsonResponse = json.decode(jsonString);
    // print(jsonResponse["data"]);

    listBranch = new Branch.fromJson(jsonResponse);
    print(listBranch.data.length);
    print(listBranch.data[0].id);
    print(listBranch.data[0].branchName);
    if (response.statusCode == 200) {
      //listBrabch = new Branch.fromJson(jsonResponse);
      setState(() {
        choiceloop = listBranch.data.length;
        this.isTrue = 1;
      });

    } else {

      throw Exception('Failed to load post');
    }
  }

  @override
  void initState() {
    super.initState();
    getbranchdata();
  }

  Widget build(BuildContext context) {
    MediaQueryData queryData = MediaQuery.of(context);

    double screenWidth = queryData.size.width;
    double screenHeight = queryData.size.height;
    screenHeight = screenHeight*0.9;
    screenWidth = screenWidth ;
    Color colorappbar = const Color(0xFF2ac3fe);

    return new Scaffold(
      appBar: new AppBar(backgroundColor: colorappbar,
        title: new Text('เพิ่มข้อมูล',style: TextStyle(color: Colors.brown[500]),),
      ),
      body: Container(
        height: screenHeight,
        width: screenWidth,
        padding: EdgeInsets.all(5),
        margin: EdgeInsets.all(5),
        child: Center(
          child: ListView(
              children: <Widget>[
                ListTile(
                  leading: Text('ข้อมูลส่วนตัว',style: TextStyle(fontSize: 20),),
                ),
                Divider(),
                ListTile(
                  leading: Text('ชื่อ-นามสกุล    \n',style: TextStyle(fontSize: 16),),
                  title: TextField(maxLength: 40,
                    decoration: InputDecoration.collapsed(
                        hintText: 'ป้อนชื่อนามสกุล'
                    ),
                  ),
                ),
                Divider(),
                ListTile(
                  leading: Text('ชื่อเล่น               \n',style: TextStyle(),),
                  title: TextField(maxLength: 40,
                    decoration: InputDecoration.collapsed(
                        hintText: 'ป้อนชื่อเล่น'
                    ),
                  onChanged: null,
                  ),
                ),
                Divider(),
                ListTile(
                  leading: Text('ที่อยู่                \n',style: TextStyle(fontSize: 16),),
                  title: TextField(maxLength: 50,
                    decoration: InputDecoration.collapsed(
                        hintText: 'ป้อนที่อยู่'
                    ),
                  ),
                ),
                Divider(),
                ListTile(
                  leading: Text('เบอร์ติดต่อ       \n',style: TextStyle(fontSize: 16),),
                  title: TextField(keyboardType: TextInputType.phone ,maxLength: 10,
                    decoration: InputDecoration.collapsed(
                        hintText: 'ป้อนเบอร์ติดต่อ'
                    ),
                  ),
                ),
                Divider(),
                ListTile(
                  leading: Text('เงินเดือน          \n',style: TextStyle(fontSize: 16),),
                  title: TextField(keyboardType: TextInputType.phone ,maxLength: 10,
                    decoration: InputDecoration.collapsed(
                        hintText: 'ป้อนเงินเดือน'
                    ),
                  ),
                ),
                Divider(),
                ListTile(
                  leading: new Text('สาขา      ',style: TextStyle(fontSize: 16),),
                  title: Text('${_branch}',style: TextStyle(fontSize: 14),),
                  trailing: new IconButton(icon: new Icon(Icons.list), onPressed: _askUser),
                ),
                Divider(),
                ListTile(
                  leading: Text('ข้อมูลผู้ติดต่อ',style: TextStyle(fontSize: 20),),),
                Divider(),
                ListTile(
                  leading: Text('ผู้ติดต่อฉุกเฉิน  \n'),
                  title: TextField(maxLength: 40,
                    decoration: InputDecoration.collapsed(
                        hintText: 'ป้อนผู้ติดต่อฉุกเฉิน'
                    ),
                  ),
                ),

                Divider(),
                ListTile(
                  leading: Text('ที่อยู่                \n'),
                  title: TextField(maxLength: 50,
                    decoration: InputDecoration.collapsed(
                        hintText: 'ป้อนที่อยู่'
                    ),
                  ),
                ),
          Divider(),
          ListTile(
            leading: Text('เกี่ยวข้องเป็น    \n'),
            title: TextField(maxLength: 20,
              decoration: InputDecoration.collapsed(
                  hintText: 'ป้อนสถานะ'
              ),
            ),//
          ),
                Divider(),
                ListTile(
                  leading: Text('เบอร์ติดต่อ       \n'),
                  title: TextField(maxLength: 10,keyboardType: TextInputType.phone,
                    decoration: InputDecoration.collapsed(
                        hintText: 'ป้อนเบอร์ติดต่อ'
                    ),
                  ),
                ),
                Divider(),


            /*    ListTile(
                  leading: Text('สิทธิประโยชน์'),
                  title: Container(
                    child: Column(
                      children: <Widget>[

                        new Row(children: <Widget>[
                          Checkbox(value: _value1, onChanged: _check),
                          Text('ฟิตเนส',style: TextStyle(fontSize: 12)),
                          Checkbox(value: _value2, onChanged: _check2),
                          Text('ค่าโทรศัพท์',style: TextStyle(fontSize: 12),
                          ),
                        ],
                        ),
                        new Row(
                          children: <Widget>[
                            Checkbox(value: _value3, onChanged: _check3),
                            Text('ค่าอาหารกลางวัน',style: TextStyle(fontSize: 12)),
                          ],
                        ),

                      ],
                    ),
                  ),
                ),

                                ListTile(
                  leading: new Text('สิทธิประโยชน์      ',style: TextStyle(fontSize: 16),),
                  trailing: new IconButton(icon: new Icon(Icons.list),
                      onPressed: (){Navigator.of(context).pushNamed('/addbenefit');},),
                ),*/
              //  Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 30)),
                RaisedButton(onPressed: null,
                  child: Text('บันทึก'),
                  color:(Colors.green),
                  textColor: (Colors.white),
                  padding: EdgeInsets.all(10),),
              ]
          ),


        ),
      ),

    );
  }
  List<Widget> choicebranch(){
    List<Widget> mylist = new List();
    for(int i = 0; i < this.choiceloop ; i++ ){
      mylist.add(Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            new SimpleDialogOption(child: new Text(listBranch.data[i].branchName),onPressed: ()
            {Navigator.pop(context);setState(() {_branch = listBranch.data[i].branchName;idbranch = listBranch.data[i].id;
            });},),
          ]
      )
      );
    }
    return mylist;
  }
}


/**
    String _position = 'กรุณาเลือกตำแหน่ง';
    void _setValue(String position) => setState(() => _position = position);
    Future _askUser() async {
    switch(
    await showDialog(
    context: context,
    child: new SimpleDialog(
    title: new Text('เลือกตำแหน่ง'),
    children: <Widget>[
    new SimpleDialogOption(child: new Text('Front-end'),onPressed: (){Navigator.pop(context, Answers.Frontend);},),
    new SimpleDialogOption(child: new Text('Back-end'),onPressed: (){Navigator.pop(context, Answers.Backend);},),
    new SimpleDialogOption(child: new Text('Mobiledev'),onPressed: (){Navigator.pop(context, Answers.Mobiledev);},),
    new SimpleDialogOption(child: new Text('design'),onPressed: (){Navigator.pop(context, Answers.design);},),
    ],
    )
    )
    ) {
    case Answers.Frontend:
    _setValue('Frontend');
    break;
    case Answers.Backend:
    _setValue('Backend');
    break;
    case Answers.Mobiledev:
    _setValue('Mobile-Dev');
    break;
    case Answers.design:
    _setValue('Design');
    break;
    }
    }
    new SimpleDialogOption(child: new Text(listBranch.data[0].branchName),onPressed: (){Navigator.pop(context, Answers.design);},),
*/