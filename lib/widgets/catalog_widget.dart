import 'package:flutter/material.dart';

import '../model/Catalog.dart';

class CatalogWidget extends StatelessWidget {
  final Item item;

  const CatalogWidget({Key? key, required this.item})
      :super(key: key);

  @override
  Widget build(BuildContext context) {
    String color = item.color.replaceAll("#", "0xFF");

    return  Card(
      shape: const StadiumBorder(),
      elevation: 0.0,
      child: ListTile(
        onTap: ()=>print("dog"),
        leading: Image.network(item.image),
        title: Text(item.name,
        style: TextStyle(
          color: Color(int.parse(color))
        ),),
        subtitle: Text(item.desc),
        trailing: Text("\$ ${item.price}",
        textScaleFactor: 1.5,
        style: const TextStyle(
          color: Colors.deepOrange,
          fontWeight: FontWeight.bold
        ),),
      ),
    );
  }
}
