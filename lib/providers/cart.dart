import 'package:flutter/foundation.dart';
import 'package:flutter_shopp_app/screens/product_detail.dart';

class CartItem {
  final String id;
  final String title;
  final double price;
  final int quantity;

  CartItem({
    @required  this.id,
    @required  this.title,
    @required  this.price,
    @required  this.quantity,
  });
}



class Cart with ChangeNotifier {
  Map<String, CartItem> _items = {};

  Map<String, CartItem> get items {
    return {..._items};
  }

  int get itemCount {
    return  _items.length;
  }

  double get totalAmount {
    var total = 0.00;
    _items.forEach((key, cartItem) {
      total += cartItem.price * cartItem.quantity;
    });
    return total;
  }

  void addItem(String productId, double price, String title) {
    if(_items.containsKey(productId)) {
      //change quantity...
      _items.update(productId, (existingCartItem) => CartItem(
          id: existingCartItem.id,
          title: existingCartItem.title,
          price: existingCartItem.price,
          quantity: existingCartItem.quantity + 1
      ));
    }else {
      _items.putIfAbsent(productId,  () => CartItem(
          id: DateTime.now().toString(),
          title: title,
          price: price,
          quantity: 1
      ),
      );
    }
    notifyListeners();
  }

  void removeItem(String productId) {
    _items.remove(productId);
    notifyListeners();
  }

  void clear() {
    _items = {};
    notifyListeners();
  }

  void removeSingleItem(String productId) {
    if(!_items.containsKey(productId)) {
      return;
    }
    if(_items[productId].quantity > 1) {
      _items.update(
          productId,
              (existingCartItem) => CartItem(
                  id: existingCartItem.id,
                  title: existingCartItem.title,
                  price: existingCartItem.price,
                  quantity: existingCartItem.quantity -1
              )
      );
    }else{
      _items.remove((productId));
    }
    notifyListeners();
  }
}