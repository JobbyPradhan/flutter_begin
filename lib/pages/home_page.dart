import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:flutter_begin/model/Catalog.dart';
import 'package:flutter_begin/util/routes.dart';
import 'package:flutter_begin/widgets/theme.dart';
import 'package:velocity_x/velocity_x.dart';

import '../widgets/home_widget/catalog_header.dart';
import '../widgets/home_widget/catalog_list.dart';


class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    loadJson();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.colorScheme.secondary,
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.pushNamed(context, MyRoutes.cartRoute);
        },
        backgroundColor: context.theme.buttonColor,
        child: const Icon(CupertinoIcons.cart,color: Colors.white,)
        ,),
      body: SafeArea(
        child: Container(
            padding: Vx.mSymmetric(v: 12.0,h: 16.0),
            child: Column(
              children: [
                const CatalogHeader(),
                if (products.isNotEmpty)
                  const CatalogList().py16().expand()
                else
                  const CircularProgressIndicator().centered().expand()
              ],
            )),
      ),
    );
  }

  void loadJson() async {
    await Future.delayed(const Duration(seconds: 2));
    final catalogJson =
    await rootBundle.loadString("asserts/files/catalog.json");
    var decodedData = jsonDecode(catalogJson);
    var productsData = decodedData["products"];
    products = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});
  }
}




