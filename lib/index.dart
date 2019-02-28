import 'package:flutter/material.dart';
import 'dart:async';
//import './pages/employee.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => new _HomeState();
}

class _HomeState extends State<Home>  {


  Future _showAlert(BuildContext context, String message) async {
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


  String _value = 'ehrtherwg';

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
          title: new Text('หน้าหลัก'),
          actions: <Widget>[
            new IconButton(icon: new Icon(Icons.search), onPressed: null),
            new IconButton(icon: new Icon(Icons.home), onPressed: () {Navigator.of(context).pushNamed('/Home');}
            ),
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
              title: Text('พนักงาน') ,
              onTap: (){Navigator.of(context).pushNamed('/member');},
            ),
            ListTile(
              title: Text('การลา') ,
              onTap: (){Navigator.of(context).pushNamed('/vacation');},
            ),
            ListTile(
              title: Text('ตำแหน่ง'),
              onTap:(){Navigator.of(context).pushNamed('/position');},
            ),
            ListTile(
              title: Text('สาขา'),
              onTap:(){Navigator.of(context).pushNamed('/branch');},
            ),
            ListTile(
              title: Text('โปรเจค'),
              onTap:(){Navigator.of(context).pushNamed('/project');},
            ),
            ListTile(
              title: Text('ค่าใช้จ่าย'),
              onTap:(){Navigator.of(context).pushNamed('/cost');},
            ),
            ListTile(
              title: Text('สิทธิประโยชน์'),
              onTap:(){Navigator.of(context).pushNamed('/benefit');},
            ),
          ],
        ),
      ),

      body: new Container(
        //padding: new EdgeInsets.all(32.0),
          child: new Center(
            child: new Column(
              children: <Widget>[
                Card(child: Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset('/Users/tuchchapon/AndroidStudioProjects/project/pic/1.JPG',height:40 ,width: 40, ),
                    new Text('Twinsynergy :BKK \t'),
                    new Padding(padding: new EdgeInsets.only(top: 30.0),),
                    new Padding(padding: new EdgeInsets.only(left: 100.0),),
                    new IconButton(icon: Icon(Icons.edit), onPressed: null),
                    new IconButton(icon: Icon(Icons.delete),onPressed: ()=> _showAlert(context, 'Do you want to delete this row ?')  ,)

                  ],
                ),

                ),
          Card(child: Row(mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset('/Users/tuchchapon/AndroidStudioProjects/project/pic/1.JPG',height:40 ,width: 40, ),
              new Text('Twinsynergy :BKK \t'),
              new Padding(padding: new EdgeInsets.only(top: 30.0),),
              new Padding(padding: new EdgeInsets.only(left: 100.0),),
              new IconButton(icon: Icon(Icons.edit), onPressed: null),
              new IconButton(icon: Icon(Icons.delete),onPressed: ()=> _showAlert(context, 'Do you want to delete this row ?'),)

            ],
          ),

          ),new Text(_value),
          new Padding(
            padding: new EdgeInsets.all(32.0),
          ),new Text(_value),
                new Padding(
                  padding: new EdgeInsets.all(32.0),
                ),
              ],
            ),
          )
      ),floatingActionButton: FloatingActionButton(
      backgroundColor: Colors.yellow,
      onPressed: null,
      tooltip: 'Increment',
      child: Icon(Icons.add),
    ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
