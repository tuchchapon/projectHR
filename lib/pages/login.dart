import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';


class login extends StatefulWidget {
  @override
  _loginState createState() => _loginState();
}
class Gettoken {
String username;
String status;
String token;

Gettoken({
this.username,
this.status,
this.token
});

factory Gettoken.fromJson(Map<String, dynamic> json) => new Gettoken(
  username:  json["username"],
  status:  json["status"],
  token:  json["token"],
);

Map<String, dynamic> toJson() => {
  "username": username,
  "status": status,
  "token": token,
};
}


class _loginState extends State<login> {
  String user ;
  String pass ;

 // final usercon = TextEditingController();
 // final passcon = TextEditingController();

    Future<dynamic> LoginA(username , password) async {
      print(username);
      print(password);
      SharedPreferences prefs = await SharedPreferences.getInstance();
        var url = 'http://35.198.219.154:1337/api/users/login';
        var body = {
          'username': username,
          'password': password,
        };
        //  print(body);
        http.Response response = await http.post(
            url,
            body: body);

    /*  final Map<String, dynamic> responseData = await json.decode(response.body);
      print('responbody ${response.body}');
      print('respondata ${responseData}');
*/
      String jsonString = response.body.toString();
      final jsonResponse = json.decode(jsonString);
      Gettoken token = new Gettoken.fromJson(jsonResponse);
      print('Token is:'+token.token);
      prefs.setString("prefsToken",token.token);


    if (token.username == 'admin'){
       Navigator.of(context).pushReplacementNamed('/Home');
    }
    else {
         AlertDialog(
            title: new Text('Username or Password Wrong'),
          );

    }

    }


Future<String>getToken()async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String Token = prefs.getString("prefsToken");
  return Token;
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
                print('username is :'+user);
                print('password is :'+pass);
              }
                ,child: Image(image: AssetImage('pic/11.png'),),),

            ],
          ),
        ),

      ),
    );
  }
}
