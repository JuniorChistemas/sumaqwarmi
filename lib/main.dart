import 'package:flutter/material.dart';
import 'package:sumaqwarmi2/src/pages/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SUMAQ WARMI',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color.fromRGBO(249,165,185,1)),
        useMaterial3: true,
      ),
      home: home(),
    );
  }
  Widget inicio(){
    return Column();
  }
}
