import 'package:flutter/material.dart';


class DrawerAPP extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData = MediaQuery.of(context);
    Color buttoncolor = const Color(0xFF4fa2e1);
    Color colorappbar = const Color(0xFF2ac3fe);
    double screenWidth = queryData.size.width;
    double screenHeight = queryData.size.height;

    Drawer(
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
          ListTile(
            leading: Icon(Icons.card_giftcard,color: Colors.black),
            title: Text('สิทธิประโยชน์'),
            onTap:(){Navigator.of(context).pushNamed('/benefit');},

          ),
        ],
      ),
    );
  }
}
