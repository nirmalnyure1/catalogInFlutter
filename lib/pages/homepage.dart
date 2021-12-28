import 'dart:convert' as convert;

import 'package:catalog_app/core/store.dart';
import 'package:catalog_app/models/cart.dart';
import 'package:catalog_app/models/catalog.dart';
import 'package:catalog_app/utils/route.dart';
import 'package:catalog_app/widgets/homeWidgets/catalogHeader.dart';
import 'package:catalog_app/widgets/homeWidgets/catalogList.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:velocity_x/velocity_x.dart';
//import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //url of api
  //final url = "";

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 2));

// for hardcode data
    var catalogJson = await rootBundle.loadString('assets/files/catalog.json');

    //for api
    // var response = await http.get(Uri.parse(url));
    // final catalogJson = response.body;

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
            onPressed: () async {
              // Navigator.pushNamed(context, MyRoutes.cartPageRoute);
              await context.vxNav.push(Uri.parse(MyRoutes.cartPageRoute));
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
