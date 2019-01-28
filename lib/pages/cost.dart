import 'package:flutter/material.dart';

class cost extends StatefulWidget {
  @override
  _costState createState() => new _costState();
}

class _costState extends State<cost>  {

  String money = 'บาท';
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
          title: new Text('ค่าใช้จ่าย'),
          actions: <Widget>[
            new IconButton(icon: new Icon(Icons.search), onPressed: null),
            new IconButton(icon: new Icon(Icons.home), onPressed: () {Navigator.of(context).pushNamed('/Home');})
          ]
      ),


      body: new SafeArea(
       child: new Center(
         child: new ListView(
            children: <Widget>[
              ListTile(
                leading: Text('    ค่าใช้จ่ายทั่วไป'),
                trailing: IconButton(icon: Icon(Icons.add), onPressed: (){Navigator.of(context).pushNamed('/addfixcost');},
              ),
                  ),
              ListTile(
                leading: Icon(Icons.attach_money,size: 30,), 
                title: Text('ค่าเน็ต'),
                subtitle: Text('500000 ${money}'),
                onTap: (){Navigator.of(context).pushNamed('/showfixcost');}
              ),
              ListTile(
                leading: Icon(Icons.attach_money,size: 30,),
                title: Text('ค่าเช่าออฟsdfsdfsdfsdfsdfsdfsdfฟิต'),
                subtitle: Text('1213113310 ${money}'),
              ),
              ListTile(
                leading: Icon(Icons.attach_money,size: 30,),
                title: Text('ค่าเช่าออฟฟิต'),
                subtitle: Text('2112310 ${money}'),
              ),
              ListTile(
                title: new Text('ค่าใช้จ่ายอื่นๆ'),
                trailing: new IconButton(icon: Icon(Icons.add), onPressed: (){Navigator.of(context).pushNamed('/addcost');}),
              ),
                ListTile(
                leading: Icon(Icons.attach_money,size: 30,),
                title: Text('ค่าซ่อมท่อน้ำ'),
                subtitle: Text('450 ${money}'),
                  onTap: (){Navigator.of(context).pushNamed('/showcost');}
              ),              ListTile(
                leading: Icon(Icons.attach_money,size: 30,),
                title: Text('ค่าเช่าออฟฟิdsfdsfsdfsfต'),
                subtitle: Text('2112310 ${money}'),
              ),              ListTile(
                leading: Icon(Icons.attach_money,size: 30,),
                title: Text('ค่าเช่าออฟฟิต'),
                subtitle: Text('2145624512310 ${money}'),
              ),              ListTile(
                leading: Icon(Icons.attach_money,size: 30,),
                title: Text('ค่าเช่าออฟฟิต'),
                subtitle: Text('2112310 ${money}'),
              ),              ListTile(
                leading: Icon(Icons.attach_money,size: 30,),
                title: Text('ค่าเช่าออฟฟิต'),
                subtitle: Text('245542110 ${money}'),
              ),              ListTile(
                leading: Icon(Icons.attach_money,size: 30,),
                title: Text('ค่าเช่าออฟฟิต'),
                subtitle: Text('2112310 ${money}'),
              ),              ListTile(
                leading: Icon(Icons.attach_money,size: 30,),
                title: Text('ค่าเช่าออฟฟิต'),
                subtitle: Text('2112310 ${money}'),
              ),              ListTile(
                leading: Icon(Icons.attach_money,size: 30,),
                title: Text('ค่าเช่าออฟฟิต'),
                subtitle: Text('2112310 ${money}'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}