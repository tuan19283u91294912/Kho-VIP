import 'package:flutter/material.dart';

int lang = 0;
void setlang(int mlang) {
  lang = mlang;
}

int getlang() {
  return lang;
}

const spanNormalHead = TextStyle(
  height: 1.4,
  fontSize: 30.0,
  color: Colors.orangeAccent,
);
const spanBoldHead = TextStyle(
  fontSize: 30.0,
  fontWeight: FontWeight.w600,
  color: Colors.orangeAccent,
);
const spanNormal = TextStyle(
  fontSize: 24.0,
  fontWeight: FontWeight.w600,
  color: Colors.black,
);
var styleNormalTextbutton = TextButton.styleFrom(
  primary: Colors.black,
  textStyle: const TextStyle(fontSize: 20),
);

class Constants {
  static final Color primaryColor = Color.fromRGBO(18, 26, 28, 1);
  static final Color greyColor = Color.fromRGBO(247, 247, 249, 1);
}

const kshopbackColor = Color(0xFFF9F8FD);
final subheadtextstyle = TextStyle(
  fontSize: 24,
  fontWeight: FontWeight.bold,
  color: Color.fromRGBO(18, 26, 28, 1),
);

final titletextstyle = TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.bold,
  color: Colors.white,
);
final titletextstyle2 = TextStyle(
  fontSize: 20,
  fontWeight: FontWeight.bold,
  color: Colors.orange,
);
