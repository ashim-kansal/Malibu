/// order : {"location_id":"LNJ205J90XZ5J","line_items":[{"quantity":"2","catalog_object_id":"DCYC2IJZTXS5PVV27RGX4V6O"}]}
/// idempotency_key : "8dd96b26-ce26-4eaf-8a8c-e803115f0635"

class CreateOrderRequest {
  CreateOrderRequest({
    Order? order,
    required String idempotencyKey,
  }) {
    _order = order!;
    _idempotencyKey = idempotencyKey;
  }


  CreateOrderRequest.fromJson(dynamic json) {
    _order = (json['order'] != null ? Order.fromJson(json['order']) : null)!;
    _idempotencyKey = json['idempotency_key'];
  }

  Order? _order;
  String _idempotencyKey="";

  CreateOrderRequest copyWith({
    Order? order,
    required String idempotencyKey,
  }) =>
      CreateOrderRequest(
        order: order ?? _order,
        idempotencyKey: idempotencyKey ?? _idempotencyKey,
      );

  Order get order => _order!;

  String get idempotencyKey => _idempotencyKey;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_order != null) {
      map['order'] = _order!.toJson();
    }
    map['idempotency_key'] = _idempotencyKey;
    return map;
  }
}

/// location_id : "LNJ205J90XZ5J"
/// line_items : [{"quantity":"2","catalog_object_id":"DCYC2IJZTXS5PVV27RGX4V6O"}]

class Order {
  Order({
    required String locationId,
    List<LineItems>? lineItems,
  }) {
    _locationId = locationId;
    _lineItems = lineItems!;
  }

  Order.fromJson(dynamic json) {
    _locationId = json['location_id'];
    id = json['id'];
    if (json['line_items'] != null) {
      _lineItems = [];
      json['line_items'].forEach((v) {
        _lineItems!.add(LineItems.fromJson(v));
      });
    }
  }

  String _locationId="";
  String id="";
  List<LineItems>? _lineItems;


  String get locationId => _locationId;

  List<LineItems> get lineItems => _lineItems!;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['location_id'] = _locationId;
    if (_lineItems != null) {
      map['line_items'] = _lineItems!.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// quantity : "2"
/// catalog_object_id : "DCYC2IJZTXS5PVV27RGX4V6O"

class LineItems {
  LineItems({
    required String quantity,
    required String catalogObjectId,
  }) {
    _quantity = quantity;
    _catalogObjectId = catalogObjectId;
  }

  LineItems.fromJson(dynamic json) {
    _quantity = json['quantity'];
    _catalogObjectId = json['catalog_object_id'];
  }

  String _quantity = "";
  String _catalogObjectId = "";

  String get quantity => _quantity;

  String get catalogObjectId => _catalogObjectId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['quantity'] = _quantity;
    map['catalog_object_id'] = _catalogObjectId;
    return map;
  }
}
