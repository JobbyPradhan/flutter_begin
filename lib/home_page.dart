import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:flutter_begin/model/Catalog.dart';
import 'package:flutter_begin/widgets/catalog_widget.dart';
import 'package:flutter_begin/widgets/drawer.dart';

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
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          "Catalog App",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: (products.isNotEmpty)
              ? GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      mainAxisSpacing: 16,
                      crossAxisSpacing: 16),
                  itemBuilder: (context, index) {
                    final item = products[index];
                    String color = item.color.replaceAll("#", "0xFF");
                    return Card(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: GridTile(
                        header: Container(
                            padding: const EdgeInsets.all(12),
                            decoration:  BoxDecoration(
                              color: Color(int.parse(color))
                            ),
                            child: Text(item.name,
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold
                            ),)
                        ),
                        footer: Container(
                            padding: const EdgeInsets.all(12),
                            decoration:  BoxDecoration(
                                color: Color(int.parse(color))
                            ),
                            child: Text("${item.price}",
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold
                              ),)
                        ),
                        child: Image.network(item.image),
                      ),
                    );
                  },
                  itemCount: products.length,
                )
              : const Center(
                  child: CircularProgressIndicator(),
                )),
      drawer: MyDrawer(),
    );
  }

  /*child: ListView.builder(
          itemCount: products.length,
          itemBuilder: (context, index) {
            return CatalogWidget(item: products[index]);
          },*/

  void loadJson() async {
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
