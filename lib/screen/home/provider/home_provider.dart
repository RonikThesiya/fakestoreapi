import 'dart:convert';

import 'package:fakestoreapi/screen/home/modal/ProductModal.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
class HomeProvider extends ChangeNotifier
{
  var apilink = "https://fakestoreapi.com/products";
  List<dynamic> Productlist = [];


  Future<List> apicall()async
  {
    var jsonlink = await http.get(Uri.parse(apilink));
    var json = jsonDecode(jsonlink.body);

    return json.map((e) => ProductModal.fromJson(e)).toList();

  }


}