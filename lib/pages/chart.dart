import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:project/model/allposition.dart';


class chart extends StatefulWidget {
  @override
  _chartState createState() => new _chartState();
}



class _chartState extends State<chart> {

  List<Data> position;
  List<charts.Series<Data, String>> _chartdata;
  int chartisTrue =0;
  int loopchart =0;
  Allposition listpo = new Allposition();

  Future<void> getchart_position() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("prefsToken");
    final response =
    await http.get('http://35.198.219.154:1337/dashboard/position',
        headers: {'authorization': "Bearer "+token});
    String jsonString = response.body.toString();
    final jsonResponse = json.decode(jsonString);

   print(response.statusCode);
    if (response.statusCode == 200) {
    setState(() {
      listpo = new Allposition.fromJson(jsonResponse);
      loopchart = listpo.data.length;
      chartisTrue =1;
      print(loopchart);
    });

    } else {

      throw Exception('Failed to load post');
    }

    position = new List<Data>();
    _chartdata = new List<charts.Series<Data, String>>();

    for(int i = 0; i < this.loopchart; i++) {

      position.add(new Data(label: listpo.data[i].label,value: listpo.data[i].value));
    }

    _chartdata.add(new charts.Series(
      id: 'value',
      data: position,
      domainFn: (Data positiondata,__) => positiondata.label,
      measureFn: (Data positiondata,__) => positiondata.value,
      displayName: 'positiondata',
      labelAccessorFn: (Data positiondata,__) => positiondata.label+' '+positiondata.value.toString()+' คน',
      colorFn: (_,__) => charts.MaterialPalette.blue.shadeDefault,
    ));
  }

  @override
  void initState() {

    getchart_position();
  //  _makeData();

   // print(listpo.data[0].label);
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
        title: new Text('ข้อมูลพนักงานในตำแหน่ง'),
      ),
      body: chartisTrue ==1 ?  new Container(
          padding: new EdgeInsets.all(32.0),
          child: new Center(
            child: new Column(
              children: <Widget>[
                new Expanded(child: new charts.BarChart(
                  _chartdata,
                  barRendererDecorator: new charts.BarLabelDecorator<String>(),
                  domainAxis:
                  new charts.OrdinalAxisSpec(renderSpec: new charts.NoneRenderSpec()),
                  vertical: false,
                ))
              ],
            ),
          )
      ):  Center(child: CircularProgressIndicator(),),
    );
  }
}