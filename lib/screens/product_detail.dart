import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/products.dart';

class ProductDetail extends StatelessWidget {
//  final String title;
//  final double price;
//
//  ProductDetail(this.title, this. price);
static const routeName = './product-detail';

  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context).settings.arguments as String; //Gives us the id
    final loaded = Provider.of<Products>(
        context,
        listen: false
    ).findById(productId);
    return Scaffold(
      appBar: AppBar(
        title: Text(loaded.title),
      ),
    );
  }
}
