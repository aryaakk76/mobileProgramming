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
        appBar: AppBar(title: Text("dialog example")),
        body: DialogExample(),
      ),
    );
  }
}

class DialogExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) =>
                    AlertDialog(
                      title: Text("hallooo"),
                      content: Text("this is a normal dialog"),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: Text("close"),
                        ),
                      ],
                    ),
              );
            },
            child: Text("show normal dialog"),
          ),
          ElevatedButton(
            onPressed: () {
              Get.defaultDialog(
                title: "haloo",
                middleText: "this adalah getx dialog",
              );
            },
            child: Text("show getx dialog"),
          ),
        ],
      ),
    );
  }
}