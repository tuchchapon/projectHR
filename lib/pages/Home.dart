import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:project/model/manday.dart';
import 'package:project/model/project.dart';
import 'package:project/model/employee.dart';
import 'package:project/model/Drawer.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => new _HomeState();

}

class _HomeState extends State<Home> {



  @override
  void initState() {
    super.initState();
    getmanday();
    getprojectsell();
    getempdata();


  }
  ///
  int loopproject =0;
  int loopmanday =0;
  int projectisTrue =0;
  int mandayisTrue =0;
  int empisTrue=0;
  int loopemp=0;
  Project listproject = new Project();
  Manday listmanday = new Manday();
  Employee listEmp = new Employee();
  String username;
  String status;

  ///
  ///
  ///

  Future<void> getempdata() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("prefsToken");
    final response =
    await http.get('http://35.198.219.154:1337/emp/datatable',
      headers: {'authorization': "Bearer "+token},);
    //  print(response.body);
    String jsonString = response.body.toString();
    final jsonResponse = json.decode(jsonString);
    // print(jsonResponse["data"]);
    listEmp = new Employee.fromJson(jsonResponse);

    if (response.statusCode == 200 || response.statusCode == 200) {
      //listBrabch = new Branch.fromJson(jsonResponse);
      setState(() {
        this.empisTrue = 1;
      });

      // print(listEmp.data[0].empName);
    } else if (response.statusCode == 401){
      Navigator.pushReplacementNamed(context, ('/login'));

      throw Exception('Failed to load post');
    }
  }
  ///
  void cleartoken() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove("prefsToken");
  }
  ///
  Future<void> getprojectsell() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("prefsToken");
    final response =
    await http.get('http://35.198.219.154:1337/projectmanage/datatable',
        headers: {'authorization': "Bearer "+token});
    String jsonString = response.body.toString();
    final jsonResponse = json.decode(jsonString);
  //  print(jsonResponse);

    if (response.statusCode == 200) {
      listproject = new Project.fromJson(jsonResponse);
      setState(() {
        loopproject = listproject.data.length;
        this.projectisTrue = 1;
      });
    } else {

      throw Exception('Failed to load post');
    }

  }

  Future<void> getmanday() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("prefsToken");
    String User = prefs.getString("prefsUsername");
    String STATUS = prefs.getString("prefsStatus");

    final response =
    await http.get('http://35.198.219.154:1337/manday/emp/datatable',
        headers: {'authorization': "Bearer "+token});
    String jsonString = response.body.toString();
    final jsonResponse = json.decode(jsonString);
  //  print(jsonResponse);

    if (response.statusCode == 200) {

      listmanday = new Manday.fromJson(jsonResponse);
      setState(() {
        loopmanday = listmanday.data.length;
        this.mandayisTrue = 1;
        username = User;
        status = STATUS;
      });
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
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
          title: new Text('หน้าหลัก ',style:TextStyle(color: Colors.white),),


      ),


      drawer: Drawer(
        child: Column(
          children: <Widget>[
            Container(width: screenWidth,height: screenHeight*0.6,
              color: colorappbar,
                child: Column(
                  children: <Widget>[
                    Padding(padding: EdgeInsets.only(top: 10,left: 20)),
                    Container(child:  CircleAvatar(child: Image(image: AssetImage('pic/logo.png'),fit: BoxFit.cover,),radius: 30,backgroundColor: Colors.transparent,),),

                    mandayisTrue == 1 ? Text(username,style: TextStyle(fontSize: 12,color: Colors.white),): Text(''),
                    mandayisTrue == 1 ? Text(status,style: TextStyle(fontSize: 12,color: Colors.white),): Text('')

                  ],
                ),

              padding: EdgeInsets.only(right: 200,top: 10),
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
      ),
      body: ListView(
        children: <Widget>[
          /*IconButton(icon: Icon(Icons.add), onPressed: (){Navigator.of(context).pushNamed('/chart');}),*/
        Container(
          width: screenWidth,margin: EdgeInsets.all(10),padding: EdgeInsets.all(10),
          child: Column(children: <Widget>[

         empisTrue == 1 ?  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: <Widget>[
             Text('พนักงานทั้งหมด',style: TextStyle(fontSize: 18),),Text(listEmp.data.length.toString()+' คน',style: TextStyle(fontSize: 18,color: Colors.green),),
             IconButton(icon: Icon(Icons.insert_chart,color: Colors.black,),
                 onPressed: (){Navigator.of(context).pushNamed('/chart');},tooltip: 'ข้อมูลพนักงานทั้งหมด'),
           ],): CircularProgressIndicator(),

            Divider(),
            Row(children: <Widget>[
              Text('Selling rate',style: TextStyle(fontSize: 20),),Padding(padding: EdgeInsets.only(top: 20,bottom: 20)),
            IconButton(icon: Icon(Icons.list),
              onPressed: (){Navigator.of(context).pushNamed('/allmanday');},tooltip: 'ดูทั้งหมด',)],
            mainAxisAlignment: MainAxisAlignment.spaceBetween,),
            Divider(),
            Container(
                width: screenWidth,
                child: Column( children: mandayisTrue == 0 ? [
                  CircularProgressIndicator(),
                ] : detailmanday()
                )
            ),
          Padding(padding: EdgeInsets.only(top: 20,bottom: 20)),
            Divider(),
          Row(children: <Widget>[Text('Project  sell',style: TextStyle(fontSize: 20),),Padding(padding: EdgeInsets.only(top: 20,bottom: 20)),] ),
            Divider(),
            Container(
                width: screenWidth,
                child: Column( children: projectisTrue == 0 ? [
                  CircularProgressIndicator(backgroundColor: Colors.red,),
                ] : detailproject()
                )
            ),
            Container(
                width: screenWidth,
                child: Column( children: projectisTrue == 0 ? [
                  CircularProgressIndicator(),
                ] : totalsell()
                )
            ),
          ],
          ),)
      ],)
      );

  }
  List<Widget> totalsell(){
    List<Widget> mylist = new List();
    for(int i = 0; i < 1 ; i++ ){

      int totalsell = listproject.allprojectCost.floor();
      mylist.add(Column(
          children: <Widget>[
            Row(children: <Widget>[Text('ราคาต้นทุนทั้งหมด')],),
            Padding(padding: EdgeInsets.only(bottom: 5,top: 5)),
            Row(children: <Widget>[Text(listproject.allprojectCost.floor().toString()+'  บาท',style: TextStyle(color: Colors.red),),],),
            Padding(padding: EdgeInsets.only(bottom: 5,top: 5)),
            Row(children: <Widget>[Text('ราคาขายทั้งหมด'),],),
            Padding(padding: EdgeInsets.only(bottom: 5,top: 5)),
            Row(children: <Widget>[Text(listproject.allprojectSelling.floor().toString()+'  บาท',style: TextStyle(color: Colors.green),),],),
            Divider()

 ]

      )
      );
    }
    return mylist;
  }
  List<Widget> detailproject(){
    List<Widget> mylist = new List();
    for(int i = 0; i < loopproject ; i++ ){
     // double sellingrate = listproject.data[i].projectTotalCost*3;
      mylist.add(Column(
          children: <Widget>[

            Row(children: <Widget>[Text(listproject.data[i].projectName),],),
            Row(children: <Widget>[Text('ลูกค้า '),Text(listproject.data[i].projectCostomerName),],),
            Row(mainAxisAlignment: MainAxisAlignment.start,children: <Widget>[
              Text('ราคาต้นทุน : '),
              Text(listproject.data[i].projectTotalCost.toString(),style: TextStyle(color: Colors.red),),
              Text('   บาท')
            ],
            ),
            Row(mainAxisAlignment: MainAxisAlignment.start,children: <Widget>[
              Text('ราคาขาย    : '),
              Text(listproject.data[i].projectTotalSelling.toString(),style: TextStyle(color: Colors.green),),
              Text('   บาท')
            ],),
            Divider()
          ]

      )
      );
    }
    return mylist;
  }
  List<Widget> detailmanday(){
    List<Widget> mylist = new List();
    for(int i = 0; i < 5 ; i++ ){
      mylist.add(Column(
          children: <Widget>[

             Row(children: <Widget>[Text(listmanday.data[i].empName),],),
            Row(children: <Widget>[
              Text(listmanday.data[i].manday.floor().toString(),style: TextStyle(color: Colors.green),),
              Text('  บาท/วัน')
            ],),
              Divider()
               ]

      )
      );
    }
    return mylist;
  }
}


