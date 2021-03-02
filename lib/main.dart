import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:summe_shop/models/Cart.dart';
import 'package:summe_shop/models/Product.dart';
import 'package:summe_shop/pages/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ProductDataProvider>(
          create: (context) => ProductDataProvider(),
        ),
        ChangeNotifierProvider<CartDataProvider>(
          create: (context) => CartDataProvider(),
        )
      ],
      child: MaterialApp(
          title: 'Demo App',
          theme: ThemeData(
              primarySwatch: Colors.amber,
              backgroundColor: Colors.white,
              textTheme:
                  GoogleFonts.marmeladTextTheme(Theme.of(context).textTheme)),
          home: HomePage()),
    );
  }
}
