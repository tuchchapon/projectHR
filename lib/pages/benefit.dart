import 'package:flutter/material.dart';
import 'addbenefit.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'showbenefit.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:project/model/empbenefit.dart';

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
    });


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
     print(response.body);
  //  print(id.toString());
   getempbenefit();
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
          title: new Text('สิทธิประโยชน์',style: TextStyle(color: Colors.white,),),

      ),

        body: Container(width: screenWidth,margin: EdgeInsets.all(5),
              child:  Column(children: <Widget>[
                Text('ข้อมูลสิทธิประโยชน์',style: TextStyle(fontSize: 16),),
                Padding(padding: EdgeInsets.only(bottom: 10)),
                Row(mainAxisAlignment: MainAxisAlignment.center,children: <Widget>[Text('รวมค่าใช้จ่ายสิทธิประโยชน์ทั้งหมด '),
                Text(listbenefit.benafitTotal.toString(),style: TextStyle(color: Colors.green),),Text('  บาท')],),
                Container(
                  width: screenWidth,height: screenHeight*1.9,
                  child:  benefitIstrue != 0 ?
                  ListView.builder(
                    itemCount: listbenefit.data.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                          child: detailbenefit(
                            empid: widget.empid,id: listbenefit.data[index].id,benefit_title:listbenefit.data[index].benefitTitle,
                          benefit_price: listbenefit.data[index].benefitPrice,
                            benefit_note: listbenefit.data[index].benefitNote,
                          benefit_date: listbenefit.data[index].benefitDate,del: deletebenefit,)
                      );
                    },
                  ):Text('ไม่มีข้อมูล')

                  ,padding: EdgeInsets.only(left: 10),),

            ],
              ),

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
  Future _showAlert(BuildContext context, String message) async {
    return showDialog(
        context: context,
        child: new AlertDialog(
          title: new Text(message),
          actions: <Widget>[
            new FlatButton(onPressed: () {del(id.toString());Navigator.pop(context);
            Scaffold.of(context).showSnackBar(SnackBar(
              content: Text('ลบข้อมูลสำเร็จ'),
              duration: Duration(seconds: 3),
            ));}, child: new Text('ยืนยัน')
            ),
            new FlatButton(onPressed: () => Navigator.pop(context), child: new Text('ยกเลิก'))
          ],
        )

    );
  }
  //
  Function del;
  int id;
  int empid;
  String benefit_title;
  int benefit_price;
  String benefit_note;
  int benefit_date;
  detailbenefit({this.empid,this.id,this.benefit_title,this.benefit_price,this.benefit_note,this.benefit_date,this.del});
  @override
  Widget build(BuildContext context) {
   return Slidable(
      delegate: new SlidableDrawerDelegate(),
      actionExtentRatio: 0.23,
      child: new Container(
        child: new ListTile(
          title: Text(benefit_title),
          subtitle: Text(benefit_price.toString()),
        ),
      ),
      secondaryActions: <Widget>[
        new IconSlideAction(
            caption: 'ลบข้อมูล',
            color: Colors.red,
            icon: Icons.delete,
    onTap: () {
      _showAlert(context, 'ต้องการลบ ${benefit_title} หรือไม่!');

    }
    )
      ],
    );
   /*
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
trailing: IconButton(icon: Icon(Icons.delete,color: Colors.red,),  onPressed: () {_showAlert(context, 'ต้องการลบ ${benefit_title} หรือไม่!');

} ),
    );*/

  }

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
