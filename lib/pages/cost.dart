import 'package:flutter/material.dart';
import 'showbranch.dart';
import '../model/branchaddit.dart';
import '../model/fixcost.dart';
class cost extends StatefulWidget {
  @override
  _costState createState() => new _costState();
  int id;
  List listfixcost;
  List listaddit;

  cost({this.id,this.listfixcost,this.listaddit});
}

class _costState extends State<cost>  {
  @override
  void initState() {
    super.initState();
    bid.text = widget.id.toString();
    Branchfixcost listfixcost = new Branchfixcost();
    print(widget.listfixcost);
  }

  final bid = TextEditingController();
 // final fixcostcon = TextEditingController();
  Widget build(BuildContext context) {
    Color colorappbar = const Color(0xFF2ac3fe);
    MediaQueryData queryData = MediaQuery.of(context);

    double screenWidth = queryData.size.width;
    double screenHeight = queryData.size.height;
    return new Scaffold(
      appBar: new AppBar(backgroundColor: colorappbar,
          title: new Text('ค่าใช้จ่าย',style: TextStyle(color: Colors.brown[500]),),
          actions: <Widget>[
            new IconButton(icon: new Icon(Icons.search), onPressed: null),
          //  new IconButton(icon: new Icon(Icons.home), onPressed: () {Navigator.of(context).pushNamed('/Home');})
          ]
      ),


      body: new ListView(children: <Widget>[
        Text('bid id'+bid.text),
        Container(width: screenWidth,height: screenHeight,
        ),
      ],),
    );
  }
}