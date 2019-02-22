import 'package:flutter/material.dart';
import 'package:moment/moment.dart';

class updatesprint extends StatefulWidget {
  @override
  _updatesprintState createState() => _updatesprintState();
  int teamid;
  int empid;
  var startdate;
  var enddate;
  updatesprint({this.teamid,this.enddate,this.startdate,this.empid});
}

class _updatesprintState extends State<updatesprint> {
  @override
  void initState() {
    super.initState();
    print(widget.teamid);
    print(widget.empid);


  }

  var timestamp = DateTime.now().millisecondsSinceEpoch;
  int startdate;
  int enddate;

  Future _startdate() async {
    DateTime picked = await showDatePicker(
      context: context,

      initialDate: new DateTime.now(),
      firstDate: new DateTime(2018),
      lastDate: new DateTime(2022),

    ) ;

    if(picked != null) {


      setState(() {
        timestamp = picked.millisecondsSinceEpoch;
        print('Time stamp is ${timestamp}');
      });
    };
  }
  Future _enddate() async {
    DateTime picked = await showDatePicker(
      context: context,

      initialDate: new DateTime.now(),
      firstDate: new DateTime(2018),
      lastDate: new DateTime(2022),

    ) ;

    if(picked != null) {


      setState(() {
        timestamp = picked.millisecondsSinceEpoch;
        print('Time stamp is ${timestamp}');
      });
    };
  }
  @override
  Widget build(BuildContext context) {

    Color colorappbar = const Color(0xFF2ac3fe);
    MediaQueryData queryData = MediaQuery.of(context);

    double screenWidth = queryData.size.width;
    double screenHeight = queryData.size.height;
    return new Scaffold(
      appBar: new AppBar(backgroundColor: colorappbar,
        title: new Text('จัดการ sprint',style: TextStyle(color: Colors.brown[500]),),
      ),

      body: new Container(
        width: screenWidth,height: screenHeight,margin: EdgeInsets.all(5),
        child: new Center(
            child: ListView(
              children: <Widget>[
                ListTile(
                  leading: Text('วันที่        '),
                  title: Text(Moment(timestamp).format("dd/MMM/yyyy")),
                  trailing: IconButton(icon:Icon(Icons.event), onPressed: null),
                ),
                Divider(color: Colors.grey,),
                ListTile(
                  leading: Text('วันที่        '),
                  title: Text(Moment(timestamp).format("dd/MMM/yyyy")),
                  trailing: IconButton(icon:Icon(Icons.event), onPressed: null),
                ),
                RaisedButton(
                  onPressed: (){
                   // Addbranchaddit(addit_title, addit_price, timestamp.toString(), widget.id.toString());widget.getadditcost();
        },

                  child: Text('บันทึก'),color:(Colors.green),textColor: (Colors.white),
                ),
              ],
            )
        ),
      ),
    );
  }
}
