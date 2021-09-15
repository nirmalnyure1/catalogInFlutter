import 'package:catalog_app/models/catalog.dart';

class Cart {
  //Catalog field
  late CatalogModel _catalogModel;

//implemented of encapsulation using getter and setter
  //collection of id ,store id of each item
  final List<int> _itemId = [];

  CatalogModel get catalog {
    return _catalogModel;
  }

  set catalog(CatalogModel newCatalog) {
    _catalogModel = newCatalog;
  }

  //get items in the cart
  List<Item> get items =>
      _itemId.map((id) => _catalogModel.getById(id)).toList();

  //get total price
  num get totalPrice => items.fold(
      0, (previousValue, currentValue) => previousValue + currentValue.price);

  void app(Item item) {
    _itemId.add(item.id);
  }

  void remove(Item item) {
    _itemId.remove(item.id);
  }
}
