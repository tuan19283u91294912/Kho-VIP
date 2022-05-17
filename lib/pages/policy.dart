import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rose/models/Item.dart';
import 'package:rose/utils/constants.dart';
import 'package:rose/utils/helper.dart';
// import 'package:rose/utils/product_card.dart';
// import 'package:html/dom.dart' as dom;
// import 'package:html/parser.dart' as htmlparser;
// import 'package:news_ui/utils/static_data.dart';

class Policy extends StatelessWidget {
  const Policy({
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
          "assets/images/back2.gif",
          width: defaultSize * 4,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // dom.Document document;
    // getlang() == 1
    //     ? document = htmlparser.parse(item.mota)
    //     : document = htmlparser.parse(item.motaav);
    return Scaffold(
      appBar: buildAppBar(context),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                    "We don't gather any information from readers. Fell free to get and republic information from here. "),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
