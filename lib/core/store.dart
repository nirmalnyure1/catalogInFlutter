import 'package:velocity_x/velocity_x.dart';

import 'package:catalog_app/models/cart.dart';
import 'package:catalog_app/models/catalog.dart';

class Store extends VxStore {
  late CatalogModel catalogModel;
  late Cart cart;
  Store() {
    catalogModel = CatalogModel();
    cart = Cart();

    cart.catalog = catalogModel;
  }
}
