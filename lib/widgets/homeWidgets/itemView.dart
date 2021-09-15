import 'package:catalog_app/widgets/cartWidgets/addToCart.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:catalog_app/models/cart.dart';
import 'package:catalog_app/models/catalog.dart';
import 'package:catalog_app/widgets/homeWidgets/catalogImage.dart';

class ItemView extends StatelessWidget {
  final Item catalog;
  const ItemView({Key? key, required this.catalog}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final image = catalog.image;
    return VxBox(
      child: Row(
        children: [
          Hero(
            tag: Key(catalog.id.toString()),
            child: CatalogImage(
              image: image,
            ),
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              catalog.name.text.lg.bold.color(context.accentColor).make(),
              catalog.desc.text.make(),
              10.heightBox,
              ButtonBar(
                buttonPadding: Vx.m0,
                //buttonPadding: EdgeInsets.zero,
                alignment: MainAxisAlignment.spaceAround,
                children: [
                  "\$${catalog.price}".text.bold.make(),
                  AddToCart(catalog: catalog).pOnly(right: 10)
                ],
              )
            ],
          ))
        ],
      ),
    ).color(context.cardColor).roundedLg.square(150).make().py(12);
  }
}

