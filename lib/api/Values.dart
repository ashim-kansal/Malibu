import 'package:Malibu/api/itemOptionData.dart';

class Values {


  Values.fromJson(dynamic json) {
    type = json['type'];
    id = json['id'];
    if(json['item_option_value_data'] != null){
      itemOptionValueData = ItemOptionValueData.fromJson(json['item_option_value_data']);
    }
  }
  String type="";
  String id="";
  late ItemOptionValueData itemOptionValueData;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['type'] = type;
    map['id'] = id;
    if (itemOptionValueData != null) {
      map['item_option_value_data'] = itemOptionValueData.toJson();
    }
    return map;
  }

}
