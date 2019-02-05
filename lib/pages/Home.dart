import 'package:flutter/material.dart';
import 'dart:async';
import 'addmember.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => new _HomeState();
}

class _HomeState extends State<Home>  {

  void _deleteAlert(BuildContext context, String message) async {
    return showDialog(
        context: context,
        child: new AlertDialog(
          title: new Text(message),
          actions: <Widget>[
            new FlatButton(onPressed: () => Navigator.pop(context), child: new Text('YES')),
            new FlatButton(onPressed: () => Navigator.pop(context), child: new Text('NO')),
          ],
        )

    );
  }
  void _addAlert(BuildContext context, String message) async {
    return showDialog(
        context: context,
        child: new AlertDialog(
          title: new Text(message),
          actions: <Widget>[
            new FlatButton(onPressed: () => Navigator.pop(context), child: new Text('YES')),
            new FlatButton(onPressed: () => Navigator.pop(context), child: new Text('NO')),
          ],
        )

    );
  }
  String _value = '';



  @override
  Widget build(BuildContext context) {
    Color buttoncolor = const Color(0xFF4fa2e1);
    Color colorappbar = const Color(0xFF2ac3fe);
    MediaQueryData queryData = MediaQuery.of(context);

    double screenWidth = queryData.size.width;
    double screenHeight = queryData.size.height;
    /*SizedBox screen =  new SizedBox(
      width: screenWidth,
      height: screenHeight,
      child: new DecoratedBox(
        decoration: new BoxDecoration(color: Colors.red),
      ),
    );*/

    return  new Scaffold(

      appBar: new AppBar(backgroundColor: colorappbar,
          title: new Text('หน้าหลัก'),
          actions: <Widget>[
            new IconButton(icon: new Icon(Icons.search), onPressed: null),
           //new IconButton(icon: new Icon(Icons.home), onPressed: () {Navigator.of(context).pushNamed('/Home');}

          ]
      ),

      drawer: Drawer(
        child: Column(
          children: <Widget>[
            Container(width: screenWidth,height: screenHeight*0.22,
              color: colorappbar,
              child: Center(
                child: Column(mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[Padding(padding: EdgeInsets.only(top: 20,)),
                  CircleAvatar(child: Icon(Icons.image),radius: 30,backgroundColor: Colors.grey,),
                  Padding(padding: EdgeInsets.only(top: 20,left: 50)),
                  Text('admin',style: TextStyle(fontSize: 20),)
                  ],
                ),
              ),padding: EdgeInsets.only(right: 200,top: 10),
            ),
            //FlatButton(onPressed: (){Navigator.of(context).pushNamed('/member');}, child: new Text('asagasf') ),
            ListTile(
              leading: Icon(Icons.dashboard,color: Colors.black),
              title: Text('Dashboard'),
              onTap: (){Navigator.of(context).pushNamed('/Home');},
            ),
            ListTile(
            leading: Icon(Icons.assignment,color: Colors.black),
            title: Text('โปรเจค'),
            onTap:(){Navigator.of(context).pushNamed('/project');},
          ),
            ListTile(
              leading: Icon(Icons.people,color: Colors.black),
              title: Text('พนักงาน'),
              onTap: (){Navigator.of(context).pushNamed('/member');},
            ),
            ListTile(
              leading: Icon(Icons.account_balance,color: Colors.black),
              title: Text('สาขา'),
              onTap:(){Navigator.of(context).pushNamed('/branch');},
            ),
            ListTile(
              leading: Icon(Icons.work,color: Colors.black),
              title: Text('ตำแหน่ง'),
              onTap:(){Navigator.of(context).pushNamed('/position');},
            ),
         /*   ListTile(
              leading: Icon(Icons.event,color: Colors.black),
              title: Text('การลา') ,
              onTap: (){Navigator.of(context).pushNamed('/vacation');},
            ),
            ListTile(
              leading: Icon(Icons.card_giftcard,color: Colors.black),
              title: Text('สิทธิประโยชน์'),
              onTap:(){Navigator.of(context).pushNamed('/benefit');},

            ),*/
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
                new Text('data'),
              ],
            ),
          )
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
