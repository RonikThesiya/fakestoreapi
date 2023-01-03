import 'package:fakestoreapi/screen/home/modal/ProductModal.dart';
import 'package:flutter/material.dart';

class view extends StatefulWidget {
  const view({Key? key}) : super(key: key);

  @override
  State<view> createState() => _viewState();
}

class _viewState extends State<view> {
  @override
  Widget build(BuildContext context) {

    dynamic datalist = ModalRoute.of(context)!.settings.arguments;

    return SafeArea(child: Scaffold(
      appBar: AppBar(
        title: Text("${datalist.title}"),
      ),
    ));
  }
}
