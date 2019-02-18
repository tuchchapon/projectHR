import 'package:flutter/material.dart';
import 'showbranch.dart';
import '../model/branchaddit.dart';
import '../model/fixcost.dart';
class cost extends StatefulWidget {
  @override
  _costState createState() => new _costState();
  int id;
  Branchfixcost listfixcost;
  Branchaddit listaddit;

  cost({this.id,this.listfixcost,this.listaddit});
}

class _costState extends State<cost>  {
  @override
  void initState() {
    super.initState();

    bid.text = widget.id.toString();

    print(widget.listfixcost.data[0].fixcostTitle);
    print(widget.listaddit.data[0].branchAdditTitle);
    loopfixcost = widget.listfixcost.data.length;
    loopaddit = widget.listaddit.data.length;
    print(loopfixcost);
  }

  Branchfixcost fixcostmanage = new Branchfixcost();
  int loopaddit = 0;
  int loopfixcost = 0;
  int fixisTrue = 1;
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
        Row(children: <Widget>[
          Text('   ค่าใช้จ่ายทั่วไป'),
          IconButton(icon: Icon(Icons.add), onPressed: null)
        ],),
        Container(
            margin: EdgeInsets.only(left: 5,right: 5),width: screenWidth,
            child: Column( children: fixisTrue == 0 ? [
              Text('Waiting Data'),
            ] : detailfixcost()
            )
        ),
        Row(children: <Widget>[
          Text('   ค่าใช้จ่ายอื่นๆ'),
          IconButton(icon: Icon(Icons.add), onPressed: null)
        ],),
        Container(
            margin: EdgeInsets.only(left: 5,right: 5),width: screenWidth,
            child: Column( children: fixisTrue == 0 ? [
              Text('Waiting Data'),
            ] : detailadddit()
            )
        ),
      ],),
    );
  }
  List<Widget> detailfixcost(){
    List<Widget> mylist = new List();
    for(int i = 0; i < this.loopfixcost ; i++ ){
      mylist.add(Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            ListTile(title: Text(widget.listfixcost.data[i].fixcostTitle,),
              subtitle: Text(widget.listfixcost.data[i].fixcostPrice.toString()+'\$'),
            )
          ]
      )
      );
    }
    return mylist;
  }
  List<Widget> detailadddit(){
    List<Widget> mylist = new List();
    for(int i = 0; i < this.loopaddit ; i++ ){
      mylist.add(Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
          ListTile(title:  Text(widget.listaddit.data[i].branchAdditTitle),
          subtitle: Text(widget.listaddit.data[i].branchAdditPrice.toString()+'\$'),)
          ]
      )
      );
    }
    return mylist;
  }
}
