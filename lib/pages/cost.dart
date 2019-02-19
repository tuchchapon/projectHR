import 'package:flutter/material.dart';
import '../model/branchaddit.dart';
import '../model/fixcost.dart';
import 'package:moment/moment.dart';
import 'addfixcost.dart';
import 'addcost.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'editfixcost.dart';
import 'editbrannaddit.dart';
class cost extends StatefulWidget {
  @override
  _costState createState() => new _costState();
  int id;
  Branchfixcost listfixcost;
  Branchaddit listaddit;

  cost({this.id,this.listfixcost,this.listaddit});
}

class _costState extends State<cost>  {

//
  Future<dynamic> deletefix(id) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String Token = prefs.getString("prefsToken");
    var url = 'http://35.198.219.154:1337/fixcost/delete';
    var body = {
    //  'id': id,
    };
    print(id.toString());
    http.Response response = await http.post(url,
        headers: {'authorization': "Bearer "+Token},
        body: body);
    //  print(response.body);
  }
//
  Future<dynamic> deleteaddit(id) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String Token = prefs.getString("prefsToken");
    var url = 'http://35.198.219.154:1337/branchaddit/delete';
    var body = {
     // 'id': id,
    };
    print(id.toString());
    http.Response response = await http.post(url,
        headers: {'authorization': "Bearer "+Token},
        body: body);
    //  print(response.body);
  }
//
  @override
  void initState() {
    super.initState();
    bid.text = widget.id.toString();
    loopfixcost = widget.listfixcost.data.length;
    loopaddit = widget.listaddit.data.length;
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

    Future _showAlert(BuildContext context, String message) async {
      return showDialog(
          context: context,
          child: new AlertDialog(
            title: new Text(message),
            actions: <Widget>[
              new FlatButton(onPressed: (){deletefix(widget.listfixcost.data[loopfixcost].id.toString());}
                  , child: new Text('ยืนยัน')
              ),
              new FlatButton(onPressed: () => Navigator.pop(context), child: new Text('ยกเลิก'))
            ],
          )

      );
    }

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
              trailing: IconButton(icon: Icon(Icons.edit), onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => editfixcost(bid: widget.id,
                        id: widget.listfixcost.data[i].id,
                        fixcost_title: widget.listfixcost.data[i].fixcostTitle,
                      fixcost_price: widget.listfixcost.data[i].fixcostPrice,
                      fixcost_note: widget.listfixcost.data[i].fixcostNote,)
                  ),
                );
              },
              ),
           // trailing: IconButton(icon: Icon(Icons.delete), onPressed: () => _showAlert(context, 'ต้องการลบ ${widget.listfixcost.data[i].fixcostTitle} หรือไม่!'),)
            )
          ]
      )
      );
    }
    //() => _showAlert(context, 'ต้องการลบ ${branch_name} หรือไม่!')
    return mylist;
  }
  List<Widget> detailadddit(){

    Future _showAlert(BuildContext context, String message) async {
      return showDialog(
          context: context,
          child: new AlertDialog(
            title: new Text(message),
            actions: <Widget>[
              new FlatButton(onPressed: (){deleteaddit(widget.listaddit.data[widget.id].id.toString());}
                  , child: new Text('ยืนยัน')
              ),
              new FlatButton(onPressed: () => Navigator.pop(context), child: new Text('ยกเลิก'))
            ],
          )

      );

    }
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
           //   trailing: FlatButton(onPressed: null, child: Icon(Icons.edit))
         // trailing: FlatButton(onPressed: () => (deleteaddit(widget.listaddit.data[i].id)), child: Icon(Icons.delete)),
            trailing: IconButton(icon: Icon(Icons.edit), onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => editbranchaddit(bid: widget.id,id:widget.listaddit.data[i].id,
                    branch_addit_title: widget.listaddit.data[i].branchAdditTitle,
                    branch_addit_price: widget.listaddit.data[i].branchAdditPrice,
                    branch_addit_date: widget.listaddit.data[i].branchAdditDate,)
                ),
              );
            },),
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
//Row(mainAxisAlignment: MainAxisAlignment.end ,
//              children: <Widget>[
//          IconButton(icon: Icon(Icons.edit), onPressed: null),
//          IconButton(icon: Icon(Icons.delete), onPressed: () => _showAlert(context, 'ต้องการลบ ${widget.listfixcost.data[i].fixcostTitle} หรือไม่!'),
//          )
//              ],)