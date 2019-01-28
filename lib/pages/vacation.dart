import 'package:flutter/material.dart';

class vacation extends StatefulWidget {
  @override
  _vacationState createState() => new _vacationState();
}

class _vacationState extends State<vacation>  {

  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
          title: new Text('การลา'),
          actions: <Widget>[
            new IconButton(icon: new Icon(Icons.search), onPressed: null),
            new IconButton(icon: new Icon(Icons.home), onPressed: () {Navigator.of(context).pushNamed('/Home');})
          ]
      ),

        drawer: Drawer(
          child: Column(
            children: <Widget>[
              AppBar(
                automaticallyImplyLeading: false,
                title: Text('Menu'),
              ),
              //FlatButton(onPressed: (){Navigator.of(context).pushNamed('/member');}, child: new Text('asagasf') ),
              ListTile(
                leading: Icon(Icons.people,color: Colors.black),
                title: Text('พนักงาน'),
                onTap: (){Navigator.of(context).pushNamed('/member');},
              ),
              ListTile(
                leading: Icon(Icons.event,color: Colors.black),
                title: Text('การลา') ,
                onTap: (){Navigator.of(context).pushNamed('/vacation');},
              ),
              ListTile(
                leading: Icon(Icons.work,color: Colors.black),
                title: Text('ตำแหน่ง'),
                onTap:(){Navigator.of(context).pushNamed('/position');},
              ),
              ListTile(
                leading: Icon(Icons.account_balance,color: Colors.black),
                title: Text('สาขา'),
                onTap:(){Navigator.of(context).pushNamed('/branch');},
              ),
              ListTile(
                leading: Icon(Icons.assignment,color: Colors.black),
                title: Text('โปรเจค'),
                onTap:(){Navigator.of(context).pushNamed('/project');},
              ),
        /*      ListTile(
                leading: Icon(Icons.attach_money,color: Colors.black),
                title: Text('ค่าใช้จ่าย'),
                onTap:(){Navigator.of(context).pushNamed('/cost');},
              ),*/
              ListTile(
                leading: Icon(Icons.card_giftcard,color: Colors.black),
                title: Text('สิทธิประโยชน์'),
                onTap:(){Navigator.of(context).pushNamed('/benefit');},
              ),
            ],
          ),
        ),
        body: new Container(
            child: new Center(
              child: new ListView(
                children: <Widget>[
                  Padding(padding: EdgeInsets.all(5)),
                  Text('   ข้อมูลการลา',style: TextStyle(fontSize: 18),),
                  ListTile(
                    leading: Icon(Icons.event,color: Colors.black,size: 50),
                    title: Text('นายธัชพล สุธรรมมา'),
                    subtitle:  Text('ลาป่วย'),
                    onTap: () {Navigator.of(context).pushNamed('/showvacation');},
                  ),
                  new Padding(padding: EdgeInsets.only(top: 5.0)),
                  ListTile(
                    leading: Icon(Icons.event,color: Colors.black,size: 50),
                    title: Text('นายธัชพล สุธรรมมา'),
                    subtitle:  Text('ลาพักร้อน'),
                  ),
                  ListTile(
                    leading: Icon(Icons.event,color: Colors.black,size: 50),
                    title: Text('นายธัชพล สุธรรมมา'),
                    subtitle:  Text('ลาพักร้อน'),
                  ),
                  ListTile(
                    leading: Icon(Icons.event,color: Colors.black,size: 50),
                    title: Text('นายธัชพล สุธรรมมา'),
                    subtitle:  Text('ลาพักร้อน'),
                  ),
                  ListTile(
                    leading: Icon(Icons.event,color: Colors.black,size: 50,),
                    title: Text('นายธัชพล สุธรรมมา'),
                    subtitle:  Text('ลาพักร้อน'),
                  ),
                  ListTile(
                    leading: Icon(Icons.event,color: Colors.black,size: 50),
                    title: Text('นายธัชพล สุธรรมมา'),
                    subtitle:  Text('ลาพักร้อน'),

                  ),

                ],
              ),
            )
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.orange,
          onPressed: (){Navigator.of(context).pushNamed('/addvacation');},
          child: Icon(Icons.add),)
    );
  }
}