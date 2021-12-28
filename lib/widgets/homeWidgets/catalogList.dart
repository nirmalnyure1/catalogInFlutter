import 'package:catalog_app/models/catalog.dart';
import 'package:catalog_app/utils/route.dart';
import 'package:catalog_app/widgets/homeWidgets/itemView.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CatalogList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return !context.isMobile
        ? GridView.builder(
            // padding: EdgeInsets.all(10.0),
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: CatalogModel.items.length,

            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 50.0,
                mainAxisSpacing: 50.0),
            itemBuilder: (BuildContext context, index) {
              final catalog = CatalogModel.items[index];
              return InkWell(
                onTap: () {
                  context.vxNav.push(
                      Uri(
                          path: MyRoutes.homeDetailRoute,
                          queryParameters: {"id": catalog.id.toString()}),
                      params: catalog);
                  // Navigator.push(context, MaterialPageRoute(builder: (
                  //   BuildContext context,
                  // ) {
                  //   return HomeDetailPage(catalog: CatalogModel.items[index]);
                  // }));

                  // context.vxNav.push(Uri.parse(MyRoutes.homeDetailRoute),
                  //     params: catalog);
                },
                child: ItemView(catalog: catalog),
              );
            },
          ).p16()
        : ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: CatalogModel.items.length,
            itemBuilder: (BuildContext context, index) {
              final catalog = CatalogModel.items[index];
              return InkWell(
                onTap: () {
                  context.vxNav.push(
                      Uri(
                          path: MyRoutes.homeDetailRoute,
                          queryParameters: {"id": catalog.id.toString()}),
                      params: catalog);
                },
                child: ItemView(catalog: catalog),
              );
            },
          );
  }
}
