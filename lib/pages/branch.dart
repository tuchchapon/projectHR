import 'package:flutter/material.dart';

class branch extends StatefulWidget {
  @override
  _branchState createState() => new _branchState();
}

class _branchState extends State<branch>  {

  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
          title: new Text('สาขา'),
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
           /*   ListTile(
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
                  ListTile(
                        leading: Text('BANGKOK'),
                        title: Text('Twinsynergy BKK '),
                        subtitle: Text('ที่อยู่ พระราม 999 ซอย 4 เสรี 8 '),
                      onTap: (){Navigator.of(context).pushNamed('/showbranch');},
                  ),
                  Padding(padding: EdgeInsets.all(4)),
                  ListTile(
                    leading: Text('CHIANGMAI'),
                    title: Text('Twinsynergy CMX '),
                    subtitle: Text('ที่อยู่ พระราม 999 ซอย 4 เสรี 8'
                        'ที่อยู่ พระราม 999 ซอย 4 เสรี 8 '),

                      ),
                  Padding(padding: EdgeInsets.all(4)),
                 ListTile(
                   leading: Text('CHIANGRAI'),
                   title: Text('Twinsynergy CRI '),
                   subtitle: Text('ที่อยู่ พระราม 999 ซอย 4 เสรี 8'
                       'ที่อยู่ พระราม 999 ซอย 4 เสรี 8 '),
                 ),
                  Padding(padding: EdgeInsets.all(4)),
                ]

            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.orange,
          onPressed: (){Navigator.of(context).pushNamed('/addbranch');},
          child: Icon(Icons.add),)
    );
  }
}