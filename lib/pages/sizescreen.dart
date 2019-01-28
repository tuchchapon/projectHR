import 'package:flutter/material.dart';

class sizescreen extends StatefulWidget {
  @override
  _sizescreenState createState() => _sizescreenState();
}

class _sizescreenState extends State<sizescreen> {
  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData = MediaQuery.of(context);

    double screenWidth = queryData.size.width;
    double screenHeight = queryData.size.height;
    screenHeight = screenHeight*0.9;
    screenWidth = screenWidth ;
    return Container();
  }

}
