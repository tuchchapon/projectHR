import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';



//
class editfixcost extends StatefulWidget {
  @override
  _editfixcostState createState() => new _editfixcostState();
  int bid;
  int id;
  String fixcost_title;
  int fixcost_price;
  String fixcost_note;
  editfixcost({this.bid,this.id,this.fixcost_title,this.fixcost_price,this.fixcost_note});



}

class _editfixcostState extends State<editfixcost> {



  @override
  void initState() {
    super.initState();
    print('++++++++++++++++');
    bidcon.text = widget.bid.toString();
    fixid.text = widget.id.toString();
    fixtitlecon.text = widget.fixcost_title;
    fixpricecon.text = widget.fixcost_price.toString();
    fixnotecon.text = widget.fixcost_note;
  }


  //String branchname;
  final bidcon = TextEditingController();
  final fixid = TextEditingController();
  final fixtitlecon = TextEditingController();
  final fixpricecon = TextEditingController();
  final fixnotecon = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text('แก้ไขข้อมูล'),
      ),
      body: new Container(
        margin: EdgeInsets.all(10),
        child: new Center(
          child: new ListView(
              children: <Widget>[
                ListTile(
                  leading: Text('รายการ'),
                  title: TextField(
                    //     controller: myController,
                    decoration: InputDecoration.collapsed(

                        hintText: fixtitlecon.text),
                    onChanged: (String value) {
                      //  myController.text = value;
                      // print('ID = ${}');
                    },
                    controller: fixtitlecon,
                  ),
                ),
                Divider() ,
                ListTile(
                  leading: Text('มูลค่า'),
                  title: TextField(
                    //     controller: myController,
                    decoration: InputDecoration.collapsed(

                        hintText: fixpricecon.text),
                    onChanged: (String value) {
                      //  myController.text = value;
                      // print('ID = ${}');
                    },
                    controller: fixpricecon,
                  ),
                ),
                //  Text(_position),
                //   new Text(_position),
                Divider(color: Colors.grey,),
                ListTile(
                  leading: Text('หมายเหตุ'),
                  title: TextField(
                    //     controller: myController,
                    decoration: InputDecoration.collapsed(

                        hintText: fixnotecon.text),
                    onChanged: (String value) {
                      //  myController.text = value;
                      // print('ID = ${}');
                    },
                    controller: fixnotecon,
                  ),
                ),
                //  Text(_position),
                //   new Text(_position),
                Divider(color: Colors.grey,),
                RaisedButton(onPressed: (){
                  Updatefixcost(bidcon.text,fixid.text, fixtitlecon.text, fixpricecon.text, fixnotecon.text);
                  Navigator.of(context).pop('/cost');
                },child: Text('บันทึก',style: TextStyle(color: Colors.white),),color: Colors.green,)
              ]
          ),
        ),
      ),
    );
  }
}

//

Future<dynamic> Updatefixcost(branchid,fixid,fixtitle,fixprice,fixnote) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String Token = prefs.getString("prefsToken");
  var url = 'http://35.198.219.154:1337/fixcost/update';
  var body = {
    'fixcost_branch_id': branchid,
    'id': fixid,
    'fixcost_title': fixtitle,
    'fixcost_price': fixprice,
    'fixcost_note': fixnote,

  };
  http.Response response = await http.post(
      url,
      headers: {'authorization': "Bearer "+Token},
      body: body);
  final Map<String, dynamic> responseData = await json.decode(
      response.body);
  print(responseData);
  //fetchPost();
  return responseData['code'];

}
//
/*

 */
//
String validateName(String value) {
  Pattern pattern =
      '[a-zA-Zก-ฮ1-9]';
  RegExp regex = new RegExp(pattern);
  if (value.length < 1) {
    return 'กรุณาป้อนตำแหน่ง';
  } else if (!regex.hasMatch(value)) {
    return 'รูปแบบไม่ถูกต้อง';
  }
  else
    return null;
}
