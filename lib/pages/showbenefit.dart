import 'package:flutter/material.dart';
import 'package:moment/moment.dart';
class showbenefit extends StatefulWidget {
  @override
  _showbenefitState createState() => _showbenefitState();
  int benefitid;
  String title;
  int price;
  int date;
  String note;
  showbenefit({this.title,this.price,this.note,this.benefitid,this.date});
}

class _showbenefitState extends State<showbenefit> {

  @override
  Widget build(BuildContext context) {
    Color colorappbar = const Color(0xFF2ac3fe);
    return new Scaffold(
      appBar: new AppBar(backgroundColor: colorappbar,
        title: new Text('ข้อมูลสิทธิประโยชน์',style: TextStyle(color: Colors.brown[500]),),
      ),
      body: new Container(
        //  padding: new EdgeInsets.all(10.0),
        child: new ListView(
          children: <Widget>[
            ListTile(
              leading: Text('รายการ    '),
              title: Text(widget.title),
            ),
            ListTile(
              leading: Text('มูลค่า       '),
              title: Text(widget.price.toString()),
            ),
            ListTile(
              leading: Text('วันที่       '),
              title: Text(Moment(widget.date).format('dd/MMM/yyyy') ,),
            ),
            ListTile(
              leading: Text('หมายเหตุ '),
              title: Text(widget.note),
            ),
          ],
        ),
      ),
    );

  }
}
