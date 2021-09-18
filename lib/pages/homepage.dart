import 'package:catalog_app/core/store.dart';
import 'package:catalog_app/models/cart.dart';
import 'package:catalog_app/models/catalog.dart';
import 'package:catalog_app/utils/route.dart';
import 'package:catalog_app/widgets/homeWidgets/catalogHeader.dart';
import 'package:catalog_app/widgets/homeWidgets/catalogList.dart';
import 'package:catalog_app/widgets/theme.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert' as convert;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 2));
    var catalogJson = await rootBundle.loadString('assets/files/catalog.json');
    var decodeData = convert.jsonDecode(catalogJson);

    var productData = decodeData['products'];
    CatalogModel.items =
        List.from(productData).map<Item>((item) => Item.fromMap(item)).toList();
    setState(() {});
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _cart = (VxState.store as MyStore).cart;
    return Scaffold(
      //backgroundColor: context.cardColor,
      backgroundColor: Theme.of(context).canvasColor,
      floatingActionButton: VxBuilder(
        mutations: {AddMutation, RemoveMutation},
        builder: (BuildContext context, store, VxStatus? status) {
          return FloatingActionButton(
            onPressed: () {
              Navigator.pushNamed(context, MyRoutes.cartPageRoute);
            },
            backgroundColor: context.canvasColor,
            child: Icon(
              Icons.stroller_outlined,
              color: context.accentColor,
            ),
          ).badge(
              count: _cart.items.length,
              size: 20,
              color: context.accentColor,
              textStyle: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: context.theme.canvasColor));
        },
      ),
      body: SafeArea(
        child: Container(
          padding: Vx.m16,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CatalogHeader(),
              if (CatalogModel.items.isNotEmpty)
                CatalogList().py32().expand()
              else
                Center(
                  child: CircularProgressIndicator().centered(),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
