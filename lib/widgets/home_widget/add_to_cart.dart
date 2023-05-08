
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_begin/core/Store.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../model/Cart.dart';
import '../../model/Catalog.dart';

class AddToCart extends StatelessWidget {
  final Item catalog;

  AddToCart({Key? key, required this.catalog}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    VxState.watch(context, on: [AddMutation,RemoveMutation]);
    final CartModel cart = (VxState.store as MyStore).cart;
    bool isInCart = cart.items.contains(catalog) ?? false;
    return ElevatedButton(
        onPressed: () {
          if (!isInCart) {
            AddMutation(catalog);
          }
        },
        style: ButtonStyle(
            backgroundColor:
            MaterialStateProperty.all(context.theme.buttonColor),
            shape: MaterialStateProperty.all(const StadiumBorder())),
        child: isInCart ? const Icon(Icons.done) : const Icon(CupertinoIcons.cart_badge_plus));
  }
}