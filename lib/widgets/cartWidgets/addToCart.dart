import 'package:catalog_app/models/cart.dart';
import 'package:catalog_app/models/catalog.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class AddToCart extends StatelessWidget{

  final Item catalog;
   AddToCart({
    Key? key,
    required this.catalog,
  }) : super(key: key);
  final _catalog = CatalogModel();
  final _cart = Cart();

  @override
  Widget build(BuildContext context) {
    bool isInCart = _cart.items.contains(catalog) ? true : false;
    return ElevatedButton(
      onPressed: () {
        if (!isInCart) {
          isInCart = isInCart.toggle();

          //seting cart
          _cart.catalog = _catalog;
          //adding cart
          _cart.add(catalog);
         
        }
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          context.theme.buttonColor,
        ),
        shape: MaterialStateProperty.all(
          StadiumBorder(),
        ),
      ),
      child: isInCart ? Icon(Icons.done) : Icon(Icons.add),
    );
  }
}