

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CartInvoiceText extends StatelessWidget{

  CartInvoiceText(){

  }
  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
    child: Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('Subtotal',style: TextStyle(color: Colors.black, fontSize: 14),),
        Text('\$ 35.60',style: TextStyle(color: Colors.black, fontSize: 14),),
      ],
    ),);
  }

}