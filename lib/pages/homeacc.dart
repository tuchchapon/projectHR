import 'package:flutter/material.dart';

class homeacc extends StatefulWidget {
  @override
  _homeaccState createState() => _homeaccState();
}

class _homeaccState extends State<homeacc> {
  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData = MediaQuery.of(context);

    double screenWidth = queryData.size.width;
    double screenHeight = queryData.size.height;
    screenHeight = screenHeight;
    screenWidth = screenWidth ;
    /*SizedBox screen =  new SizedBox(
      width: screenWidth,
      height: screenHeight,
      child: new DecoratedBox(
        decoration: new BoxDecoration(color: Colors.red),
      ),
    );*/

    return  new Scaffold(

      appBar: new AppBar(
          title: new Text('หน้าหลัก'),
          actions: <Widget>[
            new IconButton(icon: new Icon(Icons.search), onPressed: null),
            //new IconButton(icon: new Icon(Icons.home), onPressed: () {Navigator.of(context).pushNamed('/Home');}

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
            /*    ListTile(
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
          width: screenWidth,
          height: screenHeight,
          margin: EdgeInsets.fromLTRB(15, 15, 15, 15),
          //padding: new EdgeInsets.all(32.0),
          child: new Center(
            child: new Column(
              children: <Widget>[
                new Text('account'),
              ],
            ),
          )
      ), floatingActionButton: FloatingActionButton(
      backgroundColor: Colors.orange,
      onPressed: null,
      tooltip: 'add',
      child: Icon(Icons.add),

    ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
  }