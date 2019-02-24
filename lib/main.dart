import 'package:flutter/material.dart';
import './pages/Home.dart';
import './pages/employee.dart';
import './pages/vacation.dart';
import './pages/position.dart';
import './pages/branch.dart';
import './pages/project.dart';
import './pages/cost.dart';
import './pages/benefit.dart';
import './pages/addemp.dart';
import './pages/addvacation.dart';
import './pages/addposition.dart';
import './pages/addbranch.dart';
import './pages/addproject.dart';
import './pages/addfixcost.dart';
import './pages/addcost.dart';
import './pages/addbenefit.dart';
import './pages/login.dart';
import './pages/showproject.dart';
import './pages/showemp.dart';
import './pages/showvacation.dart';
import './pages/showposition.dart';
import './pages/showbranch.dart';
import './pages/showfixcost.dart';
import './pages/showcost.dart';
import './pages/showbenefit.dart';
import './pages/costmanage.dart';
import './pages/teammanage.dart';
import './pages/memberstatus.dart';
import './pages/addteammember.dart';
import './pages/homeacc.dart';
import './pages/homehr.dart';
import './pages/homeuser.dart';
import './pages/editposition.dart';
import './pages/editbranch.dart';
import './pages/editproject.dart';
import './pages/addprojectaddit.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return new MaterialApp(
      title: 'Navigation',
      routes: <String, WidgetBuilder>{
        //All available pages
        '/Home': (BuildContext contrext) => new Home(),
       '/employee': (BuildContext contrext) => new employee(),
        '/vacation': (BuildContext contrext) => new vacation(),
        '/position': (BuildContext contrext) => new position(),
        '/branch': (BuildContext contrext) => new branch(),
        '/project': (BuildContext contrext) => new project(),
        '/cost': (BuildContext contrext) => new cost(),
        '/benefit': (BuildContext contrext) => new benefit(),
        '/addemp': (BuildContext contrext) => new addemp(),
        '/addvacation': (BuildContext contrext) => new addvacation(),
        '/addposition': (BuildContext contrext) => new addposition(),
        '/addbranch': (BuildContext contrext) => new addbranch(),
        '/addproject': (BuildContext contrext) => new addproject(),
        '/addfixcost': (BuildContext contrext) => new addfixcost(),
        '/addcost': (BuildContext contrext) => new addcost(),
        '/addbenefit': (BuildContext contrext) => new addbenefit(),
        '/login': (BuildContext contrext) => new login(),
        '/showproject': (BuildContext contrext) => new showproject(),
        '/showmember': (BuildContext contrext) => new showemp(),
        '/showvacation': (BuildContext contrext) => new showvacation(),
        '/showposition': (BuildContext contrext) => new showposition(),
        '/showbranch': (BuildContext contrext) => new showbranch(),
        '/showfixcost': (BuildContext contrext) => new showfixcost(),
        '/showcost': (BuildContext contrext) => new showcost(),
        '/showbenefit': (BuildContext contrext) => new showbenefit(),
        '/costmanage': (BuildContext contrext) => new costmanage(),
        '/teammanage': (BuildContext contrext) => new teammanage(),
        '/addteammember': (BuildContext contrext) => new addteammember(),
        '/memberstatus': (BuildContext contrext) => new memberstatus(),
        '/homeuser': (BuildContext contrext) => new homeuser(),
        '/homehr': (BuildContext contrext) => new homehr(),
        '/homeacc': (BuildContext contrext) => new homeacc(),
        '/editposition': (BuildContext contrext) => new editposition(),
        '/editbranch': (BuildContext contrext) => new editbranch(),
        '/editproject': (BuildContext contrext) => new editproject(),
        '/addprojectaddit': (BuildContext contrext) => new addprojectaddit(),
      },
      home: new login(), //first page displayed
      //   home: new Home(), //first page displayed
    );
  }
}