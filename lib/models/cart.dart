import 'package:catalog_app/core/store.dart';
import 'package:catalog_app/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

class Cart {
  //static final cart = Cart._internal();
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


}

class AddMutation extends VxMutation<MyStore> {
  late final Item item;
  AddMutation(this.item);
  @override
  perform() {
    store!.cart._itemId.add(item.id);
  }
}

class RemoveMutation extends VxMutation<MyStore> {
  late final Item item;
  RemoveMutation(this.item);
  @override
  perform() {
    store!.cart._itemId.remove(item.id);
  }
}
