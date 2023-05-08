import 'package:flutter/material.dart';
import 'package:flutter_begin/model/Cart.dart';
import 'package:flutter_begin/widgets/theme.dart';
import 'package:velocity_x/velocity_x.dart';

import '../core/Store.dart';
import '../widgets/cart_widget/cart_list_widget.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: context.canvasColor,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: "Cart"
              .text
              .color(context.theme.accentColor)
              .textStyle(context.headlineSmall)
              .semiBold
              .make(),
        ),
        body: Column(
          children: [
            CartList().p32().expand(),
            const Divider(),
            const _CartTotal(),
          ],
        ));
  }
}

class _CartTotal extends StatelessWidget {
  const _CartTotal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CartModel cart = (VxState.store as MyStore).cart;
    return SizedBox(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          VxConsumer(
            mutations: const {RemoveMutation},
            notifications: {},
            builder: (context, _, VxStatus? status) {
              return "\$${cart.totalPrice}"
                  .text
                  .xl5
                  .color(context.theme.accentColor)
                  .make();
            },
          ),
          30.widthBox,
          ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: "Buying not supported yet!".text.make()));
                  },
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(context.theme.buttonColor)),
                  child: "Buy".text.white.make())
              .w32(context)
        ],
      ),
    );
  }
}
