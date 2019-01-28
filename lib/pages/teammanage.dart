import 'package:flutter/material.dart';

class teammanage extends StatefulWidget {
  @override
  _teammanageState createState() => _teammanageState();
}

class _teammanageState extends State<teammanage> {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('เพิ่มข้อมูล'),
      ),
      body: new Container(
        child: new Center(
          child: new ListView(
            children: <Widget>[
             ListTile(
                     leading: Text('สมาชิก'),
                     title: Text('Team A'),
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
          backgroundColor: Colors.orange,
          onPressed: (){Navigator.of(context).pushNamed('/addteammember');},
          child: Icon(Icons.add),)
    );
  }
}