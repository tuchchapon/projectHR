import 'package:flutter/material.dart';

class position extends StatefulWidget {
  @override
  _positionState createState() => new _positionState();
}

class _positionState extends State<position>  {

  Widget build(BuildContext context){
    Color buttoncolor = const Color(0xFF4fa2e1);
    Color colorappbar = const Color(0xFF2ac3fe);
    MediaQueryData queryData = MediaQuery.of(context);

    double screenWidth = queryData.size.width;
    double screenHeight = queryData.size.height;
    return new Scaffold(
      appBar: new AppBar(backgroundColor:Colors.lightBlue[300],
          title: new Text('ตำแหน่ง'),
          actions: <Widget>[
            new IconButton(icon: new Icon(Icons.search), onPressed: null),
            new IconButton(icon: new Icon(Icons.home), onPressed: () {Navigator.of(context).pushNamed('/Home');})
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
                           leading: Icon(Icons.work,size: 50,color: Colors.black,),
                        title: Text('Mobile-dev'),
                        onTap: (){Navigator.of(context).pushNamed('/showposition');},
                      ),
                Padding(padding: EdgeInsets.all(6)),
                ListTile(
                        leading: Icon(Icons.work,size: 50,color: Colors.black,),
                        title: Text('Front-End'),
                      ),
                  Padding(padding: EdgeInsets.all(6)),
                   ListTile(
                        leading: Icon(Icons.work,size: 50,color: Colors.black,),
                        title: Text('Front-End'),
                      )

                ]

            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: buttoncolor,
          onPressed: (){Navigator.of(context).pushNamed('/addposition');},
          child: Icon(Icons.add),)
    );
  }
}