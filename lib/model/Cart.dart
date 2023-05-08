import 'Catalog.dart';

class CartModel{

  static final cartModel = CartModel._internal();

  CartModel._internal();

  factory CartModel() => cartModel;

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

  // Add Item
  void add(Item item){
    _itemIds.add(item.id);
  }
// Remove Item
  void remove(Item item){
    _itemIds.remove(item.id);
  }
}