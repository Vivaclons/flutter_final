import 'package:final_project/buy.dart';
import 'package:final_project/login.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(
      const MyApp(
          // initialRoute: '/',
          // routes: {
          //   '/basket': (context) => Basket(),
          //   '/': (context) => HomeApp(),
          // },
          ),
    );

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => BuyApp(),
      child: MaterialApp(
        home: LoginApp(),
      ),
    );
  }
}
