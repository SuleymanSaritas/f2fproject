import 'package:flutter/material.dart';
import '../../../core/widget/list_map/product_map_list.dart';
import '../../model/products.dart';
import '../../../utils/dbhelper.dart';
import '../../../../core/components/scaffold/products_scaffold.dart';

class IcreCreamList extends StatefulWidget {
  @override
  _IcreCreamListState createState() => _IcreCreamListState();
}

class _IcreCreamListState extends State<IcreCreamList> {
  DatabaseHelper databaseHelper;
  List<Products> allFoodList;
  int id = 1;
  void initState() {
    super.initState();
    // ignore: deprecated_member_use
    allFoodList = List<Products>();
    databaseHelper = DatabaseHelper();
    databaseHelper.productTable("Icecream").then((allFoodMapList) {
      for (Map readMap in allFoodMapList) {
        allFoodList.add(Products.fromMap(readMap));
      }
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return BuildProductsScaffold(
      "ICE CREAM",
      ListView(
        children: foodItemCreat(context, allFoodList),
      ),
    );
  }
}