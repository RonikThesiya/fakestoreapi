import 'package:fakestoreapi/screen/home/provider/home_provider.dart';
import 'package:fakestoreapi/screen/home/view/home_screen.dart';
import 'package:fakestoreapi/screen/home/view/page_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main()
{
  runApp(
    ChangeNotifierProvider(
      create: (context) => HomeProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => HomeScreen(),
          'page': (context) => view(),
        },
      ),
    )
  );
}