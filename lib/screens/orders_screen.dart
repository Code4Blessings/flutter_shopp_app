import 'package:flutter/material.dart';
import 'package:flutter_shopp_app/providers/orders.dart' show Orders;
import 'package:flutter_shopp_app/widgets/app_drawer.dart';
import 'package:provider/provider.dart';
import '../widgets/order_item.dart';


class OrdersScreen extends StatelessWidget {
  static const  routeName = '/orders';

  @override
  Widget build(BuildContext context) {
    final orderData = Provider.of<Orders>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Your Orders'),
      ),
      drawer: AppDraw(),
      body: ListView.builder(
        itemCount: orderData.orders.length,
        itemBuilder: (ctx, i) => OrderItem(orderData.orders[i])
      ),
    );
  }
}
