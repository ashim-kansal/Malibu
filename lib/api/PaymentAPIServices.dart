import 'dart:collection';
import 'dart:io';

import 'package:Malibu/config.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:uuid/uuid.dart';
var uuid = Uuid();
class PaymentAPIServices {

}

  Future createPayment(amount, sourceId) async {

    // Map<String, dynamic> map = HashMap();
    // map.putIfAbsent("object_ids", () => {ids});
    final String url = squareHost + "v2/payments";
    final response = await
    http.post(Uri.parse(url),
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
          HttpHeaders.authorizationHeader : "bearer "+squareAccessToken_sandbox
        },
      body: jsonEncode({
         "amount_money": {
          "amount": amount,
          "currency": "USD"
        },
        "idempotency_key": uuid.v4(),
        "source_id": sourceId
      })
    );
    print(response.body);
    var responseBody = json.decode(response.body);
    if (response.statusCode == 200) {
      return response;
    } else {
      throw responseBody["errorMessage"];
    }
  }
