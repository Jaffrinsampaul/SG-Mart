import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          GestureDetector(
            child: Text(
              "Sign in",
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          GestureDetector(
            child: Text(
              "Registor",
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          IconButton(
              icon: Icon(Icons.shopping_cart_outlined),
              onPressed: () {
                Navigator.pop(context);
              }),
        ],
      ),
    );
  }
}
