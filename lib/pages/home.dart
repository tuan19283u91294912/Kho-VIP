import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';
import 'package:rose/pages/listitem.dart';
import 'package:rose/pages/policy.dart';
import 'package:rose/utils/constants.dart';
import 'package:rose/utils/helper.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final GlobalKey _scaffoldKey = GlobalKey();
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height,
          child: Stack(
            children: [
              Container(
                height: size.height * 0.7,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    alignment: Alignment(0, 1),
                    fit: BoxFit.cover,
                    image: AssetImage("assets/images/background-image.png"),
                  ),
                ),
              ),
              Center(
                child: Lottie.network(
                    'https://assets8.lottiefiles.com/packages/lf20_8puzuzdn.json'),
              ),
              Positioned(
                bottom: 10.0,
                width: size.width,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                            child: const Icon(
                              Icons.facebook,
                              size: 30,
                              color: Colors.red,
                            ),
                            onPressed: () {},
                          ),
                          TextButton(
                            child: const Icon(
                              Icons.near_me_sharp,
                              size: 30,
                              color: Colors.red,
                            ),
                            onPressed: () {},
                          ),
                          TextButton(
                            child: const Icon(
                              Icons.home,
                              size: 30,
                              color: Colors.red,
                            ),
                            onPressed: () {},
                          ),
                        ],
                      ),
                      Center(
                        child: RichText(
                          text: const TextSpan(
                            children: [
                              TextSpan(
                                text: "Rose",
                                style: spanBoldHead,
                              ),
                              TextSpan(
                                text: " Discovery ",
                                style: spanNormalHead,
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 25.0,
                      ),
                      // LoginForm(),
                      TextButton.icon(
                          icon: SvgPicture.asset('assets/svg/vn.svg',
                              height: 20, width: 20, fit: BoxFit.scaleDown),
                          label: Text(
                            'Việt Nam',
                            style: TextStyle(
                                color: Colors.black.withOpacity(1.0),
                                fontSize: 20),
                          ),
                          onPressed: () {
                            setlang(1);

                            Helper.nextPage(
                                context,
                                Listitem(
                                  key: _scaffoldKey,
                                ));
                          },
                          style: ButtonStyle(
                              padding: MaterialStateProperty.all<EdgeInsets>(
                                  const EdgeInsets.all(10)),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  const Color.fromARGB(255, 243, 143, 218)))),
                      TextButton.icon(
                        icon: SvgPicture.asset('assets/svg/gb.svg',
                            height: 20, width: 20, fit: BoxFit.scaleDown),
                        label: Text(
                          'English   ',
                          style: TextStyle(
                              color: Colors.black.withOpacity(1.0),
                              fontSize: 20),
                        ),
                        onPressed: () {
                          setlang(2);
                          Helper.nextPage(
                              context,
                              Listitem(
                                key: _scaffoldKey,
                              ));
                        },
                        style: ButtonStyle(
                            padding: MaterialStateProperty.all<EdgeInsets>(
                                const EdgeInsets.all(10)),
                            backgroundColor: MaterialStateProperty.all<Color>(
                                const Color.fromARGB(255, 210, 199, 207))),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 40),
                        child: Center(
                          child: TextButton(
                            onPressed: () {
                              Helper.nextPage(
                                  context,
                                  Policy(
                                    key: _scaffoldKey,
                                  ));
                            },
                            child: const Text('Policy'),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
