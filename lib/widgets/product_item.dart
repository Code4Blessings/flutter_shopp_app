import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter_shopp_app/providers/product.dart';
import 'package:flutter_shopp_app/screens/product_detail.dart';
import '../providers/cart.dart';


class ProductItem extends StatelessWidget {
//  final String id;
//  final String title;
//  final String imageUrl;
//
//  const ProductItem(this.id, this.title, this.imageUrl);

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context, listen: false);
    final cart = Provider.of<Cart>(context, listen: false);

    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed(
                  ProductDetail.routeName,
                  arguments: product.id
              );
            },
            child: Image.network(
                product.imageUrl,
                fit: BoxFit.cover,
            ),
          ),
        footer: GridTileBar(
          backgroundColor: Colors.black87,
          leading: IconButton(
              icon: Icon(product.isFavorite ? Icons.favorite : Icons.favorite_border),
              onPressed: () {
                product.toggleFavoriteStatus();
              },
            color: Theme.of(context).accentColor,
          ),
          title: Text(
              product.title,
            textAlign: TextAlign.center,
          ),
          trailing: IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {
                cart.addItem(product.id, product.price, product.title);
                Scaffold.of(context).hideCurrentSnackBar();
                Scaffold.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Added item to cart'),
                      duration: Duration(seconds: 2),
                      action: SnackBarAction(
                        label: 'UNDO',
                        onPressed: () {
                          cart.removeSingleItem(product.id);
                        },
                      ),
                )
                );
              },
              color: Theme.of(context).accentColor,
          ),
        )
      ),
    );
  }
}
