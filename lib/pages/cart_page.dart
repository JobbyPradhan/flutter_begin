import 'package:flutter/material.dart';
import 'package:flutter_begin/widgets/theme.dart';
import 'package:velocity_x/velocity_x.dart';

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
    );
  }
}
