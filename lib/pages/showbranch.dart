import 'package:flutter/material.dart';

class showbranch extends StatefulWidget {
  @override
  _showbranchState createState() => _showbranchState();
}

class _showbranchState extends State<showbranch> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('ข้อมูลสาขา'),
      ),
      body: new Container(
        //  padding: new EdgeInsets.all(10.0),
        child: new ListView(
          children: <Widget>[
            Padding(padding: EdgeInsets.all(8)),
         /*   ListTile(
              leading: CircleAvatar(child: Icon(Icons.store_mall_directory,size: 36,),radius: 30),
            ),*/
            ListTile(
              leading: Text('ชื่อสาขา',style: TextStyle(fontSize: 16),),
              title: Text('Twinsynergy BKK'),
            ),
            ListTile(
              leading: Text('ที่อยู่     ',style: TextStyle(fontSize: 16),),
              title: Text('ที่อยู่ พระราม 999 ซอย 4 เสรี 8 ',style: TextStyle(fontSize: 14)),
            ),
            ListTile(
              title: Text('รายการค่าใช้จ่ายของสาขา',style: TextStyle(fontSize: 16)),
              trailing: FlatButton(onPressed: (){Navigator.of(context).pushNamed('/cost');}, child: Text('จัดการค่าใช้จ่าย >'),color: Colors.lightBlue[50],),
              //subtitle: Text('จัดการค่าใช้จ่าย'),
            ),
            Text('  \n   ค่าใช้จ่ายทั่วไป\n',style: TextStyle(fontSize: 16)),
             ListTile(
                leading: Column(mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text('\nรายการ',style: TextStyle(fontSize: 16)),
                    Text('ค่าน้ำ'),
                    Text('ค่าเน็ต'),
                    Text('sdajasd'),
                    Padding(padding: EdgeInsets.all(10))
                  ],),
                trailing: Column(mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('มูลค่า',style: TextStyle(fontSize: 16),),
                    Text('50000'),
                    Text('50000'),
                    Text('30000'),
                  ],)
            ),
            Text('  \n   ค่าใช้จ่ายอื่นๆ\n',style: TextStyle(fontSize: 16),),
                ListTile(
                  leading: Column(mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text('\n รายการ',style: TextStyle(fontSize: 16)),
                      Text('ค่าโต๊ะ'),
                      Text('ค่าเน็ต'),
                      Text('sdajasd'),
                      Padding(padding: EdgeInsets.all(10))
                    ],),
                  trailing: Column(mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('มูลค่า',style: TextStyle(fontSize: 16)),
                      Text('50000'),
                      Text('50000'),
                      Text('30000'),
                    ],
                  ),
            ),
          ],
        ),
      ),
    );

  }
}
