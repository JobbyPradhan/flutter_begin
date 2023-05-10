import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_begin/core/Store.dart';
import 'package:flutter_begin/model/Cart.dart';
import 'dart:convert';
import 'package:flutter_begin/model/Catalog.dart';
import 'package:flutter_begin/util/routes.dart';
import 'package:velocity_x/velocity_x.dart';

import '../widgets/home_widget/catalog_header.dart';
import '../widgets/home_widget/catalog_list.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final url = "https://api.jsonbin.io/v3/b/645be5f29d312622a35bb23c";
  @override
  void initState() {
    super.initState();
    loadJson();
  }

  @override
  Widget build(BuildContext context) {
    final _cart = (VxState.store as MyStore).cart;
    return Scaffold(
      backgroundColor: context.canvasColor,
      floatingActionButton: VxBuilder(
        mutations: const {AddMutation, RemoveMutation},
        builder: (ctx, _,VxStatus? status) => _cart.items.isNotEmpty ? FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, MyRoutes.cartRoute);
          },
          backgroundColor: context.theme.colorScheme.onPrimary,
          child: const Icon(
            CupertinoIcons.cart,
            color: Colors.white,
          ),
        ).badge(color: Vx.red500, size:  20, count: _cart.items.length,textStyle:const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold
        )
      ):FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, MyRoutes.cartRoute);
          },
          backgroundColor: context.theme.colorScheme.onPrimary,
          child: const Icon(
            CupertinoIcons.cart,
            color: Colors.white,
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
            padding: Vx.mSymmetric(v: 12.0, h: 16.0),
            child: Column(
              children: [
                const CatalogHeader(),
                if (CatalogModel.items.isNotEmpty)
                  const CatalogList().py16().expand()
                else
                  const CircularProgressIndicator().centered().expand()
              ],
            )),
      ),
    );
  }

  void loadJson() async {
    const APIKEY = "\$2b\$10\$N13KPBbjBNKPbpm0KEu1uOx57EhRDhfRwgDh10qmpo5G5oczz92o2";
    print(APIKEY);
  /*  final catalogJson =
        await rootBundle.loadString("asserts/files/catalog.json");*/
    final response =
        await http.get(Uri.parse(url),headers: {"X-Master-Key":APIKEY});

    final catalogJson = response.body;

    var decodedData = jsonDecode(catalogJson);
    var apiData = decodedData["record"];

    var productsData = apiData['products'];
    CatalogModel.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});
  }
}
