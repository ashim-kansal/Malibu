/// item_option_id : "3OGZQFGQCVPKONJJS2BRHW5X"
/// item_option_value_id : "IO4CQ3EPPBJPNFNUM5ISAAAR"

class ItemOptionValues {
  ItemOptionValues({
      required this.itemOptionId,
    required this.itemOptionValueId});

  ItemOptionValues.fromJson(dynamic json) {
    itemOptionId = json['item_option_id'];
    itemOptionValueId = json['item_option_value_id'];
  }
  String itemOptionId = "";
  String itemOptionValueId = "";

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['item_option_id'] = itemOptionId;
    map['item_option_value_id'] = itemOptionValueId;
    return map;
  }

}