import 'dart:io';
import 'dart:ui';

import 'package:Malibu/api/Cartitem.dart';
import 'package:Malibu/api/ProductAPIServices.dart';
import 'package:Malibu/components/OrderSuccessDialog.dart';
import 'package:Malibu/config.dart';
import 'package:Malibu/services/Helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:Malibu/components/AppColors.dart';
import 'package:Malibu/components/DashedLinePainter.dart';
import 'package:Malibu/components/cart_textview_widget.dart';
import 'package:Malibu/components/customlist.dart';
import 'package:Malibu/components/item_card.dart';

import 'package:square_in_app_payments/models.dart';
import 'package:square_in_app_payments/in_app_payments.dart';
import 'package:Malibu/api/PaymentAPIServices.dart';

class CartPage extends StatefulWidget {

  static const String RouteName = '/cart';

  const CartPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return CartPageState();
  }
}

class CartPageState extends State<CartPage> {

  List<CartItem> items = [];
  double sum = 0.0;
  bool inProgress = false;

  String orderId="";

  @override
  void initState() {
    super.initState();
    getCartItems();
    _initSquarePayment();
  }

  Future<void> _initSquarePayment() async {
    // Initialized square_in_app_payment
    await InAppPayments.setSquareApplicationId(squareApplicationId);

    // set card entry theme for iOS
    if(Platform.isIOS){
      await  _setIOSCardEntryTheme();
    }
  }

  // Method to set the theme for card entry
  Future _setIOSCardEntryTheme() async {
    var themeConfiguationBuilder = IOSThemeBuilder();
    themeConfiguationBuilder.saveButtonTitle = 'Pay';
    themeConfiguationBuilder.errorColor = RGBAColorBuilder()
      ..r = 255
      ..g = 0
      ..b = 0;
    themeConfiguationBuilder.tintColor = RGBAColorBuilder()
      ..r = 36
      ..g = 152
      ..b = 141;
    themeConfiguationBuilder.keyboardAppearance = KeyboardAppearance.light;
    themeConfiguationBuilder.messageColor = RGBAColorBuilder()
      ..r = 114
      ..g = 114
      ..b = 114;

    await InAppPayments.setIOSCardEntryTheme(themeConfiguationBuilder.build());
  }

  // Method for start the card entry flow
  Future _onStartCardEntryFlow() async {

    if(sum <= 0){
      return false;
    }

    await InAppPayments.startCardEntryFlow(
        onCardNonceRequestSuccess: _onCardEntryCardNonceRequestSuccess,
        onCardEntryCancel: () => {},
        collectPostalCode: true);
  }

  void _onCardEntryCardNonceRequestSuccess(CardDetails result) async {
    print("success payment"+this.orderId);
    try {
      var res = await createPayment(sum, result.nonce);
      print(res);

      var paymentId = res["payment"]["id"];
      print("paymentId: - "+ paymentId.toString());
      Helper.clearCart();
      payOrder(paymentId.toString(), this.orderId).then((value) => {
        if (value != null)
          {
            print("id::"+value),
                showDialog(
                  context: context,
                  builder: (BuildContext dialogContext) {
                    return Dialog(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                      child: OrderSuccessDialog(),
                    );
                  },
                )
              }
      });
      // Navigator.pop(context);

      InAppPayments.completeCardEntry(
          onCardEntryComplete: _onCardEntryComplete);
    } catch (ex) {
      print("exception error>>"+ ex.toString());
      InAppPayments.showCardNonceProcessingError(ex.toString());
    }
  }

  void _showUrlNotSetAndPrintCurlCommand(String nonce,
      {String? verificationToken}) {
    String title;
    if (verificationToken != null) {
      title = "Nonce and verification token generated but not charged";
    } else {
      title = "Nonce generated but not charged";
    }

    print(title +"error");   
  }


void _onCardEntryComplete() {
      print("Card entry completed..!");
  }


