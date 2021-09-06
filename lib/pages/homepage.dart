import 'package:catalog_app/widgets/drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final int days = 30;
  final String name = 'codepur';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calalog'),
      ),
      body: Center(
        child: Container(
          child: Text(
            context.runtimeType.toString(),
            style: TextStyle(color: Colors.black),
          ),
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}
