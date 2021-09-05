import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  int days = 30;
  String name = 'codepur';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Calalog'),
        ),
        body: Container(
          child: Text(
            'wellcomem to $days day tutorial in flutter by $name',
            style: TextStyle(color: Colors.black),
          ),
        ),
        drawer: Drawer(),
      ),
    );
  }
}
