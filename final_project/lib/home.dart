import 'package:final_project/basket.dart';
import 'package:final_project/buy.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeApp extends StatefulWidget {
  @override
  _HomeAppState createState() => _HomeAppState();
}

class _HomeAppState extends State<HomeApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[500],
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[600],
        title: const Text(
          "List of product",
        ),
        centerTitle: true,
        actions: <Widget>[
          FlatButton(
            child: const Text(
              "basket",
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Basket(),
                ),
              );
            },
          ),
        ],
      ),
      body: Consumer<BuyApp>(
        builder: (BuildContext context, BuyApp value, Widget child) {
          return ListView(
            children: <Widget>[
              title(value, "name", "price"),
              title(value, "name", "price"),
            ],
          );
        },
      ),
    );
  }

  ListTile title(BuyApp buyApp, String name, String price) {
    return ListTile(
      title: Text(name),
      leading: CircleAvatar(
        child: Text(price),
      ),
      trailing: IconButton(
        icon: (buyApp.basketAdd.contains(name))
            ? Icon(Icons.done_all)
            : Icon(Icons.exposure_plus_1),
        onPressed: () {
          if (buyApp.basketAdd.contains(name)) {
            buyApp.removeProduct(name);
          } else {
            buyApp.addProduct(name);
          }
        },
      ),
    );
  }
}
