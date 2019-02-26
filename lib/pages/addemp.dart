import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:project/model/Branch.dart';

class addemp extends StatefulWidget {
  @override
  _addempState createState() => new _addempState();

}

class _addempState extends State<addemp> {

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
  void _showDialogbranch() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("ผิดพลาด !"),
          content: new Text("กรุณาเลือกสาขา"),
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

  int choiceloop;
  String _branch = 'กรุณาเลือกสาขา';
  int idbranch ;
  String empname='';
  String empnickname='';
  String emp_salary = '';
  String emp_addrees= '';
  String emp_tel= '';
  String emp_conname ='';
  String emp_con_relation ='';
  String emp_con_address ='';
  String emp_con_tel ='';

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
      'emp_branch_id':branch_id.toString(),

    };
   // print(body);
    http.Response response = await http.post(
        url,
        headers: {'authorization': "Bearer "+Token},
        body: body);
   print(response.body);
   print(response.statusCode);
    Navigator.of(context).pushReplacementNamed('/employee');
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
    empname ='';
    empnickname='';
    emp_salary = '';
    emp_addrees= '';
    emp_tel= '';
    emp_conname ='';
    emp_con_relation ='';
    emp_con_address ='';
    emp_con_tel ='';
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
        title: new Text('เพิ่มข้อมูล',style: TextStyle(color: Colors.white),),
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
                  leading: Text('ชื่อ-นามสกุล    ',style: TextStyle(fontSize: 16),),
                  title: TextField(autocorrect: false,
                    decoration: InputDecoration.collapsed(
                        hintText: 'ป้อนชื่อนามสกุล'
                    ),
                    onChanged: (String empinput) {
                      empname  = empinput;
                      print(empname);
                    },
                  ),
                ),
                Divider(),
                ListTile(
                  leading: Text('ชื่อเล่น               ',style: TextStyle(),),
                  title: TextField(autocorrect: false,
                    decoration: InputDecoration.collapsed(
                        hintText: 'ป้อนชื่อเล่น'
                    ),
                    onChanged: (String nickname) {
                      empnickname  = nickname;
                      print(empnickname);
                    },
                  ),
                ),
                Divider(),
                ListTile(
                  leading: Text('ที่อยู่                ',style: TextStyle(fontSize: 16),),
                  title: TextField(autocorrect: false,
                    decoration: InputDecoration.collapsed(
                        hintText: 'ป้อนที่อยู่'
                    ),
                    onChanged: (String address) {
                      emp_addrees  = address;
                      print(emp_addrees);
                    },
                  ),
                ),
                Divider(),
                ListTile(
                  leading: Text('เบอร์ติดต่อ       ',style: TextStyle(fontSize: 16),),
                  title: TextField(keyboardType: TextInputType.phone ,maxLength: 10,
                    decoration: InputDecoration.collapsed(
                        hintText: 'ป้อนเบอร์ติดต่อ'
                    ),
                    onChanged: (String emptel) {
                      emp_tel  = emptel;
                      print(emp_tel);
                    },
                  ),
                ),
                Divider(),
                ListTile(
                  leading: Text('เงินเดือน          ',style: TextStyle(fontSize: 16),),
                  title: TextField(keyboardType: TextInputType.phone ,autocorrect: false,
                    decoration: InputDecoration.collapsed(
                        hintText: 'ป้อนเงินเดือน'
                    ),
                    onChanged: (String salary) {
                      emp_salary  = salary;
                      print(emp_salary);
                    },
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
                  leading: Text('ผู้ติดต่อฉุกเฉิน  '),
                  title: TextField(autocorrect: false,
                    decoration: InputDecoration.collapsed(
                        hintText: 'ป้อนผู้ติดต่อฉุกเฉิน'
                    ),
                    onChanged: (String conname) {
                      emp_conname  = conname;
                      print(emp_conname);
                    },
                  ),
                ),

                Divider(),
                ListTile(
                  leading: Text('ที่อยู่                '),
                  title: TextField(autocorrect: false,
                    decoration: InputDecoration.collapsed(
                        hintText: 'ป้อนที่อยู่'
                    ),
                    onChanged: (String conadd) {
                      emp_con_address  = conadd;
                      print(emp_con_address);
                    },
                  ),
                ),
          Divider(),
          ListTile(
            leading: Text('เกี่ยวข้องเป็น    '),
            title: TextField(autocorrect: false,
              decoration: InputDecoration.collapsed(
                  hintText: 'ป้อนสถานะ'
              ),
              onChanged: (String relation) {
                emp_con_relation  = relation;
                print(emp_con_relation);
              },
            ),//
          ),
                Divider(),
                ListTile(
                  leading: Text('เบอร์ติดต่อ       \n'),
                  title: TextField(maxLength: 10,keyboardType: TextInputType.phone,
                    decoration: InputDecoration.collapsed(
                        hintText: 'ป้อนเบอร์ติดต่อ'
                    ),
                    onChanged: (String contel) {
                      emp_con_tel  = contel;
                      print(emp_con_tel);
                    },
                  ),
                ),
                Divider(),
                RaisedButton(
                  child: Text('บันทึก'),
                  color:(Colors.green),
                  textColor: (Colors.white),
                  padding: EdgeInsets.all(10),
                  onPressed: (){
                  if(empname == '' || empnickname == ''|| emp_salary == '' || emp_addrees =='' || emp_tel == ''
                  || emp_conname == '' ||emp_con_relation == ''||emp_con_address ==''||emp_con_tel =='')
                  {_showDialog();}
                  else{
                    Addemp(empname,
                        empnickname,
                        emp_salary,
                        emp_addrees,
                        emp_tel,
                        emp_con_tel,
                        emp_con_relation,
                        emp_con_address,
                        emp_con_tel,
                        idbranch);}
                    },
                ),
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