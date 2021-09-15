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
  const _CartTotal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          "\$9999".text.xl4.color(context.theme.accentColor).make(),
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
  const _CartList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Icon(Icons.done),
            trailing: IconButton(
              onPressed: () {},
              icon: Icon(Icons.remove_circle_outline),
            ),
            title: "items".text.make(),
          );
        });
  }
}
