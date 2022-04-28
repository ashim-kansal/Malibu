import 'package:Malibu/components/AppColors.dart';
import 'package:Malibu/presentation/pages/cart_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

enum MilkOptions { Cream, Almond, Whole, Reduce_fat }
enum Sweetener { Raw, Refined, Agave }
enum Syrups { Caramel, Vanilla, Berry }

class SelectOptionDialog extends StatefulWidget {
  static const String RouteName = '/options';

  @override
  State<StatefulWidget> createState() {
    return _SelectOptionDialog();
  }
}

class _SelectOptionDialog extends State<SelectOptionDialog> {
  MilkOptions _milkOptions = MilkOptions.Whole;
  Sweetener _sweetener = Sweetener.Raw;
  Syrups _syrups = Syrups.Caramel;

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
              children: [
                Text(
                  'Milk Options',
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.w800),
                ),
                SizedBox(
                  height: 10,
                ),
                ListTile(
                  title: const Text('Whole Dairy Milk', style: TextStyle(color: Colors.black)),
                  leading: Radio(
                    fillColor:
                    MaterialStateProperty.all<Color>(AppColors.app_blue),
                    value: MilkOptions.Whole,
                    groupValue: _milkOptions,
                    onChanged: (MilkOptions? value) {
                      setState(() {
                        this._milkOptions = value!;
                      });
                    },
                  ),
                ),
                ListTile(
                  title: const Text('Reduced Fat Dairy Milk', style: TextStyle(color: Colors.black)),
                  leading: Radio(
                    fillColor:
                    MaterialStateProperty.all<Color>(AppColors.app_blue),
                    value: MilkOptions.Reduce_fat,
                    groupValue: _milkOptions,
                    onChanged: (MilkOptions? value) {
                      setState(() {
                        this._milkOptions = value!;
                      });
                    },
                  ),
                ),
                ListTile(
                  title: const Text('Dairy Cream', style: TextStyle(color: Colors.black)),
                  leading: Radio(
                    fillColor:
                    MaterialStateProperty.all<Color>(AppColors.app_blue),
                    value: MilkOptions.Cream,
                    groupValue: _milkOptions,
                    onChanged: (MilkOptions? value) {
                      setState(() {
                        this._milkOptions = value!;
                      });
                    },
                  ),
                ),
                ListTile(
                  title: const Text('Almond Milk', style: TextStyle(color: Colors.black)),
                  leading: Radio(
                    fillColor:
                    MaterialStateProperty.all<Color>(AppColors.app_blue),
                    value: MilkOptions.Almond,
                    groupValue: _milkOptions,
                    onChanged: (MilkOptions? value) {
                      setState(() {
                        this._milkOptions = value!;
                      });
                    },
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Sweeteners',
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.w800),
                ),
                SizedBox(
                  height: 10,
                ),
                ListTile(
                  title: const Text('Raw Sugar', style: TextStyle(color: Colors.black)),
                  leading: Radio(
                    fillColor:
                    MaterialStateProperty.all<Color>(AppColors.app_blue),
                    value: Sweetener.Raw,
                    groupValue: _sweetener,
                    onChanged: (Sweetener? value) {
                      setState(() {
                        this._sweetener = value!;
                      });
                    },
                  ),
                ),
                ListTile(
                  title: const Text('Refined Sugar', style: TextStyle(color: Colors.black)),
                  leading: Radio(
                    fillColor:
                    MaterialStateProperty.all<Color>(AppColors.app_blue),
                    value: Sweetener.Refined,
                    groupValue: _sweetener,
                    onChanged: (Sweetener? value) {
                      setState(() {
                        this._sweetener = value!;
                      });
                    },
                  ),
                ),
                ListTile(
                  title: const Text('Agave', style: TextStyle(color: Colors.black)),
                  leading: Radio(
                    fillColor:
                    MaterialStateProperty.all<Color>(AppColors.app_blue),
                    value: Sweetener.Agave,
                    groupValue: _sweetener,
                    onChanged: (Sweetener? value) {
                      setState(() {
                        this._sweetener = value!;
                      });
                    },
                  ),
                ),
                Text(
                  'Gourmet Syrups',
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.w800),
                ),
                SizedBox(
                  height: 10,
                ),
                ListTile(
                  title: const Text('Caramel', style: TextStyle(color: Colors.black)),
                  leading: Radio(
                    fillColor:
                    MaterialStateProperty.all<Color>(AppColors.app_blue),
                    value: Syrups.Caramel,
                    groupValue: _syrups,
                    onChanged: (Syrups? value) {
                      setState(() {
                        this._syrups = value!;
                      });
                    },
                  ),
                ),
                ListTile(
                  title: const Text('Vanilla', style: TextStyle(color: Colors.black)),
                  leading: Radio(
                    fillColor:
                    MaterialStateProperty.all<Color>(AppColors.app_blue),
                    value: Syrups.Vanilla,
                    groupValue: _syrups,
                    onChanged: (Syrups? value) {
                      setState(() {
                        this._syrups = value!;
                      });
                    },
                  ),
                ),
                ListTile(
                  title: const Text('Berry', style: TextStyle(color: Colors.black),),
                  leading: Radio(
                    fillColor:
                    MaterialStateProperty.all<Color>(AppColors.app_blue),
                    value: Syrups.Berry,
                    groupValue: _syrups,
                    onChanged: (Syrups? value) {
                      setState(() {
                        this._syrups = value!;
                      });
                    },
                  ),
                ),
              ],
            )
          ),),
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
                    Navigator.pushNamed(context, CartPage.RouteName);
                  }),
            ),
          )
        ],
      ),
    );
  }
}
