import 'dart:ui';

import 'package:Malibu/components/OrderSuccessDialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:Malibu/components/AppColors.dart';
import 'package:Malibu/components/DashedLinePainter.dart';
import 'package:Malibu/components/cart_textview_widget.dart';
import 'package:Malibu/components/customlist.dart';
import 'package:Malibu/components/item_card.dart';

class CartPage extends StatelessWidget {
  static const String RouteName = '/cart';

  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        title: Text("My Cart", style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
            size: 30.0,
            color: AppColors.color_3f3c3c,
            opacity: 10.0
        ),
        actions: <Widget>[
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {},
                child: Icon(
                  Icons.search,
                  size: 26.0,
                ),
              )
          )
        ],
      ),

      body: Container(
        color: AppColors.home_bg,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              height: 50,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                      margin: const EdgeInsets.fromLTRB(55.0, 12,55,12),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 16,
                            width: 16,
                            decoration: new BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(width: 1, color: AppColors.app_rating),
                            ),
                            child: Icon(
                                  Icons.check_circle,
                              size: 14,
                              color: AppColors.app_rating,
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(left: 5.0, right: 5.0),
                            child: Text('Cart', style: TextStyle(color: Colors.black, fontSize: 12),),),
                          Container(
                              width: MediaQuery.of(context).size.width/7,
                              margin: const EdgeInsets.only(left: 0.0, right: 5.0),
                              child: Divider(
                                color: Colors.black,
                                height: 15,
                              )
                          ),
                          // Expanded(
                          //   child:,
                          // ),
                          // Container(
                          //   height: 16,
                          //   width: 16,
                          //   decoration: new BoxDecoration(
                          //     shape: BoxShape.circle,
                          //     border: Border.all(width: 1, color: Colors.black),
                          //   ),
                          //   child: Container(),
                          // ),
                          // Container(
                          //   margin: const EdgeInsets.only(left: 5.0, right: 5.0),
                          //   child: Text('Address', style: TextStyle(color: Colors.black, fontSize: 12),),),
                          // Expanded(
                          //   child:Container(
                          //       margin: const EdgeInsets.only(left: 0.0, right: 5.0),
                          //       child: Divider(
                          //         color: Colors.black,
                          //         height: 15,
                          //
                          //       )),),
                          Container(
                            height: 24,
                            width: 16,
                            decoration: new BoxDecoration(shape: BoxShape.circle,
                              border: Border.all(width: 1, color: Colors.black),
                            ),
                            child: Container(),
                          ),
                          Container(
                            margin: const EdgeInsets.only(left: 5.0, right: 5.0),
                            child: Text('Payment', style: TextStyle(color: Colors.black, fontSize: 12),),),
                        ],
                      )
                  ),
                  Container(
                    height: 1,
                    color: AppColors.color_cfd7e3,
                  )
                ],
              ),
            ),
            Expanded(
                child: CartList(),
              ),

            Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: [
                  CartInvoiceText(),
                  SizedBox(height: 5,),
                  CustomPaint(painter: DashedLinePainter(), size: Size(MediaQuery.of(context).size.width-32,5)),
                  CartInvoiceText(),
                  SizedBox(height: 5,),
                  CustomPaint(painter: DashedLinePainter(), size: Size(MediaQuery.of(context).size.width-32,5)),
                  CartInvoiceText(),
                  Padding(
                    padding: EdgeInsets.fromLTRB(16, 10,16,0),
                    child: Stack(
                      children: [
                        TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Apply Coupon',
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          heightFactor: 4,
                          widthFactor: 13,
                          child: Image.asset('assets/images/ic_coupon.jpg', alignment: Alignment.centerRight,),
                        )
                      ],
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(16),
                      child: ElevatedButton(

                          child:Text(
                              "Place Order",
                              style: TextStyle(fontSize: 18)
                          ),
                          style: ButtonStyle(
                              minimumSize: MaterialStateProperty.all<Size>(Size.fromHeight(50)),
                              foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                              backgroundColor: MaterialStateProperty.all<Color>(AppColors.app_blue),
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(8)),
                                  )
                              )
                          ),
                          onPressed: () => {
                          showDialog(
                          context: context,
                          builder: (BuildContext dialogContext) {
                          return  Dialog(
                          shape: RoundedRectangleBorder(
                          borderRadius:
                          BorderRadius.circular(20.0)),
                          child: OrderSuccessDialog(),);
                          },
                          )
                          })
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CartList extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    return _CartListState();
  }
}

class _CartListState extends State<CartList>{

  List<String> images = [
    "Sea Salt Browned Butter Cookie",
    "Malibu Campfire Coffee Mug",
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (BuildContext, index){
        return ItemCartCard();
      },
      separatorBuilder: (BuildContext, index){
        return Divider(height: 6);
      },
      itemCount: images.length,
      shrinkWrap: true,
      padding: EdgeInsets.all(5),
      scrollDirection: Axis.vertical,
    );
  }
}
