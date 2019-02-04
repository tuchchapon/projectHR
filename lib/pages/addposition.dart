import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'listposition.dart';
import 'dart:io';

String url = 'https://jsonplaceholder.typicode.com/posts';

Future<List<Position>> getAllPosts() async {
  final response = await http.get('http://35.198.219.154:1337/position');
  print(response.body);
  return allPostsFromJson(response.body);
}

Future<Position> getPost() async{
  final response = await http.get('$url/1');
  return postFromJson(response.body);
}

Future<http.Response> createPost(Position post) async{
  final response = await http.post('$url',
      body: postToJson(post)
  );
  return response;
}


class addposition extends StatefulWidget {
  @override
  _addpositionState createState() => new _addpositionState();
}



//String _position = '';

class _addpositionState extends State<addposition> {
  Widget build(BuildContext context) {
    MediaQueryData queryData = MediaQuery.of(context);

    double screenWidth = queryData.size.width;
    double screenHeight = queryData.size.height;
    Color colorappbar = const Color(0xFF2ac3fe);
    return new Scaffold(
      appBar: new AppBar(backgroundColor: colorappbar,
        title: new Text('เพิ่มข้อมูล'),

      ),

      body: new Container(
        height: screenHeight,
        width: screenWidth,
        margin: EdgeInsets.all(10),
        child: new Center(
          child: new ListView(
          children: <Widget>[
         ListTile(
          leading: Text('ตำแหน่ง'),
          title: TextField(decoration: InputDecoration.collapsed(
              hintText: 'ป้อนตำแหน่ง'),autofocus: true,
            onChanged: (String Posiotion){
            setState(() {
            String  _position = Posiotion;
            });
          },),
        ),
        Divider(color: Colors.grey,),
         RaisedButton(onPressed: null,child: Text('บันทึก'),color: Colors.green,)
          ]
        ),
        ),
      ),
    );
  }
}