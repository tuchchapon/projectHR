import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class login extends StatefulWidget {
  @override
  _loginState createState() => _loginState();
}




class _loginState extends State<login> {
  String user ;
  String pass ;

 // final usercon = TextEditingController();
 // final passcon = TextEditingController();

    Future<dynamic> LoginA(username , password) async {

    //  print(user);
     // print(pass);
      print(username);
     // print(password);
      var url = 'http://35.198.219.154:1337/api/users/login';
      var body = {
        'username': username,
        'password': password,
      };
      print(body);
       http.Response response = await http.post(
          "http://35.198.219.154:1337/api/users/login",
          body: body);

      final Map<String, dynamic> responseData = await json.decode(
          response.body);
      print(responseData);
      return responseData['code'];
    }


  @override
  Widget build(BuildContext context) {



    MediaQueryData queryData = MediaQuery.of(context);

    double screenWidth = queryData.size.width;
    double screenHeight = queryData.size.height;
    Color colorappbar = const Color(0xFF2ac3fe);

    return new Scaffold(
      body: Container(width: screenWidth,height: screenHeight,
        child: new Center(
          child: new Column(
            children: <Widget>[
              new Container(height: screenHeight*0.27,
                width: screenWidth,
                color: colorappbar,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Text('ระบบจัดการข้อมูล',style: TextStyle(color: Colors.white,fontSize: 26),),
                    Padding(
                        padding: EdgeInsets.only(bottom: 20))
                  ],
                ),
              ),
              Stack(children: <Widget>[
                Container(
                  height: 40,
                  margin: EdgeInsets.only(top: 20,left: 20,right: 20),
                  child: new Container(
                    child: TextField(
                    autocorrect: false,
                    decoration: InputDecoration(
                        hintText: 'username',border: InputBorder.none),
                      //  controller: usercon,
                        onChanged: (String unameinput) {
                      user  = unameinput;
                        print(user);
                          },
                ),
                    decoration: new BoxDecoration(border: Border.all(width: 0.1),
                        color: Colors.transparent,
                        borderRadius: new BorderRadius.only(
                            topLeft:const Radius.circular(15.0),
                            topRight: const Radius.circular(15.0),
                            bottomLeft: const Radius.circular(15.0),
                            bottomRight: const Radius.circular(15.0))
                    ),
                  ),
                ),
              ],),


              Padding(padding: EdgeInsets.only(top: 10,)),

              Stack(children: <Widget>[
                Container(
                  height: 40,
                  margin: EdgeInsets.only(top: 20,left: 20,right: 20),
                  child: new Container(
                    child: TextField(obscureText: true,autocorrect: false,
                      decoration: InputDecoration(
                          hintText: 'password',border: InputBorder.none),
                    //  controller: passcon,
                      onChanged: (String passinput) {
                     pass = passinput;
                        print(pass);
                      },
                    ),
                    decoration: new BoxDecoration(border: Border.all(width: 0.1),
                        color: Colors.transparent,
                        borderRadius: new BorderRadius.only(
                            topLeft:const Radius.circular(15.0),
                            topRight: const Radius.circular(15.0),
                            bottomLeft: const Radius.circular(15.0),
                            bottomRight: const Radius.circular(15.0))
                    ),
                  ),
                ),
              ],
              )
              ,new Padding(
                padding: new EdgeInsets.all(10.0),
                // child: new FlatButton(onPressed: null, child: new Text('หากลืมรหัสผ่าน',),color: (Colors.red),),
              ),
              FlatButton(onPressed:() {
                LoginA(user,pass);
                print(user);
                print(pass);
              }
                ,child: Image(image: AssetImage('pic/11.png'),),),

            ],
          ),
        ),

      ),
    );
  }
}
