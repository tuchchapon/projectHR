import 'package:flutter/material.dart';

class showemp extends StatefulWidget {
  @override
  _showempState createState() => _showempState();

}

class _showempState extends State<showemp> {

  @override
  Widget build(BuildContext context) {
    Color colorappbar = const Color(0xFF2ac3fe);
    MediaQueryData queryData = MediaQuery.of(context);

    double screenWidth = queryData.size.width;
    double screenHeight = queryData.size.height;
    return new Scaffold(
      appBar: new AppBar(backgroundColor: colorappbar,
        title: new Text('ข้อมูลพนักงาน',style: TextStyle(color: Colors.brown[500]),),
      ),
      body: new Container(
        height: screenHeight,
        width: screenWidth,
        margin: EdgeInsets.all(5),
        //  padding: new EdgeInsets.all(10.0),
        child: new ListView(
          children: <Widget>[
            Padding(padding: EdgeInsets.all(6)),
            ListTile(
              leading: Text('ข้อมูลส่วนตัว',style: TextStyle(fontSize: 20),),
            ),
            ListTile(
              leading: Text('ชื่อ-นามสกุล   ',style: TextStyle(fontSize: 16),),
              title: Text('นายธัชพล สุธรรมมา',style: TextStyle(fontSize: 14),),
            ),
            ListTile(
              leading: Text('ที่อยู่               ',style: TextStyle(fontSize: 16),),
              title: Text('พระราม 999 60 ซอย 4 เสรี 8 แขวงสวนหลวง เขตสวนหลวง กรุงเทพ 10500',style: TextStyle(fontSize: 14),),
            ),
            ListTile(
              leading: Text('เบอร์โทร        ',style: TextStyle(fontSize: 16),),
              title: Text('088-888-1596',style: TextStyle(fontSize: 14),),
            ),
            ListTile(
              leading: Text('ตำแหน่ง       ',style: TextStyle(fontSize: 16),),
              title: Text('Mobile dev',style: TextStyle(fontSize: 14),),
            ),
            ListTile(
              leading: Text('ข้อมูลผู้ติดต่อ',style: TextStyle(fontSize: 20),),
            ),
            ListTile(
              leading: Text('ผู้ติดต่อฉุกเฉิน ',style: TextStyle(fontSize: 16),),
              title: Text('นางธัชพล สุธรรมมา',style: TextStyle(fontSize: 14),),
            ),
            ListTile(
              leading: Text('เบอร์ติดต่อ      ',style: TextStyle(fontSize: 16),),
              title: Text('088-048-5940',style: TextStyle(fontSize: 14),),
            ),
            ListTile(
              leading: Text('ที่อยู่               ',style: TextStyle(fontSize: 16),),
              title: Text('พระราม 999 60 ซอย 4 เสรี 8 แขวงสวนหลวง เขตสวนหลวง กรุงเทพ 10500',style: TextStyle(fontSize: 14),),
            ),
            Padding(padding: EdgeInsets.all(5)),
            Text('       สิทธิประโยชน์\n',style: TextStyle(fontSize: 16),),
            ListTile(
              leading: Column(mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                Text('รายการ'),
                Text('ค่าฟิตเนส',style: TextStyle(color: Colors.grey),),
                Text('ค่าฟิตเนส',style: TextStyle(color: Colors.grey),),
                Text('ค่าอาหาร',style: TextStyle(color: Colors.grey),),
              ],),
              trailing: Column(mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text('มูลค่า'),
                  Text('5000',style: TextStyle(color: Colors.grey),),
                  Text('5000',style: TextStyle(color: Colors.grey),),
                  Text('3000',style: TextStyle(color: Colors.grey),),
                ],
              ),
            ),
            ListTile(
              leading: Text('เงินเดือน         ',style: TextStyle(fontSize: 16),),
              title: Text('100000',style: TextStyle(fontSize: 14),),
            ),
            Padding(padding: EdgeInsets.all(20))
          ],
        ),
        ),
      );
  }
}
