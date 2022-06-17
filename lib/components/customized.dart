import 'package:Malibu/api/ProductAPIServices.dart';
import 'package:Malibu/components/AppColors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:Malibu/components/AppColors.dart';

class CustomizedPageView extends StatefulWidget {

  List<String> imageIds=[];
  CustomizedPageView(this.imageIds, {Key? key}) : super(key: key);

  @override
  _CustomizedPageViewState createState() => _CustomizedPageViewState();
}

class _CustomizedPageViewState extends State<CustomizedPageView> {
  int currentPage = 0;
  List<String> images=[];

  @override
  void initState() {
    super.initState();
    if(widget.imageIds.length==0)
      images.add("None");
    else
     getProducts(widget.imageIds);
  }
  @override
  Widget build(BuildContext context) {

      if(images.length>0)
        return Container(
      child: Column(children: <Widget>[
        Container(
            height: 200,
            child:  PageView.builder(
              itemCount: images.length,
                onPageChanged: (int page) {
                  setState(() {
                    currentPage = page;
                  });
                },
                controller: PageController(initialPage: 0),
                // itemCount: 3,
                itemBuilder: (context, index) {
                  return ProductImagePagerItem(imageUrl: images[index]);
                })
        ),
        // Stack(
        //   children: <Widget>[
        Container(
          margin: EdgeInsets.all(15),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              for (int i = 0; i < images.length; i++)
                (i == currentPage ? circleBar(true) : circleBar(false))
            ],
          ),
        ),
        //   ],
        // ),
      ]),
    );
    else
        return   Container(
        child: Center(child: CircularProgressIndicator(),)
        );
  }

  void getProducts(List<String> ids) {
    print("eeee"+ids.toString());
    getImages(ids).then((value) => {
      if (value != null)
        {
          setState(() {
            this.images = value;
          })
        }
    });
  }

  Widget circleBar(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: EdgeInsets.symmetric(horizontal: 8),
      height: isActive ? 12 : 8,
      width: isActive ? 12 : 8,
      decoration: BoxDecoration(
          color: isActive ? AppColors.app_blue : AppColors.color_cdd1d9,
          borderRadius: BorderRadius.all(Radius.circular(12))),
    );
  }
}

class ProductImagePagerItem extends StatelessWidget {
  String imageUrl = "";
  ProductImagePagerItem({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: DecoratedBox(
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(16)),
            color: AppColors.app_pink,
            image: DecorationImage(
                fit: BoxFit.fill,
                image: setImage(this.imageUrl))),
        child: Container(),
      ),);
  }

  setImage(String s) {
    if(s != null && s!= "None") {
      return CachedNetworkImageProvider(s);
    } else{
      return  AssetImage("assets/images/mg_latte.jpg");
    }
  }

}

