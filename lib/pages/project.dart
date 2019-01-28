import 'package:flutter/material.dart';

class project extends StatefulWidget {
  @override
  _projectState createState() => new _projectState();
}

class _projectState extends State<project>  {

  Widget build(BuildContext context) {
    String bkk ='twinsynergy BKK';
    return new Scaffold(
      appBar: new AppBar(
          title: new Text('โปรเจค'),
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
      /*        ListTile(
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
        body: Container(
          child: Center(
            child: ListView(
                children: <Widget>[
                  Padding(padding: EdgeInsets.all(10.0)),
                  Text('ข้อมูลโปรเจค: ${bkk}',style: TextStyle(fontSize: 16),),
                      ListTile(
                        leading: Icon(Icons.assignment,size: 50,color: Colors.black,),
                        title: Text('ระบบ HR'),
                        subtitle: Text('ระบบ HR'),
                        onTap: () {Navigator.of(context).pushNamed('/showproject');},
                      ),
                  ListTile(
                        leading: Icon(Icons.assignment,size: 50,color: Colors.black,),
                        title: Text('Front-End'),
                      )

                ]

            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.orange,
          onPressed: (){Navigator.of(context).pushNamed('/addproject');},
          child: Icon(Icons.add),)
    );
  }
}