import 'package:flutter/material.dart';

class teammanage extends StatefulWidget {
  @override
  _teammanageState createState() => _teammanageState();
}

class _teammanageState extends State<teammanage> {

  @override
  Widget build(BuildContext context) {
    Color buttoncolor = const Color(0xFF4fa2e1);
    Color colorappbar = const Color(0xFF2ac3fe);
    MediaQueryData queryData = MediaQuery.of(context);

    double screenWidth = queryData.size.width;
    double screenHeight = queryData.size.height;
    return new Scaffold(
      appBar: new AppBar(backgroundColor: colorappbar,
        title: new Text('เพิ่มข้อมูล',style: TextStyle(color: Colors.brown[500]),),
      ),
      body: new Container(height: screenHeight,width: screenWidth,margin: EdgeInsets.all(5),
        child: new Center(
          child: new ListView(
            children: <Widget>[
             ListTile(
                     leading: Text('สมาชิก'),
                     title: Text('Team A',style: TextStyle(color: Colors.blue),),
                  ),
                ListTile(
              leading: CircleAvatar(child: Icon(Icons.image,color: Colors.black,),radius: 24,backgroundColor: Colors.grey,),
                title: Text('นายธัชพล สุธรรมมา'),
                  subtitle: Text('Mobile dev'),
                  onTap: (){Navigator.of(context).pushNamed('/memberstatus');},
              ),ListTile(
                leading: CircleAvatar(child: Icon(Icons.image,color: Colors.black,),radius: 24,backgroundColor: Colors.grey,),
                title: Text('นายธัชพล สุธรรมมา '),
                subtitle: Text('Front-end'),
              ),ListTile(
                leading: CircleAvatar(child: Icon(Icons.image,color: Colors.black,),radius: 24,backgroundColor: Colors.grey,),
                title: Text('นายธัชพล สุธรรมมา '),
                subtitle: Text('back-end'),
              ),ListTile(
                leading: CircleAvatar(child: Icon(Icons.image,color: Colors.black,),radius: 24,backgroundColor: Colors.grey,),
                title: Text('นายธัชพล สุธรรมมา'),
              ),ListTile(
                leading: CircleAvatar(child: Icon(Icons.image,color: Colors.black,),radius: 24,backgroundColor: Colors.grey,),
                title: Text('นายธัชพล สุธรรมมา'),
              ),
            ],
          ),
        ),
      ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: buttoncolor,
          onPressed: (){Navigator.of(context).pushNamed('/addteammember');},
          child: Icon(Icons.add),)
    );
  }
}