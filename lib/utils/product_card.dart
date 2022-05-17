import 'package:flutter/material.dart';
import 'package:rose/models/Item.dart';
import 'package:rose/pages/detail.dart';
import 'package:rose/utils/constants.dart';
import 'package:rose/utils/helper.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    required Key key,
    required this.product,
  }) : super(key: key);

  final Item product;

  @override
  Widget build(BuildContext context) {
    // double defaultSize = SizeConfig.defaultSize;
    MediaQueryData _mediaQueryData = MediaQuery.of(context);
    double screenWidth = _mediaQueryData.size.width;
    double screenHeight = _mediaQueryData.size.height;
    Orientation orientation = _mediaQueryData.orientation;
    double defaultSize = orientation == Orientation.landscape
        ? screenHeight * 0.024
        : screenWidth * 0.024;
    double gridwidh = screenWidth - 20;
    double gridheight = gridwidh / 2;
    return GestureDetector(
      onTap: () {
        final GlobalKey _scaffoldKey = GlobalKey();
        Helper.nextPage(
            context,
            Detail(
              key: _scaffoldKey,
              item: product,
            ));
      },
      child: Container(
        // width: defaultSize * 18.5,
        decoration: BoxDecoration(
          color: kshopbackColor,
          borderRadius: BorderRadius.circular(30),
        ),
        child: AspectRatio(
          aspectRatio: 1.333,
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsets.all(defaultSize),
                child: AspectRatio(
                  aspectRatio: 1.333,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: FadeInImage.assetNetwork(
                        placeholder: "assets/images/loadimg.gif",
                        image: product.hinhanh,
                        imageErrorBuilder: (context, error, stackTrace) {
                          return const Text('error');
                        },
                        fit: BoxFit.cover),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(4 * defaultSize),
                child: Container(
                  alignment: Alignment.center,
                  color:
                      const Color.fromARGB(255, 3, 208, 235).withOpacity(0.5),
                  height: defaultSize * 4,
                  width: gridwidh * 1,
                  child: Text(
                    getlang() == 1 ? product.ten : product.tenav,
                    style: TextStyle(
                      fontSize: defaultSize * 2,
                      color: const Color.fromARGB(255, 251, 255, 0),
                    ),
                  ),
                ),
              ),

              // Padding(
              //   padding: EdgeInsets.only(bottom: defaultSize),
              //   child: Text(
              //       "${product.dongiakhuyenmai != null ? product.dongiakhuyenmai : product.dongia} vnđ"),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

class TitleText extends StatelessWidget {
  final String title;
  const TitleText({
    required Key key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: subheadtextstyle,
    );
  }
}
