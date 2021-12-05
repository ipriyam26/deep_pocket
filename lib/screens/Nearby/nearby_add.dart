import 'package:flutter/material.dart';

class NearbAdd extends StatelessWidget {
  static const route = '/nearby-tabs/nearby-first/nearby-add';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(16, 15, 1, 1),
        title: const Text(
          "Add A Place",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