  @override
  Widget build(BuildContext context) {
    if(items.length > 0) {
      sum = 0;
      items.forEach((element) =>
      sum = sum + (element.count * (element.price / 100))
      );
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        title: Text(
          "My Cart",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
            size: 30.0, color: AppColors.color_3f3c3c, opacity: 10.0),
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
                      margin: const EdgeInsets.fromLTRB(55.0, 12, 55, 12),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 16,
                            width: 16,
                            decoration: new BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                  width: 1, color: AppColors.app_rating),
                            ),
                            child: Icon(
                              Icons.check_circle,
                              size: 14,
                              color: AppColors.app_rating,
                            ),
                          ),
                          Container(
                            margin:
                                const EdgeInsets.only(left: 5.0, right: 5.0),
                            child: Text(
                              'Cart',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 12),
                            ),
                          ),
                          Container(
                              width: MediaQuery.of(context).size.width / 7,
                              margin:
                                  const EdgeInsets.only(left: 0.0, right: 5.0),
                              child: Divider(
                                color: Colors.black,
                                height: 15,
                              )),

                          Container(
                            height: 24,
                            width: 16,
                            decoration: new BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(width: 1, color: Colors.black),
                            ),
                            child: Container(),
                          ),
                          Container(
                            margin:
                                const EdgeInsets.only(left: 5.0, right: 5.0),
                            child: Text(
                              'Payment',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 12),
                            ),
                          ),
                        ],
                      )),
                  Container(
                    height: 1,
                    color: AppColors.color_cfd7e3,
                  )
                ],
              ),
            ),
            Expanded(
                child: items.length > 0
                    ? ListView.separated(
                        itemBuilder: (BuildContext, index) {
                          return ItemCartCard(
                            item: items[index],
                            onAddClick: () {
                              setState(() {
                                items[index].count = items[index].count+1;
                              });
                              Helper.updateItemCountInCart(items);
                            },
                            onMinusClick: () {
                              if(items[index].count==1){
                                setState(() {
                                  items.removeAt(index);
                                });
                                Helper.updateItemCountInCart(items);
                              }else {
                                setState(() {
                                  items[index].count = items[index].count - 1;
                                });
                                Helper.updateItemCountInCart(items);                              }
                            },
                          );
                        },
                        separatorBuilder: (BuildContext, index) {
                          return Divider(height: 6);
                        },
                        itemCount: items.length,
                        shrinkWrap: true,
                        padding: EdgeInsets.all(5),
                        scrollDirection: Axis.vertical,
                      )
                    : Container(
                        child: Center(
                        child: inProgress?CircularProgressIndicator(): Text("No Item in the cart", style: TextStyle(fontSize: 16, color: Colors.black),),
                      ))),
            Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: [

                  CartInvoiceText("Subtotal", sum.toString()),
                  SizedBox(
                    height: 5,
                  ),
                  CustomPaint(
                      painter: DashedLinePainter(),
                      size: Size(MediaQuery.of(context).size.width - 32, 5)),
                  // CartInvoiceText(),
                  // SizedBox(height: 5,),
                  // CustomPaint(painter: DashedLinePainter(), size: Size(MediaQuery.of(context).size.width-32,5)),
                  CartInvoiceText("Total", sum.toString()),
                  Padding(
                    padding: EdgeInsets.fromLTRB(16, 10, 16, 0),
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
                          child: Image.asset(
                            'assets/images/ic_coupon.jpg',
                            alignment: Alignment.centerRight,
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.all(16),
                      child: ElevatedButton(
                          child: Text("Place Order",
                              style: TextStyle(fontSize: 18)),
                          style: ButtonStyle(
                              minimumSize: MaterialStateProperty.all<Size>(
                                  Size.fromHeight(50)),
                              foregroundColor: MaterialStateProperty.all<Color>(
                                  Colors.white),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  AppColors.app_blue),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                              ))),
                          onPressed: () => {
                            createMyOrder(items)
                              }))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void getCartItems() {
    setState(() {
      this.inProgress = true;
    });
    Helper.getItemsFromCart().then((value) => {
          if (value != null)
            {
              setState(() {
                this.inProgress=false;
                this.items = value;
              })
            }
        });
  }

  void createMyOrder(List<CartItem> items) {
    print("hhhhh"+this.orderId);
    createOrder(items).then((value) => {
      if (value != null)
        {
          print("id::"+value.id),
        _onStartCardEntryFlow(),

        setState(() {
            this.orderId = value.id;
          })
        }
    });
  }
}

class CartList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CartListState();
  }
}

class _CartListState extends State<CartList> {
  List<CartItem> items = [];

  @override
  void initState() {
    super.initState();
    getCartItems();
  }

  @override
  Widget build(BuildContext context) {
    if (items.length > 0)
      return ListView.separated(
        itemBuilder: (BuildContext, index) {
          return ItemCartCard(
            item: items[index],
            onAddClick: () {
              items[index].count++;
            },
            onMinusClick: () {
              items[index].count--;
            },
          );
        },
        separatorBuilder: (BuildContext, index) {
          return Divider(height: 6);
        },
        itemCount: items.length,
        shrinkWrap: true,
        padding: EdgeInsets.all(5),
        scrollDirection: Axis.vertical,
      );
    else
      return Container(
          child: Center(
        child: CircularProgressIndicator(),
      ));
  }

  void getCartItems() {
    Helper.getItemsFromCart().then((value) => {
          if (value != null)
            {
              setState(() {
                this.items = value;
              })
            }
        });
  }



}
