import 'package:flutter/material.dart';
import 'package:flutter_begin/util/routes.dart';
import 'package:flutter_begin/widgets/theme.dart';
import 'package:velocity_x/velocity_x.dart';

import '../model/Catalog.dart';
import '../widgets/home_widget/add_to_cart.dart';

class HomeDetailPage extends StatelessWidget {
  final Item item;

  const HomeDetailPage({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.canvasColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: "Catalog Detail"
            .text
            .color(context.theme.colorScheme.onSurface)
            .semiBold
            .textStyle(context.headlineSmall)
            .make(),
      ),
      bottomNavigationBar: Container(
        color: context.cardColor,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          buttonPadding: EdgeInsets.zero,
          children: [
            "\$ ${item.price}"
                .text
                .bold
                .xl4
                .red800
                .align(TextAlign.left)
                .make(),
              AddToCart(catalog : item).wh(120, 50)
          ],
        ).p32(),
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Hero(tag: Key(item.id.toString()), child: Image.network(item.image))
                .h32(context),
            Expanded(
              child: VxArc(
                height: 30.0,
                arcType: VxArcType.CONVEY,
                edge: VxEdge.TOP,
                child: Container(
                  width: context.screenWidth,
                  color: context.cardColor,
                  child: Column(
                    children: [
                      item.name.text.xl4.color(context.accentColor).bold.make(),
                      item.desc.text.lg.textStyle(context.captionStyle).make(),
                      10.heightBox,
                      "Flutter is an open source framework by Google for building beautiful, natively compiled, multi-platform applications from a single codebase."
                          .text
                          .textStyle(context.captionStyle)
                          .make()
                          .p16()
                    ],
                  ).py64(),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
