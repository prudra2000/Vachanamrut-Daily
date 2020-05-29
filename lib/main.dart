import 'dart:convert';
import 'package:flutter/material.dart';
import 'listVQuotes.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final String appTitle = 'V App';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appTitle,
      home: MainPage(appTitle: appTitle),
    );
  }
}

class MainPage extends StatelessWidget {
  final String appTitle;

  const MainPage({this.appTitle});

  @override
  Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: Color.fromRGBO(255, 241, 203, 1),
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text('Daily Vachanamrut Readings'),
        backgroundColor: Color.fromRGBO(247, 119, 32, 1),
      ),
    body:JsonPage()
  );
}
}
