import 'package:flutter/material.dart';
import 'package:networking/adddata.dart';
import 'package:networking/editdata.dart';
import 'package:networking/networking_https.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness: Brightness.dark),
      routes: {
        '/adddata': (context) => AddData(),
        '/home': (context) => NetworkingHttps(),
        '/editdata': (context) => EditData(),
      },
      home: NetworkingHttps(),
    );
  }
}
