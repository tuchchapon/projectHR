import 'package:flutter/material.dart';
import 'addbenefit.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../model/empbenefit.dart';
import 'showbenefit.dart';
import 'editbenefit.dart';

class benefit extends StatefulWidget {
  @override
  _benefitState createState() => new _benefitState();
  int empid ;
  benefit({this.empid});
}

class _benefitState extends State<benefit>  {
 int benefitIstrue =0;
 int loopbenefit=0;
  @override
  void initState() {
    super.initState();

    getempbenefit();

  }

 Empbenefit listbenefit = new Empbenefit();
  Future<void> getempbenefit() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("prefsToken");
    print(widget.empid);
    final response =
    await http.get('http://35.198.219.154:1337/employee/benefit/${widget.empid}/view',
      headers: {'authorization': "Bearer "+token},);
    // print(response.body);
    String jsonString = response.body.toString();
    final jsonResponse = json.decode(jsonString);
    listbenefit = new Empbenefit.fromJson(jsonResponse);

    //print('emp id is'+widget.empid.toString());
   // print(response.body);
    setState(() {
      benefitIstrue = 1;
      this.loopbenefit = listbenefit.data.length;
      print(listbenefit.data[0].benefitEmpId);
    });
    //  print(listfixcost.data[0].fixcostBranchId.id.toString());

    if (response.statusCode == 200) {

    } else {
      throw Exception('Failed to load post');
    }
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
          title: new Text('สิทธิประโยชน์',style: TextStyle(color: Colors.brown[500]),),
          actions: <Widget>[
            new IconButton(icon: new Icon(Icons.search), onPressed: null),
        //      new IconButton(icon: new Icon(Icons.home), onPressed: () {Navigator.of(context).pushNamed('/Home');})
          ]
      ),

        body: ListView(
          children: <Widget>[
            Container(width: screenWidth,margin: EdgeInsets.all(5),
              child:  Column(children: <Widget>[
                Text('ข้อมูลสิทธิประโยชน์'),
                Container(
                  width: screenWidth,height: screenHeight*2.1,
                  child:  benefitIstrue != 0 ?
                  ListView.builder(
                    itemCount: listbenefit.data.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                          child: detailbenefit(empid: widget.empid,id: listbenefit.data[index].id,benefit_title:listbenefit.data[index].benefitTitle,
                          benefit_price: listbenefit.data[index].benefitPrice,
                            benefit_note: listbenefit.data[index].benefitNote,
                          benefit_date: listbenefit.data[index].benefitDate,)
                      );
                    },
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
                  builder: (context) => addbenefit(empid: widget.empid,)
              ),
            );
          },
          child: Icon(Icons.add),)
    );
  }

}
class detailbenefit extends StatelessWidget {
  //
  //Function del;
  int id;
  int empid;
  String benefit_title;
  int benefit_price;
  String benefit_note;
  int benefit_date;
  detailbenefit({this.empid,this.id,this.benefit_title,this.benefit_price,this.benefit_note,this.benefit_date});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(benefit_title),

    subtitle: Text(benefit_price.toString()),
    onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => showbenefit(benefitid: id,title: benefit_title,
              price: benefit_price,note: benefit_note ,date: benefit_date,),
          ),
        );
      },
    trailing:  IconButton(
      icon: Icon(Icons.edit),tooltip: 'แก้ไขสิทธิประโยชน์', onPressed: () {

    }
   /* {
      Navigator.push(context,
        MaterialPageRoute(
            builder: (context) => editbenefit(empid: empid,benefitid: id,title: benefit_title,
              price: benefit_price,note: benefit_note ,date: benefit_date,)
        ),);
    },*/
    )
      ,);
  }

}
