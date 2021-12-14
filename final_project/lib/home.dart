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
      backgroundColor: Colors.white,
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
              tile(value, "Tree", "200"),
              tile(value, "Water", "100"),
              tile(value, "Lead", "200"),
              tile(value, "Iron", "1000"),
              tile(value, "Tree", "200"),
              tile(value, "Water", "100"),
              tile(value, "Lead", "200"),
              tile(value, "Iron", "1000"),
              tile(value, "Tree", "200"),
              tile(value, "Water", "100"),
              tile(value, "Lead", "200"),
              tile(value, "Iron", "1000"),
            ],
          );
        },
      ),
    );
  }

  ListTile tile(BuyApp buyApp, String pName, String price) {
    return ListTile(
      title: Text(price),
      leading: Text(
        pName,
      ),
      trailing: IconButton(
        icon: (buyApp.basketAdd.contains(pName))
            ? Icon(Icons.done_all)
            : Icon(Icons.exposure_plus_1),
        onPressed: () {
          if (!buyApp.basketAdd.contains(pName)) {
            buyApp.addProduct(pName);
          } else {
            buyApp.removeProduct(pName);
          }
        },
      ),
    );
  }
}
