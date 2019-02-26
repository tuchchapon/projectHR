
import 'dart:convert';

ChartPosition chartPositionFromJson(String str) {
  final jsonData = json.decode(str);
  return ChartPosition.fromJson(jsonData);
}

String chartPositionToJson(ChartPosition data) {
  final dyn = data.toJson();
  return json.encode(dyn);
}

class ChartPosition {
  List<Datum> data;
  int allPosition;

  ChartPosition({
    this.data,
    this.allPosition,
  });

  factory ChartPosition.fromJson(Map<String, dynamic> json) => new ChartPosition(
    data: new List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    allPosition: json["all_position"],
  );

  Map<String, dynamic> toJson() => {
    "data": new List<dynamic>.from(data.map((x) => x.toJson())),
    "all_position": allPosition,
  };
}

class Datum {
  String label;
  int value;

  Datum({
    this.label,
    this.value,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => new Datum(
    label: json["label"],
    value: json["value"],
  );

  Map<String, dynamic> toJson() => {
    "label": label,
    "value": value,
  };
}
