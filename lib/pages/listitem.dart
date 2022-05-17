import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rose/models/Item.dart';
import 'package:rose/utils/constants.dart';
import 'package:rose/utils/helper.dart';
import 'package:rose/utils/product_card.dart';

// import 'package:news_ui/utils/static_data.dart';

class Listitem extends StatelessWidget {
  const Listitem({
    required Key key,
  }) : super(key: key);

  AppBar buildAppBar(BuildContext context) {
    MediaQueryData _mediaQueryData = MediaQuery.of(context);
    double screenWidth = _mediaQueryData.size.width;
    double screenHeight = _mediaQueryData.size.height;
    Orientation orientation = _mediaQueryData.orientation;
    double defaultSize = orientation == Orientation.landscape
        ? screenHeight * 0.024
        : screenWidth * 0.024;
    double gridwidh = screenWidth - 20;
    double gridheight = gridwidh / 2;

    return AppBar(
      backgroundColor: Colors.white,
      leading: IconButton(
        // icon: SvgPicture.asset("assets/svg/arrow-long-left.svg"),
        icon: Image.asset(
          "assets/images/icons8-home.gif",
          width: defaultSize * 4,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      actions: [
        IconButton(
          icon: SvgPicture.asset("assets/svg/star.svg"),
          onPressed: () {},
        ),
        const SizedBox(width: 10),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: buildAppBar(context),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              FutureBuilder(
                future: fetchItems(),
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.hasError) {
                    return const Center(
                      child: Text('An error has occurred!'),
                    );
                  } else if (snapshot.hasData) {
                    // print(snapshot.data!.length);

                    return body(size: size, products: snapshot.data!);
                  } else {
                    return Center(
                        child: Image.asset("assets/images/icons8-spinner.gif"));
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class body extends StatelessWidget {
  const body({
    Key? key,
    required this.size,
    required this.products,
  }) : super(key: key);

  final Size size;
  final List<Item> products;

  Row buildComment() {
    var soluong = 0;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          '($soluong) sản phẩm ',
          textAlign: TextAlign.left,
          style: spanNormal,
        ),
      ],
    );
  }

  Row buildGallery() {
    var soluong = 15;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          '$soluong điểm ',
          textAlign: TextAlign.left,
          style: spanNormal,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height,
      child: GridView.builder(
        // physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: products.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 1.333,
          crossAxisCount:
              MediaQuery.of(context).orientation == Orientation.portrait
                  ? 1
                  : 2,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
        ),
        itemBuilder: (context, index) {
          final GlobalKey _scaffoldKey1 = GlobalKey();
          return ProductCard(key: _scaffoldKey1, product: products[index]);
        },
      ),
    );
  }
}
