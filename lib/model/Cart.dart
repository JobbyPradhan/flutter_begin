import 'package:flutter_begin/core/Store.dart';
import 'package:velocity_x/velocity_x.dart';

import 'Catalog.dart';

class CartModel{

  late CatalogModel _catalog;


  final List<int> _itemIds = [];

  //Get Catalog
  CatalogModel get catalog => _catalog;

  set catalog(CatalogModel newCatalog){
    _catalog = newCatalog;
  }

  List<Item> get items => _itemIds.map((id) => _catalog.getById(id)).toList();

  //Get Total Price
  num get totalPrice =>items.fold(0, (total,current) => total+ current.price);

// Remove Item
  void remove(Item item){
    _itemIds.remove(item.id);
  }
}

class AddMutation extends VxMutation<MyStore>{
  final Item item;

  AddMutation(this.item);
  @override
  perform() {
      store?.cart._itemIds.add(item.id);
  }
}

class RemoveMutation extends VxMutation<MyStore>{
  final Item item;

  RemoveMutation(this.item);
  @override
  perform() {
    store?.cart._itemIds.remove(item.id);
  }
}