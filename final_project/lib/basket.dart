import 'package:final_project/buy.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Basket extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[500],
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[600],
        title: Text("Basket"),
        centerTitle: true,
      ),
      body: Consumer<BuyApp>(
        builder: (BuildContext context, BuyApp value, Widget child) {
          return ListView.builder(
            itemCount: value.basketAdd.length + 1,
            itemBuilder: (context, index) {
              if (index == 0) {
                return Text("List of Basket:");
              } else {
                return Center(
                  child: Text(value.basketAdd[index - 1]),
                );
              }
            },
          );
        },
      ),
    );
  }
}
