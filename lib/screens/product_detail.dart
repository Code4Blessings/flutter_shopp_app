import 'package:flutter/material.dart';

class ProductDetail extends StatelessWidget {
//  final String title;
//  final double price;
//
//  ProductDetail(this.title, this. price);
static const routeName = './product-detail';

  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context).settings.arguments as String; //Gives us the id

    return Scaffold(
      appBar: AppBar(
        title: Text('title'),
      ),
    );
  }
}
