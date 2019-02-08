import 'package:flutter/material.dart';


class Branch {
  int createdAt;
  int updatedAt;
  int id;
  String branchName;
  String branchAddress;
  int status;

  Branch({
    this.createdAt,
    this.updatedAt,
    this.id,
    this.branchName,
    this.branchAddress,
    this.status,
  });

  factory Branch.fromJson(Map<String, dynamic> json) => new Branch(
    createdAt: json["createdAt"],
    updatedAt: json["updatedAt"],
    id: json["id"],
    branchName: json["branch_name"],
    branchAddress: json["branch_address"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "createdAt": createdAt,
    "updatedAt": updatedAt,
    "id": id,
    "branch_name": branchName,
    "branch_address": branchAddress,
    "status": status,
  };
}
class DetailScreen extends StatelessWidget {
  Color colorappbar = const Color(0xFF2ac3fe);


  final  Branch branch;

  DetailScreen({Key key,  this.branch}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData = MediaQuery.of(context);

    double screenWidth = queryData.size.width;
    double screenHeight = queryData.size.height;
    return Scaffold(
      appBar: AppBar(backgroundColor: colorappbar,
        title: Text('ข้อมูลสาขา',style: TextStyle(color: Colors.brown[500]),),
      ),
      body: Container(margin: EdgeInsets.all(5),height:screenHeight ,width: screenWidth,
        padding: EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            children: <Widget>[
              ListTile(
                leading: Text('ชื่อสาขา ',style: TextStyle(fontSize: 16),),
                title: Text(branch.branchName,style: TextStyle(fontSize: 16),),
              ),
              ListTile(
                leading: Text('ที่อยู่       ',style: TextStyle(fontSize: 16),),
                title: Text(branch.branchAddress,style: TextStyle(fontSize: 16),),
              ),
              Padding(padding: EdgeInsets.all(5)),
              ListTile(
                leading: Text('รายการค่าใช้จ่ายของสาขา',style: TextStyle(fontSize: 14),),
                trailing: FlatButton(onPressed: (){Navigator.of(context).pushNamed('/cost');}, child: Text('จัดการค่าใช่จ่าย >',style: TextStyle(fontSize: 14,color: Colors.grey),)),
              ),
              ListTile(
                leading: Text('ค่าใช้จ่ายทั่วไป',style: TextStyle(fontSize: 14),),
               
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                Text('รายการ'),
                Text('มูลค่า')
              ],),
              Padding(padding: EdgeInsets.all(5)),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('ค่าเช่าออฟฟิศ',style: TextStyle(color: Colors.grey),),
                  Text('30000 ',style: TextStyle(color: Colors.grey))
                ],),
              Padding(padding: EdgeInsets.all(2)),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('ค่าเช่าออฟฟิศ',style: TextStyle(color: Colors.grey),),
                  Text('30000 ',style: TextStyle(color: Colors.grey))
                ],),
              Padding(padding: EdgeInsets.all(2)),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('ค่าเช่าออฟฟิศ',style: TextStyle(color: Colors.grey),),
                  Text('30000 ',style: TextStyle(color: Colors.grey))
                ],),
              ListTile(
                leading: Text('ค่าใช้จ่ายอื่นๆ',style: TextStyle(fontSize: 14),),
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('รายการ'),
                  Text('มูลค่า')
                ],),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('ค่าซ่อมท่อน้ำ',style: TextStyle(color: Colors.grey),),
                  Text('450 ',style: TextStyle(color: Colors.grey))
                ],),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('ค่าเน็ต',style: TextStyle(color: Colors.grey),),
                  Text('10000 ',style: TextStyle(color: Colors.grey))
                ],),
            ],
          ),
        )

      ),
    );
  }
}


class ListViewPosts extends StatelessWidget {
  final List<Branch> posts;

  ListViewPosts({Key key, this.posts}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
          itemCount: posts.length,
          itemBuilder: (context, index) {
            return Column(
              children: <Widget>[
                ListTile(
                  title: Text('${posts[index].branchName}',),
                  subtitle: Text('${posts[index].branchAddress}',),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailScreen(branch: posts[index]),
                      ),
                    );
                  },
                ),
                Divider(color: Colors.grey,)
              ],
            );
          }),
    );
  }

}