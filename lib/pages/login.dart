import 'package:flutter/material.dart';

class login extends StatefulWidget {
  @override
  _loginState createState() => _loginState();
}

  String _user = '';
  String _pass = '';


class _loginState extends State<login> {

  void _checklogin (){

    if(_user == 'admin' && _pass == '1234') {
      print('login ID:${_user} \nPassword:${_pass}');
      print('login Status admin!');
          Navigator.of(context).pushNamed('/Home');

    }
    else if (_user == 'HR' && _pass == '1234'){
      print('login ID:${_user} \nPassword:${_pass}');
      print('login Status HR');
      Navigator.of(context).pushNamed('/homehr');
    }else if (_user == 'account' && _pass == '1234'){
      print('login ID:${_user} \nPassword:${_pass}');
      print('login Status account');
      Navigator.of(context).pushNamed('/homeacc');
    } else if (_user == 'user' && _pass == '1234') {
      print('login ID:${_user} \nPassword:${_pass}');
      print('login Status user');
      Navigator.of(context).pushNamed('/homeuser');
    }
    else {
      print('login ID:${_user} \nPassword:${_pass}');
      print('ID or password wrong');

    }
  }


  @override
  Widget build(BuildContext context) {

    MediaQueryData queryData = MediaQuery.of(context);

    double screenWidth = queryData.size.width;
    double screenHeight = queryData.size.height;
    Color colorappbar = const Color(0xFF2ac3fe);

    return new Scaffold(
      body: new Container(width: screenWidth,height: screenHeight,
       
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
              Container(
                height: 40,
                margin: EdgeInsets.only(top: 20,left: 20,right: 20),
              child: new Container(child: TextField(
                autocorrect: false,
                decoration: InputDecoration(
                  hintText: 'username',border: InputBorder.none),
                onChanged: (String userinput){
                  setState(() {
                    _user = userinput;
                  });
                },),
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


              Padding(padding: EdgeInsets.only(top: 10,)),

              Container(
                height: 40,
                margin: EdgeInsets.only(top: 20,left: 20,right: 20),
                child: new Container(child: TextField(obscureText: true,autocorrect: false,
                  decoration: InputDecoration(
                      hintText: 'password',border: InputBorder.none),
                  onChanged: (String Passinput)
                  {setState(() {_pass = Passinput;}
                  );
                  },),
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
              /*
              new Padding(
                padding: new EdgeInsets.all(10.0),
                child: new RaisedButton(onPressed: _checklogin, child: new Text('เข้าสู่ระบบ'),

                  padding: EdgeInsets.only(left: 50.0,right: 50.0,bottom: 10,top: 10) ,color:colorappbar,),
              ),
*/
              FlatButton(onPressed: _checklogin,child: Image(image: AssetImage('pic/11.png'),),padding: EdgeInsets.all(8),),
              new Padding(

                padding: new EdgeInsets.all(10.0),
               // child: new FlatButton(onPressed: null, child: new Text('หากลืมรหัสผ่าน',),color: (Colors.red),),
              )
            ],
      ),
      ),

      ),
    );
  }
}
