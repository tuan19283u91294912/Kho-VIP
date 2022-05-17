import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:rose/models/Item.dart';

class Helper {
  static void nextPage(BuildContext context, Widget page) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (BuildContext context) {
        return page;
      }),
    );
  }
}

Future<List<Item>> fetchItems() async {
  String apiUrl = "https://chocaycanh.club/api/hoahong/ds";

  // final response = await http.get(apiUrl);
  HttpClient client = new HttpClient();
  client.badCertificateCallback =
      ((X509Certificate cert, String host, int port) => true);
  final response = await http.get(Uri.parse(apiUrl), headers: <String, String>{
    'Content-Type': 'application/json; charset=UTF-8',
    'Accept': 'application/json',
    //  'Authorization': 'Bearer ' + ' ' + Token.token,
  });

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    var body = json.decode(response.body);
    var data1 = body['data'] as List;
    // List<Item> products = new List( );
    // List<Item> products = List<int>.filled(500, 0, growable: true);
    print(data1.length);
    List<Item> products = [];
    for (var item in data1) {
      var pro = Item.fromJson(item);

      products.add(pro);
    }

    // Return list of products
    return products;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load');
  }
}

Future<List<Itemanh>> fetchItemImages(int id) async {
  String apiUrl = "https://chocaycanh.club/api/hoahong/dsanh/" + id.toString();

  // final response = await http.get(apiUrl);
  HttpClient client = new HttpClient();
  client.badCertificateCallback =
      ((X509Certificate cert, String host, int port) => true);
  final response = await http.get(Uri.parse(apiUrl), headers: <String, String>{
    'Content-Type': 'application/json; charset=UTF-8',
    'Accept': 'application/json',
    //  'Authorization': 'Bearer ' + ' ' + Token.token,
  });

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    var body = json.decode(response.body);
    var data1 = body['data'] as List;

    print(data1.length);
    List<Itemanh> products = [];
    for (var item in data1) {
      var pro = Itemanh.fromJson(item);

      products.add(pro);
    }

    // Return list of products
    return products;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load');
  }
}

//var items = fetchItems();
