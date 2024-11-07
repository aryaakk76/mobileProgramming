import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as myhttp;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  final List<Map<String, dynamic>> allUser = [];

  Future<void> getAllUsers() async {
    try {
      final response = await myhttp.get(Uri.parse("https://reqres.in/api/users"));
      final List data = (json.decode(response.body) as Map<String, dynamic>)["data"];

      allUser.addAll(data.cast<Map<String, dynamic>>());
      print(allUser);
    } catch (e) {
      print("Terjadi kesalahan");
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Future Builder"),
      ),
      body: FutureBuilder(
        future: getAllUsers(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: Text("LOADING....."),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text("Terjadi kesalahan: ${snapshot.error}"),
            );
          } else {
            return ListView.builder(
              itemCount: allUser.length,
              itemBuilder: (context, index) => ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.grey[300],
                  backgroundImage: NetworkImage(allUser[index]['avatar']),
                ),
                title: Text("${allUser[index]['first_name']} ${allUser[index]['last_name']}"),
                subtitle: Text("${allUser[index]['email']}"),
              ),
            );
          }
        },
      ),
    );
  }
}
