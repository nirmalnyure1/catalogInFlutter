import 'package:catalog_app/core/store.dart';
import 'package:catalog_app/models/cart.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.cardColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: 'Cart'.text.color(context.accentColor).make(),
      ),
      body: Column(
        children: [
          _CartList().p32().expand(),
          Divider(),
          _CartTotal(),
        ],
      ),
    );
  }
}

class _CartTotal extends StatelessWidget {
  _CartTotal({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final Cart _cart = (VxState.store as MyStore).cart;

    return SizedBox(
      height: 200,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          VxConsumer(
            mutations: {RemoveMutation},
            notifications: {},
            builder: (BuildContext context, store, VxStatus? status) {
              return "\$${_cart.totalPrice}"
                  .text
                  .xl4
                  .color(context.theme.accentColor)
                  .make();
            },
          ),
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
                context.theme.buttonColor,
              ),
              shape: MaterialStateProperty.all(
                StadiumBorder(),
              ),
            ),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: 'buying will be support soon'.text.make(),
                ),
              );
            },
            child: "buy".text.xl2.color(Colors.white).make(),
          ).pOnly(right: 10).wh(120, 40),
        ],
      ),
    );
  }
}

class _CartList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [RemoveMutation]);
    final Cart _cart = (VxState.store as MyStore).cart;

    return _cart.items.isEmpty
        ? "nothing to show".text.xl.make().centered()
        : ListView.builder(
            itemCount: _cart.items.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: Icon(Icons.done),
                trailing: IconButton(
                  onPressed: () {
                    RemoveMutation(_cart.items[index]);
                  },
                  icon: Icon(Icons.remove_circle_outline),
                ),
                title: _cart.items[index].name.text.make(),
              );
            });
  }
}
