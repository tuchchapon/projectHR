import 'package:flutter/material.dart';

class member extends StatefulWidget {
  @override
  _memberState createState() => new _memberState();
}

class _memberState extends State<member>  {
Widget build(BuildContext context) {
  Color buttoncolor = const Color(0xFF4fa2e1);
  Color colorappbar = const Color(0xFF2ac3fe);
  MediaQueryData queryData = MediaQuery.of(context);

  double screenWidth = queryData.size.width;
  double screenHeight = queryData.size.height;
  return new Scaffold(
    appBar: new AppBar(
      backgroundColor: colorappbar,
        title: new Text('พนักงาน',style: TextStyle(color: Colors.brown[500]),),
        actions: <Widget>[
          new IconButton(icon: new Icon(Icons.search), onPressed: null),
       //   new IconButton(icon: new Icon(Icons.home), onPressed: () {Navigator.of(context).pushNamed('/Home');})
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
            ListTile(
              leading: Icon(Icons.card_giftcard,color: Colors.black),
              title: Text('สิทธิประโยชน์'),
              onTap:(){Navigator.of(context).pushNamed('/benefit');},

            ),
          ],
        ),
      ),
      body: new Container(height: screenHeight,width: screenWidth,margin: EdgeInsets.all(5),
          child: new Center(
            child: new ListView(
              children: <Widget>[
                 new Padding(padding: EdgeInsets.only(top: 5.0)),
                ListTile(onTap: (){Navigator.of(context).pushNamed('/showmember');},
             //     leading: CircleAvatar(backgroundColor: Colors.grey,radius: 26,child: Icon(Icons.people),),
                  title: Text('นายธัชพล สุธรรมมา'),
                  subtitle:  Stack(
                    children: <Widget>[
                      Container(padding: EdgeInsets.all(8),
                        child: Column(
                          children: <Widget>[
                            Row(children: <Widget>[
                              Text('Front-end',style: TextStyle(color: Colors.green),),

                            ],
                            ),
                            Row(children: <Widget>[
                              Text('เบอร์ติดต่อ:  088-808-5084'),
                            ],),
                            Row(children: <Widget>[
                              Text('ที่อยู่: aiaosadjklasaiskasksdkasdkadk'),
                            ],)
                          ],
                       mainAxisAlignment: MainAxisAlignment.spaceAround, ),
                      ),
                    ],
                  )
                ),
                 ListTile(
                   //     leading: CircleAvatar(backgroundColor: Colors.grey,radius: 26,child: Icon(Icons.people),),
                     title: Text('นายธัชพล สุธรรมมา'),
                     subtitle:  Stack(
                       children: <Widget>[
                         Container(padding: EdgeInsets.all(8),
                           child: Column(
                             children: <Widget>[
                               Row(children: <Widget>[
                                 Text('Front-end',style: TextStyle(color: Colors.green),),

                               ],
                               ),
                               Row(children: <Widget>[
                                 Text('เบอร์ติดต่อ:  088-808-5084'),
                               ],),
                               Row(children: <Widget>[
                                 Text('ที่อยู่: aiaosadjklasaiskasksdkasdkadk'),
                               ],)
                             ],
                             mainAxisAlignment: MainAxisAlignment.spaceAround, ),
                         ),
                       ],
                     )
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