import 'package:final_project/buy.dart';
import 'package:final_project/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Basket extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
                return const Center(
                  child: Text(
                    "List of Basket:",
                    style: TextStyle(fontSize: 20),
                  ),
                );
              } else {
                return Row(
                  children: [
                    Text(
                      value.basketAdd[index - 1],
                      style: const TextStyle(
                        fontSize: 18,
                        height: 2,
                        letterSpacing: 5,
                      ),
                    ),
                  ],
                );
              }
            },
          );
        },
        child: Column(
          children: [
            RaisedButton(
              padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
              color: Colors.blueGrey[600],
              textColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Text('Buy'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomeApp(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
