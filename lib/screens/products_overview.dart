import 'package:flutter/material.dart';
import 'package:flutter_shopp_app/screens/cart_screen.dart';
import 'package:flutter_shopp_app/widgets/products_grid.dart';
import 'package:provider/provider.dart';
import '../widgets/badge.dart';
import '../providers/cart.dart';


//See ReadMe
enum FilterOptions {
  Favorites,
  All
}


class ProductsOverview extends StatefulWidget {
  @override
  _ProductsOverviewState createState() => _ProductsOverviewState();
}

class _ProductsOverviewState extends State<ProductsOverview> {
  var _showOnlyFavorites = false;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Shop App'),
        actions: <Widget>[
          PopupMenuButton(
              onSelected: (FilterOptions selectedValue) {
                setState(() {
                  if (selectedValue == FilterOptions.Favorites) {
                    _showOnlyFavorites = true;
                  }else {
                    _showOnlyFavorites = false;
                  }
                });
              },
              icon: Icon(Icons.more_vert),
              itemBuilder: (_) => [
                PopupMenuItem(child: Text('Only Favorites'), value: FilterOptions.Favorites),
                PopupMenuItem(child: Text('Show All'), value: FilterOptions.All),
              ]
          ),
          Consumer<Cart>(builder: (_, cart, ch) => Badge(
              child: ch,
              value: cart.itemCount.toString(),
          ),
            child: IconButton(
                icon: Icon(Icons.shopping_cart),
                onPressed: () {
                  Navigator.of(context).pushNamed(CartScreen.routeName);

                }
            ),
          )
        ],
      ),
      body: ProductsGrid(_showOnlyFavorites),
    );
  }
}






