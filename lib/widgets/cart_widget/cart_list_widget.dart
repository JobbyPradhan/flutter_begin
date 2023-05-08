import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_begin/model/Cart.dart';
import 'package:velocity_x/velocity_x.dart';

class CartList extends StatefulWidget {
  const CartList({Key? key}) : super(key: key);

  @override
  State<CartList> createState() => _CartListState();
}

class _CartListState extends State<CartList> {
  final _cart = CartModel();

  @override
  Widget build(BuildContext context) {
    return _cart.items.isEmpty
        ? "Nothing to show".text.xl3.makeCentered()
        : ListView.builder(
            itemCount: _cart.items.length,
            itemBuilder: (context, index) => ListTile(
                  leading: const Icon(Icons.done),
                  title: _cart.items[index].name.text.semiBold.make(),
                  trailing: IconButton(
                      onPressed: () {
                        _cart.remove(_cart.items[index]);
                        setState(() {});
                      },
                      icon: const Icon(Icons.remove_circle_outline)),
                ));
  }
}
