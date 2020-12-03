import 'package:flutter/material.dart';
import 'package:hackersnews/news/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HACKERSNEWS',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        
        primaryColor: Colors.black,
       
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Home (),
    );
  }
} 

