import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
BuildShoppingContainer(
  String productName,
  BuildContext context,
  Widget destination,
  String assetsPath,
) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => destination));
    },
    child: Container(
      padding: const EdgeInsets.all(8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(assetsPath),
          Text(
            productName,
            style: TextStyle(
              fontSize: 20,
            ),
          )
        ],
      ),
      color: Colors.grey.shade300,
    ),
  );
}
