import 'package:flutter/material.dart';

class member extends StatefulWidget {
  @override
  _memberState createState() => new _memberState();
}

class _memberState extends State<member>  {
Widget build(BuildContext context) {
  Color buttoncolor = const Color(0xFF4fa2e1);
  return new Scaffold(
    appBar: new AppBar(
        title: new Text('สมาชิก'),
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
              leading: CircleAvatar(child: Icon(Icons.image),radius: 16,),
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
      body: new Container(
          child: new Center(
            child: new ListView(
              children: <Widget>[
                ListTile(
                  leading: CircleAvatar(backgroundColor: Colors.grey,radius: 26,child: Icon(Icons.people),),
                  title: Text('นายธัชพล สุธรรมมา'),
                  subtitle:  Text('Mobile dev'),
                  onTap: () {Navigator.of(context).pushNamed('/showmember');},
                ),
                 new Padding(padding: EdgeInsets.only(top: 5.0)),
                ListTile(
                  leading: CircleAvatar(backgroundColor: Colors.grey,radius: 26,child: Icon(Icons.people),),
                  title: Text('นายธัชพล สุธรรมมา'),
                  subtitle:  Text('Mobile dev'),
                ),
                ListTile(
                  leading: CircleAvatar(backgroundColor: Colors.grey,radius: 26,child: Icon(Icons.people),),
                  title: Text('นายธัชพล สุธรรมมา'),
                  subtitle:  Text('Mobile dev'),
                ),
                ListTile(
                  leading: CircleAvatar(backgroundColor: Colors.grey,radius: 26,child: Icon(Icons.people),),
                  title: Text('นายธัชพล สุธรรมมา'),
                  subtitle:  Text('Mobile dev'),
                ),
                ListTile(
                  leading: CircleAvatar(backgroundColor: Colors.grey,radius: 26,child: Icon(Icons.people),),
                  title: Text('นายธัชพล สุธรรมมา'),
                  subtitle:  Text('Mobile dev'),
                ),
                ListTile(
                  leading: CircleAvatar(backgroundColor: Colors.grey,radius: 26,child: Icon(Icons.people),),
                  title: Text('นายธัชพล สุธรรมมา'),
                  subtitle:  Text('Mobile dev'),

                ),



              ],
            ),
          )
      ),

      floatingActionButton: FloatingActionButton(
  backgroundColor: buttoncolor,
      onPressed: (){Navigator.of(context).pushNamed('/addmember');},
    child: Icon(Icons.add),)

  );
}
}