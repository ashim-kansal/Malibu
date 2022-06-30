import 'dart:async';

import 'package:Malibu/components/AppColors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeCardWidget extends StatefulWidget {

  @override
  _HomeCardWidgetState createState() => _HomeCardWidgetState();
}

class _HomeCardWidgetState extends State<HomeCardWidget> {
  int currentPage = 0;
  List<String> images=[];
  Timer? _timer;
  PageController _pageController = PageController(
    initialPage: 0,
  );
  @override
  void initState() {
    super.initState();
    images.add('assets/images/slide1.png');
    images.add('assets/images/slide2.png');
    images.add('assets/images/slide3.png');
    images.add('assets/images/slide4.png');

    _timer = Timer.periodic(Duration(seconds: 3), (Timer timer) {
      if (currentPage < 3) {
        currentPage++;
      } else {
        currentPage = 0;
      }

      _pageController.animateToPage(
        currentPage,
        duration: Duration(milliseconds: 350),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  void dispose() {
    super.dispose();
    _timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
      return
        Stack(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height * 0.22,
              child: DecoratedBox(
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(26),
                        bottomRight: Radius.circular(26)),
                    color: AppColors.app_black),
                child: Container(),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.40,
              child: Padding(
                padding: EdgeInsets.fromLTRB(10,20,10,20),
                child: Column(children: <Widget>[
                  Container(
                      height: 200,
                      child:  PageView.builder(
                          itemCount: images.length,
                          allowImplicitScrolling: true,

                          onPageChanged: (int page) {
                            setState(() {
                              currentPage = page;
                            });
                          },
                          controller: _pageController,
                          // itemCount: 3,
                          itemBuilder: (context, index) {
                            return ImagePagerItem(imageUrl: images[index]);
                          })
                  ),
                  // Stack(
                  //   children: <Widget>[
                  // Container(
                  //   margin: EdgeInsets.all(15),
                  //   child: Row(
                  //     mainAxisSize: MainAxisSize.min,
                  //     mainAxisAlignment: MainAxisAlignment.center,
                  //     children: <Widget>[
                  //       for (int i = 0; i < images.length; i++)
                  //         (i == currentPage ? circleBar(true) : circleBar(false))
                  //     ],
                  //   ),
                  // ),
                  //   ],
                  // ),
                ]),
              ),
            )
          ],
        );
  }

}

class ImagePagerItem extends StatelessWidget {
  String imageUrl = "";
  ImagePagerItem({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: DecoratedBox(
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(16)),
            color: AppColors.app_pink,
            image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(this.imageUrl))),
        child: Container(),
      ),);
  }


}


// class HomeCardWidget extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: <Widget>[
//         Container(
//           height: MediaQuery.of(context).size.height * 0.28,
//           child: DecoratedBox(
//             decoration: BoxDecoration(
//                 borderRadius: const BorderRadius.only(
//                     bottomLeft: Radius.circular(26),
//                     bottomRight: Radius.circular(26)),
//                 color: AppColors.app_black),
//             child: Container(),
//           ),
//         ),
//         Container(
//           height: MediaQuery.of(context).size.height * 0.35,
//           child: Padding(
//             padding: EdgeInsets.all(20),
//             child: Stack(
//               children: [
//                 DecoratedBox(
//                   decoration: BoxDecoration(
//                       borderRadius: const BorderRadius.all(Radius.circular(16)),
//                       image: DecorationImage(
//                           fit: BoxFit.cover,
//                           image: AssetImage('assets/images/home_card.png'))),
//                   child: Container(),
//                 ),
//                 Padding(
//                   padding: EdgeInsets.fromLTRB(20, 30, 20, 15),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Container(
//                         width: 50.0,
//                         height: 50.0,
//                         decoration: new BoxDecoration(
//                             color: AppColors.app_black,
//                             border: Border.all(width: 2, color: Colors.white),
//                             shape: BoxShape.circle),
//                         child: Image.asset('assets/images/app_icon_small.png'),
//                       ),
//                       Image.asset(
//                         'assets/images/english_coffee.jpg',
//                         height: 56,
//                         width: 110,
//                       ),
//                       OutlinedButton(
//                         onPressed: (){
//                           Navigator.pushNamed(context, ExploreProductsPage.RouteName);
//                         },
//                         style: OutlinedButton.styleFrom(
//                             side: BorderSide(color: AppColors.color_863f3b,
//                                 width:1)
//
//                         ),
//                         child: const Text(
//                           "Explore Now!",
//                           style: TextStyle(color: AppColors.app_maroon),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         )
//       ],
//     );
//   }
// }
