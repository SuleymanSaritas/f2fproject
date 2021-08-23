import 'package:flutter/material.dart';
import 'package:lego_market_app/core/components/shopping_options/shopping_options.dart';
import 'package:lego_market_app/core/constant/app_bar/home_appbar.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: HomeAppBar(context),
      body: ShoppingOptions(),
    );
  }
}