import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
//import 'listbranch.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../model/Branch.dart';



class branch extends StatefulWidget {
  @override
  _branchState createState() => new _branchState();
}



class _branchState extends State<branch>  {

  Branch listBrabch = new Branch();
  int isTrue = 0;
  @override
  void initState() {
    super.initState();
    fetchPost();
  }
 //
  Future<void> fetchPost() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("prefsToken");
    final response =
    await http.get('http://35.198.219.154:1337/branch/datatable',
        headers: {'authorization': "Bearer "+token},);
    print(response.body);
    String jsonString = response.body.toString();
    final jsonResponse = json.decode(jsonString);
    print(jsonResponse["data"]);
    print(jsonResponse["data"]);
    listBrabch = new Branch.fromJson(jsonResponse);
    if (response.statusCode == 200) {
      listBrabch = new Branch.fromJson(jsonResponse);
      setState(() {
        this.isTrue = 1;
      });

    } else {

      throw Exception('Failed to load post');
    }

  }
 //
  Future<dynamic> deletebranch(id) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String Token = prefs.getString("prefsToken");
    var url = 'http://35.198.219.154:1337/branch/delete';
    var body = {
      'id': id,
    };
    http.Response response = await http.post(url,
        headers: {'authorization': "Bearer "+Token},
        body: body);
    print(response.body);
    fetchPost();
  }
 //
  Widget build(BuildContext context) {
    branch Listbranch = new branch();
    Color buttoncolor = const Color(0xFF4fa2e1);
    Color colorappbar = const Color(0xFF2ac3fe);
    MediaQueryData queryData = MediaQuery.of(context);

    double screenWidth = queryData.size.width;
    double screenHeight = queryData.size.height*0.4;
    return new Scaffold(
      appBar: new AppBar(backgroundColor: colorappbar,
          title: new Text('สาขา',style: TextStyle(color: Colors.brown[500]),),
          actions: <Widget>[
            new IconButton(icon: new Icon(Icons.search), onPressed: null),
          //  new IconButton(icon: new Icon(Icons.home), onPressed: () {Navigator.of(context).pushNamed('/showbranch');})
          ]
      ),

        drawer: Drawer(
          child: Column(
            children: <Widget>[
              Container(width: screenWidth,height: screenHeight*0.22,
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
              /*   ListTile(
              leading: Icon(Icons.event,color: Colors.black),
              title: Text('การลา') ,
              onTap: (){Navigator.of(context).pushNamed('/vacation');},
            ),
            */
              ListTile(
                leading: Icon(Icons.card_giftcard,color: Colors.black),
                title: Text('สิทธิประโยชน์'),
                onTap:(){Navigator.of(context).pushNamed('/benefit');},
            /*    body: Container
                  (width: screenWidth,height: screenHeight,margin: EdgeInsets.all(5),
                  child:  isTrue != 0 ?
                  ListView.builder(
                    itemCount: listPosition.data.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                          child: DetailPosition( id: listPosition.data[index].id,positionName:listPosition.data[index].positionName ,del: DeletePosition,)
                      );
                    },
                  ):Text('Waiting')

                  ,padding: EdgeInsets.only(left: 10),),*/
              ),
            ],
          ),
        ),

        body: Container
          (width: screenWidth,height: screenHeight*2.1,margin: EdgeInsets.all(5),color: Colors.white,
          child:  isTrue != 0 ?
          ListView.builder(
            itemCount: listBrabch.data.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                  child: Detailbranch(
                    id: listBrabch.data[index].id,
                    branch_name: listBrabch.data[index].branchName,
                    branchaddress: listBrabch.data[index].branchAddress,del:  deletebranch)
              );
            },
          ):Text('Waiting')

          ,padding: EdgeInsets.only(left: 10),),

        floatingActionButton: FloatingActionButton(
          backgroundColor: buttoncolor,
          onPressed: (){Navigator.of(context).pushNamed('/addbranch');},
          child: Icon(Icons.add),)
    );
  }
}
class Detailbranch extends StatelessWidget {
  //
  Future _showAlert(BuildContext context, String message) async {
    return showDialog(
        context: context,
        child: new AlertDialog(
          title: new Text(message),
          actions: <Widget>[
            new FlatButton(onPressed: () {del(id.toString());}, child: new Text('ยืนยัน')
            ),
            new FlatButton(onPressed: () => Navigator.pop(context), child: new Text('ยกเลิก'))
          ],
        )

    );
  }
  Function del;
  int id;
  String branch_name;
  String branchaddress;
  Detailbranch({this.id,this.branch_name,this.branchaddress,this.del});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(branch_name),
      title: Row(mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          IconButton(icon: Icon(Icons.edit), onPressed: null/*(){
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => editposition(id: id,positionName: positionName,),
              ),
            );
          }),*/
          ) ,
          IconButton(icon: Icon(Icons.delete), onPressed: () => _showAlert(context, 'ต้องการลบ ${branch_name} หรือไม่!')
            // del(id.toString());

          ),
        ],
      ),
      onTap: () {
        Navigator.push(context,
          MaterialPageRoute(
              builder: (context) => DetailScreen(id: id,branchname: branch_name,branchaddress: branchaddress,)
          ),
        );
      },
    );
  }

}
class DetailScreen extends StatelessWidget {

  int id;
  String branchname;
  String branchaddress;
  DetailScreen({this.id,this.branchname,this.branchaddress});


  Color colorappbar = const Color(0xFF2ac3fe);
//  final  Position position;
  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData = MediaQuery.of(context);

    double screenWidth = queryData.size.width;
    double screenHeight = queryData.size.height;

    return Scaffold(
      appBar: AppBar(backgroundColor: colorappbar,
        title: Text('ข้อมูลตำแหน่ง',style: TextStyle(color: Colors.brown[500]),),
      ),
      body: Container(
          margin: EdgeInsets.all(5),height:screenHeight ,width: screenWidth,
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              // Text('id  '+id.toString(),style: TextStyle(fontSize: 16),),
              Text('ตำแหน่ง  '+branchname,style: TextStyle(fontSize: 16),),
              Text('ตำแหน่ง  '+branchaddress,style: TextStyle(fontSize: 16),),
            ],
          )
      ),
    );
  }
}