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

class Detail extends StatelessWidget {
  const Detail({
    required Key key,
    required this.item,
  }) : super(key: key);
  final Item item;

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
          "assets/images/back.gif",
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
              Padding(
                padding: const EdgeInsets.all(20),
                child: Text(
                  getlang() == 1 ? item.ten : item.tenav,
                  style: const TextStyle(
                    color: Color.fromARGB(255, 224, 16, 16),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: AspectRatio(
                  aspectRatio: 1.333,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: FadeInImage.assetNetwork(
                        placeholder: "assets/images/spinner.gif",
                        image: item.hinhanh,
                        imageErrorBuilder: (context, error, stackTrace) {
                          return const Text('error');
                        },
                        fit: BoxFit.cover),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Html(
                  data: getlang() == 1 ? item.mota : item.motaav,
                ),
              ),
              FutureBuilder(
                future: fetchItemImages(item.id),
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.hasError) {
                    return const Center(
                      child: Text('An error has occurred!'),
                    );
                  } else if (snapshot.hasData) {
                    // print(snapshot.data!.length);

                    return bodyimage(size: size, images: snapshot.data!);
                  } else {
                    return Center(
                        child: Image.asset("assets/images/flowerspin.gif"));
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

class bodyimage extends StatelessWidget {
  const bodyimage({
    Key? key,
    required this.size,
    required this.images,
  }) : super(key: key);

  final Size size;
  final List<Itemanh> images;

  @override
  Widget build(BuildContext context) {
    if (images.isEmpty) {
      return Container();
    } else {
      return Container(
        // height: size.height,
        child: GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: images.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 1.333,
            crossAxisCount:
                MediaQuery.of(context).orientation == Orientation.portrait
                    ? 1
                    : 2,
            mainAxisSpacing: 0,
            crossAxisSpacing: 20,
          ),
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(20),
              child: AspectRatio(
                aspectRatio: 1.333,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: FadeInImage.assetNetwork(
                      placeholder: "assets/images/loadimg.gif",
                      image: images[index].hinhanh,
                      imageErrorBuilder: (context, error, stackTrace) {
                        return const Text('error');
                      },
                      fit: BoxFit.cover),
                ),
              ),
            );
          },
        ),
      );
    }
  }
}