/**
    Container(
    padding: EdgeInsets.all(10),
    margin: EdgeInsets.only(left: 5,right: 5),width: screenWidth,
    child: Row( children: additisTrue == 0 ? [
    Text('ไม่มีข้อมูลค่าใช้จ่าย'),
    ] : totalcost()
    )
    ),
 */


/// Horizontal bar chart with bar label renderer example and hidden domain axis.

/*
class HorizontalBarLabelChart extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  HorizontalBarLabelChart(this.seriesList, {this.animate});

  /// Creates a [BarChart] with sample data and no transition.
  factory HorizontalBarLabelChart.withSampleData() {
    return new HorizontalBarLabelChart(
      _createSampleData(),
      // Disable animations for image tests.
      animate: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return new charts.BarChart(
      seriesList,
      animate: animate,
      vertical: false,
      barRendererDecorator: new charts.BarLabelDecorator<String>(),
      // Hide domain axis.
      domainAxis:
      new charts.OrdinalAxisSpec(renderSpec: new charts.NoneRenderSpec()),
    );
  }

  /// Create one series with sample hard coded data.
  static List<charts.Series<ChartPosition, String>> _createSampleData() {
    final ChartPosition = [
      new Data(),
      new Data(),
      new Data(),
      new Data(),
    ];

    return [
      new charts.Series<ChartPosition, String>(
          id: 'Sales',
          domainFn: (ChartPosition sales, _) => sales.data[0].label,
          measureFn: (ChartPosition sales, _) => sales.data[0].value,
          data: data,
          // Set a label accessor to control the text of the bar label.
          labelAccessorFn: (ChartPosition sales, _) =>
          '${sales.year}: \$${sales.sales.toString()}')
    ];
  }
}

/// Sample ordinal data type.
class OrdinalSales {
  final String year;
  final int sales;

  OrdinalSales(this.year, this.sales);
}
*/