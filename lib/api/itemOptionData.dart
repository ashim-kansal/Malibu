import 'package:Malibu/api/Values.dart';

/// name : "Sweeteners"
/// display_name : "Sweeteners"
/// show_colors : false
/// values : [{"type":"ITEM_OPTION_VAL","id":"2OCTYZVUNNDBSG3PVPLVG5LU","version":1652119521258,"item_option_value_data":{"item_option_id":"AMQ2X3CVM5HYGIAIQBXRLBZD","name":"Raw Sugar","ordinal":0}},{"type":"ITEM_OPTION_VAL","id":"B7HXSYNTPZLJJPR7RBDN6VRP","version":1652119521258,"item_option_value_data":{"item_option_id":"AMQ2X3CVM5HYGIAIQBXRLBZD","name":"Refined Sugar","ordinal":1}},{"type":"ITEM_OPTION_VAL","id":"KXBNLDTX4TD6SEIKMNEEJZFS","version":1652119521258,"item_option_value_data":{"item_option_id":"AMQ2X3CVM5HYGIAIQBXRLBZD","name":"Agave","ordinal":2}}]

class ItemOptionData {

  // ItemOptionData({
  //     required this.name,
  //   required this.displayName,
  //   required this.showColors,
  //   required this.values})

  ItemOptionData.fromJson(dynamic json) {
    name = json['name'];
    displayName = json['display_name'];
    showColors = json['show_colors'];
    if (json['values'] != null) {
      values = [];
      json['values'].forEach((v) {
        values.add(Values.fromJson(v));
      });
    }
  }
  String name="";
  String displayName="";
  bool showColors=false;
  List<Values> values = [];

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['display_name'] = displayName;
    map['show_colors'] = showColors;
    if (values != null) {
      map['values'] = values.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// type : "ITEM_OPTION_VAL"
/// id : "2OCTYZVUNNDBSG3PVPLVG5LU"
/// version : 1652119521258
/// item_option_value_data : {"item_option_id":"AMQ2X3CVM5HYGIAIQBXRLBZD","name":"Raw Sugar","ordinal":0}


/// item_option_id : "AMQ2X3CVM5HYGIAIQBXRLBZD"
/// name : "Raw Sugar"
/// ordinal : 0

class ItemOptionValueData {

  ItemOptionValueData({
    required this.itemOptionId,
      required this.name}){
    itemOptionId = itemOptionId;
    name = name;
}

  ItemOptionValueData.fromJson(dynamic json) {
    itemOptionId = json['item_option_id'];
    name = json['name'];
  }
  String itemOptionId="";
  String name = "";


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['item_option_id'] = itemOptionId;
    map['name'] = name;
    return map;
  }

}