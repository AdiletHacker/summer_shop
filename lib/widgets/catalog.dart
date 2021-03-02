import 'package:flutter/material.dart';
import 'package:summe_shop/pages/catalog_page.dart';

class CatalogListTile extends StatelessWidget {
  final imgUrl;

  CatalogListTile({Key key, this.imgUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return ItemCatalog(imgUrl: imgUrl);
            },
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        child: ListTile(
          leading: Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                  image: NetworkImage(imgUrl), fit: BoxFit.cover),
            ),
          ),
          title: Text("Летний освежающий набор"),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("09:00 - 00:00"),
              Row(
                children: [
                  Icon(
                    Icons.star,
                    size: 15,
                    color: Colors.amberAccent,
                  ),
                  Text("4.9")
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
