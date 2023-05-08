import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_begin/model/Cart.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../core/Store.dart';

class CartList extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [RemoveMutation]);
    final CartModel cart = (VxState.store as MyStore).cart;
    return cart.items.isEmpty
        ? "Nothing to show".text.xl3.makeCentered()
        : ListView.builder(
            itemCount: cart.items.length,
            itemBuilder: (context, index) => ListTile(
                  leading: const Icon(Icons.done),
                  title: cart.items[index].name.text.semiBold.make(),
                  trailing: IconButton(
                      onPressed: () {

                        RemoveMutation(cart.items[index]);
                      },
                      icon: const Icon(Icons.remove_circle_outline)),
                ));
  }
}
