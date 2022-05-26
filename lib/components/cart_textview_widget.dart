

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CartInvoiceText extends StatelessWidget{

  final String name;
  final String amount;
  CartInvoiceText(this.name, this.amount);

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
    child: Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(name,style: TextStyle(color: Colors.black, fontSize: 14),),
        Text('\$ '+amount,style: TextStyle(color: Colors.black, fontSize: 14),),
      ],
    ),);
  }

}