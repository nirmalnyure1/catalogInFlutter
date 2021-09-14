import 'package:catalog_app/widgets/theme.dart';
import 'package:flutter/material.dart';

import 'package:catalog_app/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetailPage extends StatelessWidget {
  const HomeDetailPage({
    Key? key,
    required this.catalog,
  }) : super(key: key);

  final Item catalog;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.creamColor,
      appBar: AppBar(backgroundColor: Colors.transparent),
      bottomNavigationBar: bottomwidget(catalog).p16(),
      body: SafeArea(
        child: Column(
          children: [
            Hero(
              tag: Key(catalog.id.toString()),
              child: Image.network(
                catalog.image,
              ).p16(),
            ).h32(context),
            Expanded(
              child: VxArc(
                height: 30,
                edge: VxEdge.TOP,
                arcType: VxArcType.CONVEY,
                child: Container(
                  width: context.screenWidth,
                  color: Colors.white,
                  child: Column(
                    children: [
                      50.heightBox,
                      catalog.name.text.lg.bold
                          .color(MyTheme.darkBluishColor)
                          .make(),
                      10.heightBox,
                      catalog.desc.text.color(MyTheme.darkBluishColor).make(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

ButtonBar bottomwidget(catalog) {
  return ButtonBar(
    buttonPadding: Vx.m0,
    //buttonPadding: EdgeInsets.zero,
    alignment: MainAxisAlignment.spaceAround,
    children: [
      "\$${catalog.price}".text.xl.bold.make(),
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
        child: "add to cart".text.make(),
      ).wh(100, 40).pOnly(right: 10),
    ],
  );
}
