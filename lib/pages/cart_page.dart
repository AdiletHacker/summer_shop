import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:summe_shop/models/Cart.dart';
import 'package:summe_shop/widgets/cart_item_list.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cartData = Provider.of<CartDataProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Корзинка счастья"),
      ),
      body: cartData.cartItems.isEmpty
          ? Card(
              elevation: 5,
              margin: const EdgeInsets.all(30),
              child: Container(
                height: 100,
                width: double.infinity,
                child: Text(
                  "Кoрзина пуста",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            )
          : Column(
              children: [
                Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "Стоимость: " + cartData.totalAmount.toStringAsFixed(2),
                      style: TextStyle(fontSize: 20),
                    ),
                    MaterialButton(
                      child: Text("Купить"),
                      color: Theme.of(context).primaryColor,
                      onPressed: () {
                        cartData.clear();
                      },
                    ),
                  ],
                ),
                Divider(),
                Expanded(
                  child: CartItemList(cartData: cartData),
                )
              ],
            ),
    );
  }
}
