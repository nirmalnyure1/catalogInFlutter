import 'package:catalog_app/models/catalog.dart';
import 'package:catalog_app/widgets/homeWidgets/catalogImage.dart';
import 'package:catalog_app/widgets/theme.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

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
              catalog.name.text.lg.bold.color(MyTheme.darkBluishColor).make(),
              catalog.desc.text.make(),
              10.heightBox,
              ButtonBar(
                buttonPadding: Vx.m0,
                //buttonPadding: EdgeInsets.zero,
                alignment: MainAxisAlignment.spaceAround,
                children: [
                  "\$${catalog.price}".text.bold.make(),
                  ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        MyTheme.darkBluishColor,
                      ),
                      shape: MaterialStateProperty.all(
                        StadiumBorder(),
                      ),
                    ),
                    child: "Buy".text.make(),
                  ).pOnly(right: 10)
                ],
              )
            ],
          ))
        ],
      ),
    ).white.roundedLg.square(150).make().py(12);
  }
}