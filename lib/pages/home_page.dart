import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:summe_shop/models/Product.dart';
import 'package:summe_shop/widgets/catalog.dart';
import 'package:summe_shop/widgets/item_card.dart';
import 'package:summe_shop/widgets/bottom_bar.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<ProductDataProvider>(context);

    return Scaffold(
      backgroundColor: Colors.amberAccent,
      body: SafeArea(
          child: Container(
        height: MediaQuery.of(context).size.height - 85,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            )),
        child: ListView(
          padding: EdgeInsets.all(10),
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          children: [
            Container(
              child: ListTile(
                title: Text(
                  "Освежающие напитки",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  "Больше чем сто видов коктелей",
                  style: TextStyle(fontSize: 16),
                ),
                trailing: Icon(Icons.add_comment_outlined),
              ),
            ),
            Container(
              height: 290,
              padding: EdgeInsets.all(5.0),
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  physics: BouncingScrollPhysics(),
                  itemCount: productData.items.length,
                  itemBuilder: (context, index) => ChangeNotifierProvider.value(
                        value: productData.items[index],
                        child: ItemCard(),
                      )),
            ),
            Padding(
              child: Text("Каталог коктелей"),
              padding: const EdgeInsets.all(10),
            ),
            ...productData.items.map((item) {
              return CatalogListTile(imgUrl: item.imgUrl);
            }).toList()
          ],
        ),
      )),
      bottomNavigationBar: BottomBar(),
    );
  }
}
