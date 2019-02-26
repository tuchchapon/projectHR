import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:project/model/chart_position.dart';


class chart extends StatefulWidget {
  @override
  _chartState createState() => new _chartState();
}

class Positionchart {
  String labal;
  int value;

  Positionchart(this.labal,this.value);
}

class _chartState extends State<chart> {
  int chartisTrue =0;
  int loopchart =0;
  ChartPosition listpo = new ChartPosition();

  Future<void> getchart_position() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("prefsToken");
    final response =
    await http.get('http://35.198.219.154:1337/dashboard/position',
        headers: {'authorization': "Bearer "+token});
    String jsonString = response.body.toString();
    final jsonResponse = json.decode(jsonString);
    //  print(jsonResponse);

    if (response.statusCode == 200) {
      listpo = new ChartPosition.fromJson(jsonResponse);
      setState(() {
        print(response.body);
        loopchart = listpo.data.length;
        this.chartisTrue = 1;
      });
    } else {

      throw Exception('Failed to load post');
    }

  }
  List<Positionchart> _laptops;
  List<charts.Series<Positionchart, String>> _chartdata;


  void _makeData() {

    _laptops = new List<Positionchart>();
    _chartdata = new List<charts.Series<Positionchart, String>>();

    final rnd = new Random();
    for(int i = 2016; i < 2019; i++) {
      _laptops.add(new Positionchart(i.toString(), rnd.nextInt(1000)));
    }

    _chartdata.add(new charts.Series(
      id: 'Sales',
      data: _laptops,
      domainFn: (Positionchart sales,__) => sales.labal,
      measureFn: (Positionchart sales,__) => sales.value,
      displayName: 'Sales',
      colorFn: (_,__) => charts.MaterialPalette.green.shadeDefault,
    ));



  }

  @override
  void initState() {
    _makeData();
    getchart_position();
    print(listpo.data[0].label);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Name here'),
      ),
      body: new Container(
          padding: new EdgeInsets.all(32.0),
          child: new Center(
            child: new Column(
              children: <Widget>[
                new Text('Add Widgets Here'),
                new Expanded(child: new charts.BarChart(
                  _chartdata,
                  vertical: false,
                ))
              ],
            ),
          )
      ),
    );
  }
}