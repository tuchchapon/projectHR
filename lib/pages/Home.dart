import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;




class Home extends StatefulWidget {
  @override
  _HomeState createState() => new _HomeState();
}

class Sales {
  int year;
  int sales;
  charts.Color color;
  Sales(this.year,this.sales,this.color);
}

class _HomeState extends State<Home> {

  List<Sales> _data;
  List<charts.Series<Sales, int>> _chartdata;


  void _makeData() {
    _chartdata = new List<charts.Series<Sales, int>>();
    _data = <Sales>[
      new Sales(0,80, charts.MaterialPalette.purple.shadeDefault),
      new Sales(1,75, charts.MaterialPalette.blue.shadeDefault),
      new Sales(2,25, charts.MaterialPalette.green.shadeDefault),
      new Sales(3,5, charts.MaterialPalette.yellow.shadeDefault),
    ];

    _chartdata.add(new charts.Series(
      id: 'Sales',
      data: _data,
      colorFn: (Sales sales,_) => sales.color,
      domainFn: (Sales sales,_) => sales.year,
      measureFn: (Sales sales,_) => sales.sales,
    ));
  }


  @override
  void initState() {
    _makeData();
  }

  @override
  Widget build(BuildContext context) {
    Color colorappbar = const Color(0xFF2ac3fe);
    MediaQueryData queryData = MediaQuery.of(context);

    double screenWidth = queryData.size.width;
    double screenHeight = queryData.size.height*0.4;
    return new Scaffold(
      appBar: new AppBar(
          backgroundColor: colorappbar,
          title: new Text('หน้าหลัก',style:TextStyle(color: Colors.brown[500]),),
          actions: <Widget>[
            new IconButton(icon: new Icon(Icons.search), onPressed: null),
            new IconButton(icon: new Icon(Icons.home), onPressed: () {Navigator.of(context).pushNamed('/Home');})
          ]
      ),

      drawer: Drawer(
        child: Column(
          children: <Widget>[
            Container(width: screenWidth,height: screenHeight*0.6,
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
          ],
        ),
      ),
      body: ListView(
        children: <Widget>[
          Column(
        children: <Widget>[
    ListTile(title: Text('ตำแหน่งพนักงาน'),
        trailing: Text('สาขา BKK',style: TextStyle(fontSize: 12),),) ,
  Divider(),
  Container(margin: EdgeInsets.all(5),
    width: screenWidth,height: screenHeight*0.65,
    child: new charts.PieChart<dynamic>(
    _chartdata,
    animate: true,
    animationDuration: new Duration(seconds: 2),
    defaultRenderer: new charts.ArcRendererConfig(arcWidth: 26)

      ),
    ),
      ListTile(title: Text('ค่าใช้จ่ายปี'),
      trailing: Text('2019',style: TextStyle(color: Colors.grey),),),
      ListTile(title: Text('Total Budget',style: TextStyle(fontSize: 10),),
      trailing: Text('500,000',style: TextStyle(color: Colors.green,fontSize: 10),),),
      Divider(),
      Container(margin: EdgeInsets.all(5),
      width: screenWidth,height: screenHeight*0.5,
      child: new charts.PieChart<dynamic>(
          _chartdata,
          animate: true,
          animationDuration: new Duration(seconds: 5),
    defaultRenderer: new charts.ArcRendererConfig(arcWidth: 10),
      ),

    ),
      new Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Container(
          decoration: new BoxDecoration(
            border: new Border.all(color: Colors.blue[200], width: 6.0),
          ),
        ),

          Text('  Total Spend'),
          Text('      '),
          new Container(
            decoration: new BoxDecoration(
              border: new Border.all(color: Colors.purple[300], width: 6.0),
            ),
          ),
          Text('  Money Saved'),
        ],
      ),
      ListTile(
        title: Text('อันดับพนักงาน',style: TextStyle(fontSize: 12),),
        trailing: Text('จำนวนงาน',style: TextStyle(fontSize: 10),),
      ),
          Divider(),
          ListTile(
            title: Text('ธัชพล สุธรรมมา'),
            subtitle: Text('Mobile-dev'),
            trailing: Text('80%'),
          ),
    Divider(),
    ListTile(
      title: Text('ธัชพล สุธรรมมา'),
      subtitle: Text('Mobile-dev'),
      trailing: Text('80%'),
    ),
    Divider(),
    ListTile(
      title: Text('ธัชพล สุธรรมมา'),
      subtitle: Text('Mobile-dev'),
      trailing: Text('80%'),
    ),
      ],
          )
        ],
      )
    );
  }
}

/*
 ListView(
        children: <Widget>[Container(color: Colors.black,height: screenHeight,width: screenWidth,margin: EdgeInsets.all(5),
              child: new Column(
                children: <Widget>[
                  new ListTile(
                    title: Text('ตำแหน่งพนักงาน'),
                    trailing:  Text('สาขา BKK'),
                  ),
                  Divider(),
                  Container(width: screenWidth,height: screenHeight*0.4,child: new charts.PieChart<dynamic>(
                      _chartdata,
                      animate: true,
                      animationDuration: new Duration(seconds: 2)

                  ),
                  ),


                  Divider(),
                  ListTile(title: Text('ค่าใช้จ่ายปี'),
                    trailing: Text('2019'),),
                  ListTile(title: Text('ค่าใช้จ่ายปี'),
                    trailing: Text('2019'),),
                  Padding(padding: EdgeInsets.only(bottom: 5)),

                ],
              ),

        ),],
      )
 */