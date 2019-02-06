import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/foundation.dart';




Position postFromJson(String str) {
  final jsonData = json.decode(str);
  return Position.fromJson(jsonData);
}

String postToJson(Position data) {
  final dyn = data.toJson();
  return json.encode(dyn);
}

List<Position> allPostsFromJson(String str) {
  final jsonData = json.decode(str);
  return new List<Position>.from(jsonData.map((x) => Position.fromJson(x)));
}

String allPostsToJson(List<Position> data) {
  final dyn = new List<dynamic>.from(data.map((x) => x.toJson()));
  return json.encode(dyn);
}

class Position {
  int createdAt;
  int updatedAt;
  int id;
  String positionName;
  int status;

  Position({
    @required  this.createdAt,
    @required  this.updatedAt,
    @required  this.id,
    @required  this.positionName,
    @required  this.status,
  });

  factory Position.fromJson(Map<String, dynamic> json) => new Position(
    createdAt: json["createdAt"],
    updatedAt: json["updatedAt"],
    id: json["id"],
    positionName: json["position_name"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "createdAt": createdAt,
    "updatedAt": updatedAt,
    "id": id,
    "position_name": positionName,
    "status": status,
  };
}

class DetailScreen extends StatelessWidget {



  Color colorappbar = const Color(0xFF2ac3fe);


  final  Position position;


  DetailScreen({Key key,  this.position}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData = MediaQuery.of(context);

    double screenWidth = queryData.size.width;
    double screenHeight = queryData.size.height;

    return Scaffold(
      appBar: AppBar(backgroundColor: colorappbar,
        title: Text('ข้อมูลตำแหน่ง',style: TextStyle(color: Colors.brown[500]),),
      ),
      body: Container(margin: EdgeInsets.all(5),height:screenHeight ,width: screenWidth,
        padding: EdgeInsets.all(16.0),
        child: Text('ตำแหน่ง  '+position.positionName,style: TextStyle(fontSize: 16),),
      ),
    );
  }
}



class ListViewPosts extends StatelessWidget {

  final List<Position> posts;
  final int id;
  ListViewPosts({Key key, this.posts,this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
          itemCount: posts.length,
          itemBuilder: (context, index) {
            return Column(
              children: <Widget>[
                ListTile(
                  title: Text('${posts[index].positionName}',),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailScreen(position: posts[index]),
                      ),
                    );
                  },
                ),
                Padding(padding: EdgeInsets.all(20))
              ],
            );
          }
          ),
    );
  }

}