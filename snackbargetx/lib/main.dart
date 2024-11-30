import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Snackbar example")),
        body: SnackBarExample(),
      ),
    );
  }
}

class SnackBarExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("hello dari snackbar")),
              );
            },
            child: Text("show normal snackbar"),
          ),
          ElevatedButton(
            onPressed: () {
              Get.snackbar(
                "hello",
                "this is getx snacknar",
                snackPosition: SnackPosition.BOTTOM,
              );
            },
            child: Text("show getx snackbar"),
          ),
        ],
      ),
    );
  }
}
