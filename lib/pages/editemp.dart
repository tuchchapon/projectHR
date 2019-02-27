import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:project/model/Branch.dart';

class editemp extends StatefulWidget {
  @override
  _editemp createState() => new _editemp();
  int empid;
  String empname;
  String empnickname;
  String emp_salary;
  String emp_addrees;
  String emp_tel;
  String emp_conname;
  String emp_con_relation;
  String emp_con_address;
  String emp_con_tel;
  int branch_id;
  String branch_name;

  editemp({
    this.empid,
    this.empname,
    this.empnickname,
    this.emp_salary,
    this.emp_addrees,
    this.emp_tel,
    this.emp_conname,
    this.emp_con_relation,
    this.emp_con_address,
    this.emp_con_tel,
    this.branch_id,
    this.branch_name
  });
}

class _editemp extends State<editemp> {
  int choiceloop;
  int idbranch;
  void initState() {
    super.initState();
    print('++++++++++++++++');
    getbranchdata();
    empid.text = widget.empid.toString();
    namecon.text = widget.empname;
     nicknamecon.text = widget.empnickname;
     salarycon.text = widget.emp_salary;
     addresscon.text = widget.emp_addrees;
     telcon.text = widget.emp_tel;
     con_namecon.text = widget.emp_conname;
     con_relationcon.text = widget.emp_con_relation;
     con_addresscon.text = widget.emp_con_address;
     con_telcon.text = widget.emp_con_tel;
     branhcon.text =widget.branch_name;
     idbranch = widget.branch_id;
     print(idbranch.toString()+'dsgkijkdsfhjsdjfhhjsdgdh');

  }
  final empid = TextEditingController();
  final namecon = TextEditingController();
  final nicknamecon = TextEditingController();
  final salarycon = TextEditingController();
  final addresscon = TextEditingController();
  final telcon = TextEditingController();
  final con_namecon = TextEditingController();
  final con_relationcon = TextEditingController();
  final con_addresscon = TextEditingController();
  final con_telcon = TextEditingController();
  final branhcon = TextEditingController();

  //
  Future<dynamic> updateemp(emp_id,emp_name,emp_nickname,emp_salary,emp_address,
      emp_tel,emp_emer_contactname,emp_contact_relation,emp_emer_contact_address,
      emp_emer_contect_tel,branch_id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String Token = prefs.getString("prefsToken");
    var url = 'http://35.198.219.154:1337/emp/update';
    var body = {
      'id': emp_id.toString(),
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


  Widget build(BuildContext context) {
    MediaQueryData queryData = MediaQuery.of(context);

    double screenWidth = queryData.size.width;
    double screenHeight = queryData.size.height;
    screenHeight = screenHeight*0.9;
    screenWidth = screenWidth ;
    Color colorappbar = const Color(0xFF2ac3fe);

    return new Scaffold(
      appBar: new AppBar(backgroundColor: colorappbar,
        title: new Text('แก้ไขข้อมูล',style: TextStyle(color: Colors.white),),
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

                    },
                    controller: namecon,
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

                    },
                    controller: nicknamecon,
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

                    },
                    controller: addresscon,
                  ),
                ),
                Divider(),
                ListTile(
                  leading: Text('เบอร์ติดต่อ       \n',style: TextStyle(fontSize: 16),),
                  title: TextField(keyboardType: TextInputType.phone ,maxLength: 10,
                    decoration: InputDecoration.collapsed(
                        hintText: 'ป้อนเบอร์ติดต่อ'
                    ),
                    onChanged: (String emptel) {

                    },
                    controller: telcon,
                  ),
                ),
                Divider(),
                ListTile(
                  leading: Text('เงินเดือน          \n',style: TextStyle(fontSize: 16),),
                  title: TextField(keyboardType: TextInputType.phone ,
                    decoration: InputDecoration.collapsed(
                        hintText: 'ป้อนเงินเดือน'
                    ),
                    onChanged: (String salary) {

                    },
                    controller: salarycon,
                  ),
                ),
                Divider(),
                ListTile(
                  leading: new Text('สาขา      ',style: TextStyle(fontSize: 16),),
                  title: Text('${branhcon.text}',style: TextStyle(fontSize: 14),),
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

                    },
                    controller: con_namecon, ),
                ),

                Divider(),
                ListTile(
                  leading: Text('ที่อยู่                '),
                  title: TextField(autocorrect: false,
                    decoration: InputDecoration.collapsed(
                        hintText: 'ป้อนที่อยู่'
                    ),
                    onChanged: (String conadd) {

                    },
                    controller: con_addresscon,),
                ),
                Divider(),
                ListTile(
                  leading: Text('เกี่ยวข้องเป็น    '),
                  title: TextField(autocorrect: false,
                    decoration: InputDecoration.collapsed(
                        hintText: 'ป้อนสถานะ'
                    ),
                    onChanged: (String relation) {

                    },
                    controller: con_relationcon,),//
                ),
                Divider(),
                ListTile(
                  leading: Text('เบอร์ติดต่อ       \n'),
                  title: TextField(maxLength: 10,keyboardType: TextInputType.phone,
                    decoration: InputDecoration.collapsed(
                        hintText: 'ป้อนเบอร์ติดต่อ'
                    ),
                    onChanged: (String contel) {

                    },
                    controller: con_telcon,),
                ),
                Divider(),
                RaisedButton(
                  child: Text('บันทึก'),
                  color:(Colors.green),
                  textColor: (Colors.white),
                  padding: EdgeInsets.all(10),
                  onPressed: () {
                    updateemp(empid.text, namecon.text, nicknamecon.text, salarycon.text, addresscon.text,
                        telcon.text, con_namecon.text, con_relationcon.text,
                        con_addresscon.text, con_telcon.text, idbranch);
          print(empid.text);
           print(idbranch);Navigator.of(context).pop('/employee');
                  }),
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
            {Navigator.pop(context);setState(() {branhcon.text = listBranch.data[i].branchName;idbranch = listBranch.data[i].id;
            });},),
          ]
      )
      );
    }
    return mylist;
  }
}
