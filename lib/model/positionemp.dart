class Position {
  List<Data> data;
  String message;

  Position({
    this.data,
    this.message,
  });
  factory Position.fromJson(Map<String, dynamic> parsedJson){
    var list = parsedJson['data'] as List;
   // print(list.runtimeType);
    List<Data> dataList = list.map((i) => Data.fromJson(i)).toList();


    return Position(
        data: dataList
    );
  }
}

class Data {
  int id;
  String positionName;

  Data({
    this.id,
    this.positionName,
  });
  factory Data.fromJson(Map<String, dynamic> json) => new Data(
    id: json["id"],
    positionName: json["position_name"],
  );
}
