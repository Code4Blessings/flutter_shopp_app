import 'package:flutter/material.dart';
import 'package:flutter_shopp_app/screens/edit_products.dart';
import 'package:flutter_shopp_app/widgets/app_drawer.dart';
import 'package:provider/provider.dart';
import '../providers/products.dart';
import '../widgets/user_product_item.dart';

class UserProducts extends StatelessWidget {
  static const routeName = '/user-products';

  @override
  Widget build(BuildContext context) {

    final productsData = Provider.of<Products>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Products'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(EditProductScreen.routeName);
            },
          ),
        ],
      ),
      drawer: AppDraw(),
      body: Padding(
          padding: EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: productsData.items.length,
          itemBuilder: (_, i) => Column(
            children: [
              UserProductItem(
                  productsData.items[i].id,
                  productsData.items[i].title,
                  productsData.items[i].imageUrl
              ),
              Divider(),
            ],
          ),
        ),
      ),
    );
  }
}
