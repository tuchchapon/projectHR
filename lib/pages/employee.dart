import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import '../model/employee.dart';
import './showemp.dart';

class member extends StatefulWidget {
  @override
  _memberState createState() => new _memberState();
}

class _memberState extends State<member>  {

  Employee listEmp = new Employee();
  int isTrue = 0;

  Future<void> getempdata() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("prefsToken");
    final response =
    await http.get('http://35.198.219.154:1337/emp/datatable',
      headers: {'authorization': "Bearer "+token},);
    //  print(response.body);
    String jsonString = response.body.toString();
    final jsonResponse = json.decode(jsonString);
    // print(jsonResponse["data"]);
    listEmp = new Employee.fromJson(jsonResponse);
    print('createdAt is'+listEmp.data[0].createdAt.toString());
    print('updatedAt is'+listEmp.data[0].updatedAt.toString());
    print('id is'+listEmp.data[0].id.toString());
    print('empSalary is'+listEmp.data[0].empSalary.toString());
    print('empName is'+listEmp.data[0].empName);

    if (response.statusCode == 200) {
      //listBrabch = new Branch.fromJson(jsonResponse);
      setState(() {
        this.isTrue = 1;
      });

     // print(listEmp.data[0].empName);
    } else {

      throw Exception('Failed to load post');
    }
  }
//
  @override
  void initState() {
    super.initState();
    getempdata();
  }
//
Widget build(BuildContext context) {
  Color buttoncolor = const Color(0xFF4fa2e1);
  Color colorappbar = const Color(0xFF2ac3fe);
  MediaQueryData queryData = MediaQuery.of(context);

  double screenWidth = queryData.size.width;
  double screenHeight = queryData.size.height*0.4;
  return new Scaffold(
    appBar: new AppBar(
      backgroundColor: colorappbar,
        title: new Text('พนักงาน',style: TextStyle(color: Colors.brown[500]),),
        actions: <Widget>[
          new IconButton(icon: new Icon(Icons.search), onPressed: null),
       //   new IconButton(icon: new Icon(Icons.home), onPressed: () {Navigator.of(context).pushNamed('/Home');})
        ]
    ),

      drawer: Drawer(
        child: Column(
          children: <Widget>[
            Container(width: screenWidth,height: screenHeight*0.6,
              color: colorappbar,
              child: Center(
                child: Column(mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[Padding(padding: EdgeInsets.only(top: 20,)),
                  CircleAvatar(child: Icon(Icons.image),radius: 30,backgroundColor: Colors.grey,),
                  Padding(padding: EdgeInsets.only(top: 20,left: 50)),
                  Text('admin',style: TextStyle(fontSize: 20),)
                  ],
                ),
              ),padding: EdgeInsets.only(right: 200,top: 10),
            ),
            //FlatButton(onPressed: (){Navigator.of(context).pushNamed('/member');}, child: new Text('asagasf') ),
            ListTile(
              leading: Icon(Icons.dashboard,color: Colors.black),
              title: Text('Dashboard'),
              onTap: (){Navigator.of(context).pushNamed('/Home');},
            ),
            ListTile(
              leading: Icon(Icons.assignment,color: Colors.black),
              title: Text('โปรเจค'),
              onTap:(){Navigator.of(context).pushNamed('/project');},
            ),
            ListTile(
              leading: Icon(Icons.people,color: Colors.black),
              title: Text('พนักงาน'),
              onTap: (){Navigator.of(context).pushNamed('/member');},
            ),
            ListTile(
              leading: Icon(Icons.account_balance,color: Colors.black),
              title: Text('สาขา'),
              onTap:(){Navigator.of(context).pushNamed('/branch');},
            ),
            ListTile(
              leading: Icon(Icons.work,color: Colors.black),
              title: Text('ตำแหน่ง'),
              onTap:(){Navigator.of(context).pushNamed('/position');},
            ),
            ListTile(
              leading: Icon(Icons.card_giftcard,color: Colors.black),
              title: Text('สิทธิประโยชน์'),
              onTap:(){Navigator.of(context).pushNamed('/benefit');},

            ),
          ],
        ),
      ),

      body: Container(
        width: screenWidth,height: screenHeight*2.1,color: Colors.white,
        child:  isTrue != 0 ?
        ListView.builder(
          itemCount: listEmp.data.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
                child: Detailemp(id: listEmp.data[index].id,empname: listEmp.data[index].empName,
                emptel: listEmp.data[index].empTel,emp_address: listEmp.data[index].empAddress,
                emp_salary: listEmp.data[index].empSalary,conname: listEmp.data[index].empEmerConName,
                contel: listEmp.data[index].empEmerConTel,con_address: listEmp.data[index].empEmerConAddress,
                empnickname: listEmp.data[index].empNickname,con_relation: listEmp.data[index].empEmerConRelation,)
            );
          },
        ):Text('Waiting'),
      ),

      floatingActionButton: FloatingActionButton(
  backgroundColor: buttoncolor,
      onPressed: (){Navigator.of(context).pushNamed('/addmember');},
    child: Icon(Icons.add),)

  );
}
}
class Detailemp extends StatelessWidget {
  //

  //Function del;
  int id;
  String empname;
  String empnickname;
  String emptel;
  String emp_address;
  int emp_salary;
  String conname;
  String con_relation;
  String contel;
  String con_address;
  Detailemp({
    this.id,
    this.empname,
    this.empnickname,
    this.emptel,
    this.emp_address,
    this.emp_salary,
    this.conname,
    this.con_relation,
    this.contel,
    this.con_address
  });
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(empname),
      subtitle: Stack(
        children: <Widget>[
          Container(
              child: Column(children: <Widget>[
            Row(children: <Widget>[
              Text('เบอร์ติดต่อ : '+emptel)
            ],),
            Row(children: <Widget>[
              Text('ที่อยู่ : '+emp_address)
            ],)
          ],
          )
          ,padding: EdgeInsets.only(bottom: 5),)
        ],
      ),//subtitle: Text(branchaddress),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => showemp(
              id: id,
              empname: empname,
              emptel: emptel,
              empnickname: empnickname,
              emp_address: emp_address,
              emp_salary: emp_salary,
              conname: conname,
              con_relation: con_relation,
              contel: contel,
              con_address: con_address,),
          ),
        );
      },
    );
  }

}

/*
class Detailemp extends StatelessWidget {
  //

  //Function del;
  int id;
  String empname;
  String emptel;
  String emp_address;

  Detailemp({this.id,this.empname,this.emptel,this.emp_address});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(empname),
      subtitle: Row(mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          IconButton(icon: Icon(Icons.edit),onPressed:() {
            Navigator.push(context,
              MaterialPageRoute(
                 // builder: (context) => editbranch(id: id,branchname: branch_name,branch_address: branchaddress,)
              ),
            );
          },
          )
          ,/*IconButton(icon: Icon(Icons.delete), onPressed: () => _showAlert(context, 'ต้องการลบ ${branch_name} หรือไม่!')
            // del(id.toString());++

          ),*/
        ],
      ),//subtitle: Text(branchaddress),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
          //  builder: (context) => showbranch(id: id,branch_name: branch_name,branchaddress: branchaddress,),
          ),
        );
      },
    );
  }

}

*/