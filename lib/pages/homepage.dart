import 'package:catalog_app/widgets/drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final int days = 30;
  final String name = 'codepur';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Calalog'),
          centerTitle: true,
        ),
        body: Center(
          child: Container(
            child: Text(
              'wellcomem to $days day tutorial in flutter by $name',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ),
        drawer:MyDrawer(),
      ),
    );
  }
}
