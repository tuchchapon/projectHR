import 'package:flutter/material.dart';
import 'addbenefit.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import './addempposition.dart';
import '../model/positionemp.dart';

class empposition extends StatefulWidget {
  @override
  _emppositionState createState() => new _emppositionState();
  int empid ;
  empposition({this.empid});
}

class _emppositionState extends State<empposition>  {
  int benefitIstrue =0;
  int loopemppo=0;
  @override
  void initState() {
    super.initState();

    getempposition();

  }

  Position listposition = new Position();

  Future<void> getempposition() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("prefsToken");
    print(widget.empid);
    final response =
    await http.get('http://35.198.219.154:1337/emp/position/${widget.empid}/view',
      headers: {'authorization': "Bearer "+token},);
    // print(response.body);
    String jsonString = response.body.toString();
    final jsonResponse = json.decode(jsonString);
    listposition = new Position.fromJson(jsonResponse);

    //print('emp id is'+widget.empid.toString());
    // print(response.body);
    setState(() {
      benefitIstrue = 1;
      this.loopemppo = listposition.data.length;
    });
    //  print(listfixcost.data[0].fixcostBranchId.id.toString());

    if (response.statusCode == 200) {

    } else {
      throw Exception('Failed to load post');
    }
  }
  Future<dynamic> deletebenefit(id) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String Token = prefs.getString("prefsToken");
    var url = 'http://35.198.219.154:1337/benefit/delete';
    var body = {
      'id': id,
    };
    http.Response response = await http.post(url,
        headers: {'authorization': "Bearer "+Token},
        body: body);
  }
  Future<dynamic> deleteposition(id) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String Token = prefs.getString("prefsToken");
    var url = 'http://35.198.219.154:1337/positionemp/delete';
    var body = {
      'id': id,
    };
    http.Response response = await http.post(url,
        headers: {'authorization': "Bearer "+Token},
        body: body);
    getempposition();
  }

  Widget build(BuildContext context) {
    Color buttoncolor = const Color(0xFF4fa2e1);
    Color colorappbar = const Color(0xFF2ac3fe);
    MediaQueryData queryData = MediaQuery.of(context);

    double screenWidth = queryData.size.width;
    double screenHeight = queryData.size.height*0.4;
    return new Scaffold(
        appBar: new AppBar(
            backgroundColor: colorappbar,
            title: new Text('ตำแหน่ง',style: TextStyle(color: Colors.brown[500]),),
            actions: <Widget>[
              new IconButton(icon: new Icon(Icons.search), onPressed: null),
              //      new IconButton(icon: new Icon(Icons.home), onPressed: () {Navigator.of(context).pushNamed('/Home');})
            ]
        ),

        body: ListView(
          children: <Widget>[
            Container(width: screenWidth,margin: EdgeInsets.all(5),
              child:  Column(children: <Widget>[
                Text('ข้อมูลตำแหน่ง'),
                Container(
                  width: screenWidth,height: screenHeight*2.1,
                  child:  benefitIstrue != 0 ?
                  ListView.builder(
                    itemCount: listposition.data.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                          child: detailempposition(id: listposition.data[index].id,
                            position_name: listposition.data[index].positionName,del: deleteposition,)
                      );
                      }
                  ):Text('ไม่มีข้อมูล')

                  ,padding: EdgeInsets.only(left: 10),)
              ],
              ),
            ),

          ],

        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: buttoncolor,
          onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => addempposition(empid: widget.empid,)
              ),
            );
          },
          child: Icon(Icons.add),)
    );
  }

}
class detailempposition extends StatelessWidget {
  //
  Future _showAlert(BuildContext context, String message) async {
    return showDialog(
        context: context,
        child: new AlertDialog(
          title: new Text(message),
          actions: <Widget>[
            new FlatButton(onPressed: (){del(id.toString()); Navigator.pop(context);}
                , child: new Text('ยืนยัน')
            ),
            new FlatButton(onPressed: () => Navigator.pop(context), child: new Text('ยกเลิก'))
          ],
        )

    );
  }

  int id;
  String position_name;
  Function del;

  detailempposition({this.position_name,this.id,this.del});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(position_name),

        trailing: IconButton(icon: Icon(Icons.delete),  onPressed: () {_showAlert(context, 'ต้องการลบ ${position_name} หรือไม่!');


    })

    );}

}
///
/*
trailing:  IconButton(
icon: Icon(Icons.edit),tooltip: 'แก้ไขสิทธิประโยชน์', onPressed: () {
Navigator.push(context,
MaterialPageRoute(
builder: (context) => editbenefit(empid: empid,benefitid: id,title: benefit_title,
price: benefit_price,note: benefit_note ,date: benefit_date,)
),);
},
),
*/
