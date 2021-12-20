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
            padding: const EdgeInsets.all(8),
            children: <Widget>[
              tile(value, "Apple", "100tg", "this a description of Apple"),
              tile(value, "Samsung", "100tg", "this a description of Samsung"),
              tile(value, "Sony", "200tg", "this a description of Sony"),
              tile(value, "Tesla", "1000tg", "this a description of Tesla"),
              tile(value, "Apple", "200tg", "this a description of Apple"),
              tile(value, "Apple", "100tg", "this a description of Apple"),
              tile(value, "Tesla", "200tg", "this a description of Tesla"),
              tile(value, "Sony", "1000tg", "this a description of Sony"),
              tile(value, "Tesla", "200tg", "this a description of Tesla"),
              tile(value, "Samsung", "100tg", "this a description of Samsung"),
              tile(value, "Samsung", "200tg", "this a description of Samsung"),
              tile(value, "Sony", "1000tg", "this a description of Sony"),
            ],
          );
        },
      ),
    );
  }

  ListTile tile(BuyApp buyApp, String pName, String price, String des) {
    return ListTile(
      title: Text(price),
      subtitle: Text(des),
      leading: CircleAvatar(
        radius: 30.0,
        backgroundImage: AssetImage("images/$pName.png"),
        child: Text(
          pName,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        //Text(
        //   pName,
        //   style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        // ),
        //
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
