/// item_option_id : "3OGZQFGQCVPKONJJS2BRHW5X"

class ItemOptions {
  ItemOptions({
      required this.itemOptionId});

  ItemOptions.fromJson(dynamic json) {
    itemOptionId = json['item_option_id'];
  }
  String itemOptionId="";


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['item_option_id'] = itemOptionId;
    return map;
  }

}