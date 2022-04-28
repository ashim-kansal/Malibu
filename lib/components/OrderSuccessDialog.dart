import 'package:Malibu/components/AppColors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OrderSuccessDialog extends StatelessWidget {

  OrderSuccessDialog();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 200,
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 30,),
          Image.asset("assets/images/tick.png", width: 130, height: 80,),
          SizedBox(height: 10,),
          Text('Congratulations', style: TextStyle(fontSize: 18, color: Colors.black, fontWeight: FontWeight.w800),),
          SizedBox(height: 10,),
          Text('Your order will be ready in next 20 mins', style: TextStyle(fontSize: 14, color: AppColors.color_727272, fontWeight: FontWeight.w400),),

          // ElevatedButton(
          //     child: Text(" Add To Cart",
          //         style: TextStyle(fontSize: 18)),
          //     style: ButtonStyle(
          //         minimumSize: MaterialStateProperty.all<Size>(
          //             Size.fromHeight(50)),
          //         foregroundColor: MaterialStateProperty.all<Color>(
          //             AppColors.app_blue),
          //         backgroundColor: MaterialStateProperty.all<Color>(
          //             Colors.white),
          //         shape: MaterialStateProperty.all<
          //             RoundedRectangleBorder>(
          //             RoundedRectangleBorder(
          //               borderRadius:
          //               BorderRadius.all(Radius.circular(10)),
          //             ))),
          //     onPressed: () {
          //       showDialog(
          //         context: context,
          //         builder: (BuildContext dialogContext) {
          //           return MyAlertDialog(title: 'Title ', content: 'Dialog content');
          //         },
          //       );
          //       // Navigator.pushNamed(context, CartPage.RouteName);
          //     })
        ],
      ),
    );
  }
}