import 'package:flutter_begin/model/Cart.dart';
import 'package:flutter_begin/model/Catalog.dart';
import 'package:velocity_x/velocity_x.dart';

class MyStore extends VxStore{
  late CatalogModel catalog;
  late CartModel cart;

  MyStore(){
    catalog = CatalogModel();
    cart = CartModel();
    cart.catalog = catalog;
  }
}