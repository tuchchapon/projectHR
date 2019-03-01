import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DrawerAPP extends StatelessWidget {

  @override
  void cleartoken() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove("prefsToken");
  }

  Widget build(BuildContext context) {
    MediaQueryData queryData = MediaQuery.of(context);
    Color buttoncolor = const Color(0xFF4fa2e1);
    Color colorappbar = const Color(0xFF2ac3fe);
    double screenWidth = queryData.size.width;
    double screenHeight = queryData.size.height;


    Drawer(
      child: Column(
        children: <Widget>[
          Container(width: screenWidth,height: screenHeight*0.6,
            color: colorappbar,
            child: Center(
              child: Column(mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Stack(children: <Widget>[
                    Padding(padding: EdgeInsets.only(top: 10)),
                    Container(child:  CircleAvatar(child: Image(image: AssetImage('pic/logo.png'),fit: BoxFit.cover,),radius: 40,backgroundColor: Colors.transparent,),),
                  ],),
                  Padding(padding: EdgeInsets.only(left: 50)),
                  Text('Admin',style: TextStyle(fontSize: 20),),

                ],
              ),
            )
            ,padding: EdgeInsets.only(right: 200,top: 10),
          ),

          //FlatButton(onPressed: (){Navigator.of(context).pushNamed('/member');}, child: new Text('asagasf') ),
          ListTile(
            leading: Icon(Icons.dashboard,color: Colors.blue),
            title: Text('Dashboard'),
            onTap: (){Navigator.of(context).pushNamed('/Home');},
          ),
          ListTile(
            leading: Icon(Icons.assignment,color: Colors.blue),
            title: Text('โปรเจค'),
            onTap:(){Navigator.of(context).pushNamed('/project');},
          ),
          ListTile(
            leading: Icon(Icons.people,color: Colors.blue),
            title: Text('พนักงาน'),
            onTap: (){Navigator.of(context).pushNamed('/employee');},
          ),
          ListTile(
            leading: Icon(Icons.account_balance,color: Colors.blue),
            title: Text('สาขา'),
            onTap:(){Navigator.of(context).pushNamed('/branch');},
          ),
          ListTile(
            leading: Icon(Icons.work,color: Colors.blue),
            title: Text('ตำแหน่ง'),
            onTap:(){Navigator.of(context).pushNamed('/position');},
          ),
          Divider(height: 0.2,),
          Container(
              child:
              Column(mainAxisAlignment: MainAxisAlignment.end,children: <Widget>[
                ListTile(
                  leading: Icon(Icons.close
                      ,color: Colors.red),
                  title: Text('ออกจากระบบ'),
                  onTap: (){

                    Navigator.of(context).pushReplacementNamed('/login');
                    cleartoken();
                  },
                ),
              ],)
          ),

          Divider(height: 0.2,)
          /*           ListTile(
              leading: Icon(Icons.card_giftcard,color: Colors.black),
              title: Text('สิทธิประโยชน์'),
              onTap:(){Navigator.of(context).pushNamed('/benefit');},

            ),*/
        ],
      ),
    );
  }
}
