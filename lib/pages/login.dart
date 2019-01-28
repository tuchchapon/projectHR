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
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('ระบบจัดการทรัพยากรมนุษย์'),
      ),

      body: new Container(
        padding: new EdgeInsets.all(20.0),
        child: new Center(
          child: new Column(
            children: <Widget>[
              new TextField(
                decoration: new InputDecoration(labelText: 'Username'),
                onChanged: (String userinput){
                  setState(() {
                    _user = userinput;
                  });
              }
              ),
              new TextField(
                decoration: new InputDecoration(labelText: 'Password'),
                onChanged: (String passinput){
                  setState(() {
                    _pass = passinput;
                  });
                },
                obscureText: true,

              ),
              new Padding(
                padding: new EdgeInsets.all(10.0),
                child: new RaisedButton(onPressed: _checklogin, child: new Text('เข้าสู่ระบบ'),

                  padding: EdgeInsets.only(left: 60.0,right: 60.0) ,color: (Colors.blue),),
              ),
              new Padding(
                padding: new EdgeInsets.all(10.0),
                child: new FlatButton(onPressed: null, child: new Text('หากลืมรหัสผ่าน',),color: (Colors.red),),
              )
            ],
      ),
      ),

      ),
    );
  }
}
