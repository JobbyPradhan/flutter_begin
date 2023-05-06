import 'package:flutter/material.dart';
import 'package:flutter_begin/pages/home_detail.dart';
import 'package:flutter_begin/util/routes.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../model/Catalog.dart';
import '../../widgets/theme.dart';

class CatalogList extends StatelessWidget {
  const CatalogList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: products.length,
        itemBuilder: (context, index) {
          return InkWell(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomeDetailPage(item: products[index]),
                  )),
              child: CatalogItem(products[index]));
        });
  }
}

class CatalogItem extends StatelessWidget {
  final Item item;

  const CatalogItem(this.item, {super.key});

  @override
  Widget build(BuildContext context) {
    return VxBox(
        child: Row(
      children: [
        Hero(
          tag: Key(item.id.toString()),
            child: CatalogImage(image: item.image)
        ),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            item.name.text.lg.color(context.theme.accentColor).bold.make(),
            item.desc.text.textStyle(context.captionStyle).make(),
            10.heightBox,
            ButtonBar(
              alignment: MainAxisAlignment.spaceBetween,
              buttonPadding: EdgeInsets.zero,
              children: [
                "\$ ${item.price}".text.bold.xl.align(TextAlign.left).make(),
                ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(context.theme.buttonColor),
                        shape:
                            MaterialStateProperty.all(const StadiumBorder())),
                    child: "Add To Cart".text.make())
              ],
            ).pOnly(right: 8.0)
          ],
        ))
      ],
    )).color(context.cardColor).roundedLg.square(150).make().py(16);
  }
}

class CatalogImage extends StatelessWidget {
  final String image;

  const CatalogImage({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(image)
        .box
        .rounded
        .p8
        .color(context.canvasColor)
        .make()
        .p(16)
        .w40(context);
  }
}
