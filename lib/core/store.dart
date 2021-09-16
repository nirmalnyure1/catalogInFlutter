import 'package:velocity_x/velocity_x.dart';

import 'package:catalog_app/models/cart.dart';
import 'package:catalog_app/models/catalog.dart';

class MyStore extends VxStore {
  late CatalogModel catalogModel;
  late Cart cart;
  MyStore() {
    catalogModel = CatalogModel();
    cart = Cart();

    cart.catalog = catalogModel;
  }
}
