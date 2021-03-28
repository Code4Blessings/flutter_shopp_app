import 'package:flutter/material.dart';
import 'package:flutter_shopp_app/widgets/products_grid.dart';


//See ReadMe

class ProductsOverview extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shop App'),
      ),
      body: ProductsGrid(),
    );
  }
}

