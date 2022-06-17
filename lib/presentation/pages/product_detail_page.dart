
import 'package:Malibu/api/Cartitem.dart';
import 'package:Malibu/api/ProductListJson.dart';
import 'package:Malibu/components/OptionDialog.dart';
import 'package:Malibu/components/OrderSuccessDialog.dart';
import 'package:Malibu/services/Helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:Malibu/components/AppColors.dart';
import 'package:Malibu/components/customized.dart';

class ProductDetailPage extends StatefulWidget {
  static const String RouteName = '/productDetail';

  ProductDetailArguments data;
  ProductDetailPage({required this.data});


  @override
  State<StatefulWidget> createState() {
    return ProductDetailPageState();
  }
}

class ProductDetailPageState extends State<ProductDetailPage> {
  int count = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.home_bg,
        body: Stack(
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 40,
                ),
                SizedBox(
                  height: 250,
                  child: CustomizedPageView(widget.data.product.itemData.imageIds),
                ),
                Expanded(
                  child:Padding(
                    padding: EdgeInsets.fromLTRB(16,0,16,10),
                    child:MediaQuery.removePadding(context: context,
                        removeTop:true,child:  ListView(
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          children: [
                            Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              elevation: 0,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  ListTile(
                                    title: Padding(
                                      padding: const EdgeInsets.only(bottom: 5.0),
                                      child: Text(
                                        widget.data.product.itemData.name,
                                        style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                    subtitle: Text(
                                      '\$'+(widget.data.product.itemData.variations[0].itemVariationData.priceMoney.amount/100).toString(),
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            // TextDetailWidget1('Categories',
                            //     'AFFORDABLE GIFT BOXES UNDER \$50, BEST SELLERS, CUSTOMIZED GIFT BOXES, GET WELL, GOURMET FOOD GIFTS, GOURMET TRUFFLES, LUXURY CHOCOLATE TRUFFLE GIFT BOXES & MORE, LUXURY GIFT IDEAS UNDER \$100, VALENTINE’S DAY DESSERT BOXES'),
                            // TextDetailWidget1('TAGS',
                            //     'CHOCOLATES, DARK CHOCOLATE, GIFTS, GOURMET COFFEE, LUXURIOUS GIFT BOXES'),
                            TextDetailWidget1('Description',
                                widget.data.product.itemData.description),
                          ],
                        )),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  color: AppColors.app_blue,
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 35.0,
                          height: 35.0,
                          child: RawMaterialButton(
                            onPressed: () {
                              if (this.count > 1)
                                setState(() {
                                  this.count = this.count - 1;
                                });
                            },
                            fillColor: Colors.white,
                            child: Icon(
                              Icons.remove,
                              size: 30.0,
                              color: AppColors.app_rating,
                            ),
                            shape: CircleBorder(),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          this.count.toString(),
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        SizedBox(
                          width: 35.0,
                          height: 35.0,
                          child: RawMaterialButton(
                            onPressed: () {
                              setState(() {
                                this.count = this.count + 1;
                              });
                            },
                            fillColor: Colors.white,
                            child: Icon(
                              Icons.add,
                              size: 30.0,
                              color: AppColors.app_rating,
                            ),
                            shape: CircleBorder(),
                          ),
                        ),
                        SizedBox(
                          width: 25,
                        ),
                        Flexible(
                          flex: 1,
                          child: ElevatedButton(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.shopping_cart_outlined,
                                    size: 25.0,
                                    color: AppColors.app_blue,
                                  ),
                                  Text(" Add To Cart",
                                      style: TextStyle(fontSize: 18))
                                ],
                              ),
                              style: ButtonStyle(
                                  minimumSize: MaterialStateProperty.all<Size>(
                                      Size.fromHeight(50)),
                                  foregroundColor: MaterialStateProperty.all<Color>(
                                      AppColors.app_blue),
                                  backgroundColor: MaterialStateProperty.all<Color>(
                                      Colors.white),
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                        borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                      ))),
                              onPressed: () {
                                if(widget.data.options.isNotEmpty){
                                  var arg = SelectOptionDialogArguments(widget.data.product, widget.data.options, count);
                                  // Navigator.pop(context);
                                  // Navigator.pop(context);
                                  Navigator.pushNamed(context, SelectOptionDialog.RouteName, arguments: arg);
                                }else {
                                  Helper.addItemInCart(CartItem(count: this.count,
                                    id: widget.data.product.itemData.variations[0].id,
                                    name: widget.data.product.itemData.name,
                                    thumbnail: widget.data.product.itemData.thumbnail,
                                    price: widget.data.product.itemData.variations[0].itemVariationData.priceMoney.amount,
                                  ));

                                  showDialog(
                                    context: context,
                                    builder: (BuildContext dialogContext) {
                                      return  Dialog(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                            BorderRadius.circular(20.0)),
                                        child: AddedToCartDialog(),);
                                    },
                                  );
                                  // Navigator.pushNamed(
                                  //     context, CartPage.RouteName);
                                }
                              }),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.fromLTRB(0, 60, 0, 0),
                child: RawMaterialButton(
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  padding: EdgeInsets.all(10),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  fillColor: Colors.white,
                  child: Icon(
                    Icons.arrow_back,
                    size: 25.0,
                    color: AppColors.app_blue,
                  ),
                  shape: CircleBorder(),
                ),
              ),
            )
          ],
        ));
  }
}

class TextDetailWidget1 extends StatelessWidget {
  TextDetailWidget1(this.title, this.desc);

  final String title;
  final String desc;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,

      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            minVerticalPadding: 10,
            title: Padding(
                padding: const EdgeInsets.only(bottom: 5.0),
                child:Text(
                  this.title,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                )),
            subtitle: Text(
              this.desc,
              style: TextStyle(
                  color: AppColors.color_575050,
                  fontSize: 12,
                  fontWeight: FontWeight.w400),
            ),
          ),
        ],
      ),
    );
  }
}

Widget circleBar(bool isActive) {
  return AnimatedContainer(
    duration: Duration(milliseconds: 150),
    margin: EdgeInsets.symmetric(horizontal: 8),
    height: isActive ? 12 : 8,
    width: isActive ? 12 : 8,
    decoration: BoxDecoration(
        color: isActive ? Colors.blue[700] : Colors.grey,
        borderRadius: BorderRadius.all(Radius.circular(12))),
  );
}

class ProductDetailArguments{
  final List<Objects> options;
  final Objects product;

  ProductDetailArguments(this.product, this.options);
}
