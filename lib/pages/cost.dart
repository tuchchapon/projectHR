import 'package:flutter/material.dart';
import 'showbranch.dart';
import '../model/branchaddit.dart';
import '../model/fixcost.dart';
import 'package:moment/moment.dart';
import 'addfixcost.dart';
import 'addcost.dart';
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
          IconButton(icon: Icon(Icons.add), onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => addfixcost(id: widget.id,)
              ),
            );
          },)
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
          IconButton(icon: Icon(Icons.add), onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => addcost(id: widget.id,)
              ),
            );
          })
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
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Detailfixcost(
                        id: widget.listfixcost.data[i].id,
                        fixcost_title: widget.listfixcost.data[i].fixcostTitle,
                      fixcost_price: widget.listfixcost.data[i].fixcostPrice,
                      fixcost_note: widget.listfixcost.data[i].fixcostNote.toString(),
                       )
                  ),
                );
              },
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
          subtitle: Text(widget.listaddit.data[i].branchAdditPrice.toString()+'\$'),
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Detailadditcost(id: widget.listaddit.data[i].id,
                      branch_addit_title: widget.listaddit.data[i].branchAdditTitle,
                    branch_addit_price: widget.listaddit.data[i].branchAdditPrice,
                      branch_addit_date: widget.listaddit.data[i].branchAdditDate,)
                ),
              );
            },
          )
          ]
      )
      );
    }
    return mylist;
  }

}
class Detailfixcost extends StatelessWidget {

  int id;
  String fixcost_title;
  int fixcost_price;
  String fixcost_note;
  Detailfixcost({this.id,this.fixcost_title,this.fixcost_price,this.fixcost_note,});


  Color colorappbar = const Color(0xFF2ac3fe);
//  final  Position position;
  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData = MediaQuery.of(context);

    double screenWidth = queryData.size.width;
    double screenHeight = queryData.size.height;

    return Scaffold(
      appBar: AppBar(backgroundColor: colorappbar,
        title: Text('ค่าใช้จ่ายทั่วไป',style: TextStyle(color: Colors.brown[500]),),
      ),
      body: Container(
          margin: EdgeInsets.all(5),height:screenHeight ,width: screenWidth,
          padding: EdgeInsets.all(5.0),
          child: Column(
            children: <Widget>[
              // Text('id  '+id.toString(),style: TextStyle(fontSize: 16),),

              ListTile(leading: Text('รายการ'),title: Text(fixcost_title),),
              ListTile(leading: Text('มูลค่า'),title: Text(fixcost_price.toString()),),
              ListTile(leading: Text('หมายเหตุ'),title: Text(fixcost_note),),
            ],
          )
      ),
    );
  }
}

class Detailadditcost extends StatelessWidget {

  int id;
  String branch_addit_title;
  int branch_addit_price;
  int branch_addit_date;

  Detailadditcost({this.id,this.branch_addit_title,this.branch_addit_price,this.branch_addit_date});


  Color colorappbar = const Color(0xFF2ac3fe);
//  final  Position position;
  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData = MediaQuery.of(context);

    double screenWidth = queryData.size.width;
    double screenHeight = queryData.size.height;

    return Scaffold(
      appBar: AppBar(backgroundColor: colorappbar,
        title: Text('ค่าใช้จ่ายเพิ่มเติม',style: TextStyle(color: Colors.brown[500]),),
      ),
      body: Container(
          margin: EdgeInsets.all(5),height:screenHeight ,width: screenWidth,
          padding: EdgeInsets.all(5.0),
          child: Column(
            children: <Widget>[
              // Text('id  '+id.toString(),style: TextStyle(fontSize: 16),),

              ListTile(leading: Text('รายการ'),title: Text(branch_addit_title),),
              ListTile(leading: Text('มูลค่า'),title: Text(branch_addit_price.toString()),),
              ListTile(leading: Text('วันทีทำรายการ'),title: Text(Moment(branch_addit_date).format('dd/MMM/yyyy'),),
              )],
          )
      ),
    );
  }
}