import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:moment/moment.dart';



//
class editbranchaddit extends StatefulWidget {
  @override
  _editbranchadditState createState() => new _editbranchadditState();
  int bid;
  int id;
  String branch_addit_title;
  var branch_addit_price;
  int branch_addit_date;
  editbranchaddit({this.bid,this.id,this.branch_addit_title,this.branch_addit_price,this.branch_addit_date});



}

class _editbranchadditState extends State<editbranchaddit> {


  Future _adddate() async {
    DateTime picked = await showDatePicker(
      context: context,

      initialDate: new DateTime.now(),
      firstDate: new DateTime(2018),
      lastDate: new DateTime(2022),

    ) ;

    if(picked != null) {


      setState(() {
        widget.branch_addit_date = picked.millisecondsSinceEpoch;
        print('Time stamp is ${widget.branch_addit_date}');
       // print(adddate);
      });
    };
  }

  @override
  void initState() {
    super.initState();
    print('++++++++++++++++');
    bidcon.text = widget.bid.toString();
    additidcon.text = widget.id.toString();
    addit_titlecon.text = widget.branch_addit_title;
    addit_pricecon.text = widget.branch_addit_price.toString();
 //   addit_datecon.text = widget.branch_addit_date.toString();
    print('id = '+bidcon.text);
    print('additidcon = '+additidcon.text);
    print('addit_titlecon = '+addit_titlecon.text);
    print('addit_pricecon = '+addit_pricecon.text);
    print('addit_datecon = '+addit_datecon.text);
  }


  //String branchname;
  final bidcon = TextEditingController();
  final additidcon = TextEditingController();
  final addit_titlecon = TextEditingController();
  final addit_pricecon = TextEditingController();
  final addit_datecon = TextEditingController();

  Color colorappbar = const Color(0xFF2ac3fe);
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: new AppBar(backgroundColor: colorappbar,
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

                        hintText: addit_titlecon.text),
                    onChanged: (String value) {
                      //  myController.text = value;
                      // print('ID = ${}');
                    },
                    controller: addit_titlecon,
                  ),
                ),
                Divider() ,
                ListTile(
                  leading: Text('มูลค่า'),
                  title: TextField(
                    //     controller: myController,
                    decoration: InputDecoration.collapsed(

                        hintText: addit_pricecon.text),
                    onChanged: (String value) {
                      //  myController.text = value;
                      // print('ID = ${}');
                    },
                    controller: addit_pricecon,
                  ),
                ),
                //  Text(_position),
                //   new Text(_position),
                Divider(color: Colors.grey,),
                ListTile(
                  leading: Text('วันที่        '),
                  title: Text(Moment(widget.branch_addit_date).format("dd/MMM/yyyy")),
                  trailing: IconButton(icon:Icon(Icons.event), onPressed: _adddate),
                ),
                //  Text(_position),
                //   new Text(_position),
                Divider(color: Colors.grey,),
                RaisedButton(onPressed: (){
                // Updatebranchaddit(bidcon.text,additidcon.text, addit_titlecon.text,
                 //     addit_pricecon.text, widget.branch_addit_date);
                 Updatebranchaddit(bidcon.text, widget.id, addit_titlecon.text, addit_pricecon.text, widget.branch_addit_date);
                  print('bid is'+bidcon.text);
                  print('additidcon is'+additidcon.text);
                  print('addit_titlecon is'+addit_titlecon.text);
                  print('addit_pricecon is'+addit_pricecon.text);
                  print('addit_datecon is'+widget.branch_addit_date.toString());
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

Future<dynamic> Updatebranchaddit(branchid,addit_id,addit_title,addit_price,addit_date) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String Token = prefs.getString("prefsToken");
  var url = 'http://35.198.219.154:1337/branchaddit/update';
  var body = {
    'branch_addit_branch_id': branchid.toString(),
    'id': addit_id.toString(),
    'branch_addit_title': addit_title,
    'branch_addit_price': addit_price.toString(),
    'branch_addit_date': addit_date.toString(),

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
