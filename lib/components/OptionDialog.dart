
import 'package:Malibu/api/Cartitem.dart';
import 'package:Malibu/api/ItemOptionValues.dart';
import 'package:Malibu/api/ProductListJson.dart';
import 'package:Malibu/api/itemOptionData.dart';
import 'package:Malibu/components/AppColors.dart';
import 'package:Malibu/components/OrderSuccessDialog.dart';
import 'package:Malibu/presentation/pages/cart_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

enum MilkOptions { Cream, Almond, Whole, Reduce_fat }
enum Sweetener { Raw, Refined, Agave }
enum Syrups { Caramel, Vanilla, Berry }

class SelectOptionDialog extends StatefulWidget {
  static const String RouteName = '/options';
  SelectOptionDialogArguments data;
  SelectOptionDialog({required this.data});


  @override
  State<StatefulWidget> createState() {
    return _SelectOptionDialog();
  }
}

class _SelectOptionDialog extends State<SelectOptionDialog> {

  List<String> selectedIds = [];

  @override
  void initState() {
    super.initState();
    widget.data.options.forEach((element) {
      selectedIds.add(element.itemOptionData.values[0].id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.home_bg,
      appBar: AppBar(
        elevation: 0,
        title: Text(
          "Choose Options",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
            size: 30.0, color: AppColors.color_3f3c3c, opacity: 10.0),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(child: Padding(
            padding: EdgeInsets.all(15),
            child:   ListView(
              children: List.generate(widget.data.options.length, (index){
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.data.options[index].itemOptionData.name,
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.w800),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ListView(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      children: List.generate(widget.data.options[index].itemOptionData.values.length, (index1) {
                        return  ListTile(
                          title: Text(widget.data.options[index].itemOptionData.values[index1].itemOptionValueData.name, style: TextStyle(color: Colors.black),),
                          leading: Radio(
                            fillColor:
                            MaterialStateProperty.all<Color>(AppColors.app_blue),
                            value: widget.data.options[index].itemOptionData.values[index1].id,
                            groupValue: this.selectedIds[index],
                            onChanged: (String? value) {
                              setState(() {
                                this.selectedIds[index] = value!;
                              });
                            },
                          ),
                        );
                        }
                      ),
                    )
                  ],
                );
              }
              ,
            )
          ),),),
          Align(
            alignment: AlignmentDirectional.bottomCenter,
            child: Padding(
              padding: EdgeInsets.all(10),
              child: ElevatedButton(
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Text("Done",
                        style: TextStyle(fontSize: 18)),
                  ),
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
                            BorderRadius.all(Radius.circular(10)),

                          ))),
                  onPressed: () {
                    this.selectedIds.removeWhere((element) => element=="");
                    print(""+this.selectedIds.toString());
                    widget.data.product.itemData.variations.forEach((element) {
                        if(compareArrays(element.itemVariationData.itemOptionValues, this.selectedIds)){
                          print("variation name: "+element.itemVariationData.name);
                          print(" amount: "+element.itemVariationData.priceMoney.amount.toString());
                          print(" name: "+widget.data.product.itemData.name);
                          print(" image: "+widget.data.product.itemData.imageIds[0]);
                          CartItem item = CartItem(count: widget.data.count,
                              id: element.id,
                              name: widget.data.product.itemData.name,
                              thumbnail: widget.data.product.itemData.thumbnail,
                              price: element.itemVariationData.priceMoney.amount);
                          // Navigator.pop(context);
                          showDialog(
                            context: context,
                            builder: (BuildContext dialogContext) {
                              return  Dialog(
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                    BorderRadius.circular(20.0)),
                                child: CustomProductSelectedDialog(element: item,name:element.itemVariationData.name),);
                            },
                          );
                        }
                      });
                    // Navigator.pushNamed(context, CartPage.RouteName);
                  }),
            ),
          )
        ],
      ),
    );
  }

  bool compareArrays(List<ItemOptionValues> array1, List<String> array2) {

    if (array1.length == array2.length) {
      return array1.every( (value) => array2.contains(value.itemOptionValueId) );
    } else {
      return false;
    }
  }

}

class SelectOptionDialogArguments{
  final List<Objects> options;
  final Objects product;
  final int count;

  SelectOptionDialogArguments(this.product, this.options,this.count);
}
