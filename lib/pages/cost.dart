import 'package:flutter/material.dart';

class cost extends StatefulWidget {
  @override
  _costState createState() => new _costState();
}

class _costState extends State<cost>  {

  String money = 'บาท';
  Widget build(BuildContext context) {
    Color colorappbar = const Color(0xFF2ac3fe);
    MediaQueryData queryData = MediaQuery.of(context);

    double screenWidth = queryData.size.width;
    double screenHeight = queryData.size.height;
    return new Scaffold(
      appBar: new AppBar(backgroundColor: colorappbar,
          title: new Text('ค่าใช้จ่าย',style: TextStyle(color: Colors.brown[500]),),
          actions: <Widget>[
            new IconButton(icon: new Icon(Icons.search), onPressed: null),
          //  new IconButton(icon: new Icon(Icons.home), onPressed: () {Navigator.of(context).pushNamed('/Home');})
          ]
      ),


      body: new Container(width: screenWidth,height: screenHeight,margin: EdgeInsets.all(10),
       child: new Center(
         child: new ListView(
            children: <Widget>[

              Row(children: <Widget>[
                Text('ค่าใช้จ่ายทั่วไป  ',style: TextStyle(fontSize: 16),),
                IconButton(icon: Icon(Icons.add,size: 20,), onPressed: (){Navigator.of(context).pushNamed('/addfixcost');})
              ],),
             
              ListTile(
                title: Text('ค่าเน็ต'),
                subtitle: Text('500000 ${money}'),
                onTap: (){Navigator.of(context).pushNamed('/showfixcost');}
              ),
              ListTile(
                title: Text('ค่าเช่าออฟsdfsdfsdfsdfsdfsdfsdfฟิต'),
                subtitle: Text('1213113310 ${money}'),
              ),
              ListTile(
                title: Text('ค่าเช่าออฟฟิต'),
                subtitle: Text('2112310 ${money}'),
              ),
                Row(children: <Widget>[
                  Text('ค่าใช้จ่ายอื่นๆ  ',style: TextStyle(fontSize: 16),),
                  IconButton(icon: Icon(Icons.add,size: 20,), onPressed: (){Navigator.of(context).pushNamed('/addcost');})
                ],),
                ListTile(
                title: Text('ค่าซ่อมท่อน้ำ'),
                subtitle: Text('450 ${money}'),
                  onTap: (){Navigator.of(context).pushNamed('/showcost');}
              ),
              ListTile(
                title: Text('ค่าเช่าออฟฟิdsfdsfsdfsfต'),
                subtitle: Text('2112310 ${money}'),
              ),
              ListTile(
                title: Text('ค่าเช่าออฟฟิต'),
                subtitle: Text('2145624512310 ${money}'),
              ),
              ListTile(
                title: Text('ค่าเช่าออฟฟิต'),
                subtitle: Text('2112310 ${money}'),
              ),
              ListTile(
                title: Text('ค่าเช่าออฟฟิต'),
                subtitle: Text('245542110 ${money}'),
              ),              ListTile(
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