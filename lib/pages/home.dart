import 'package:flutter/material.dart';
import 'package:turkey/components/header.dart';
import 'package:turkey/components/homeSearch.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Image.asset(
              'assets/logo.png',
              fit: BoxFit.contain,
              height: 45,
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            HeaderWidget(),
            HomeSearch(),
          ],
        ),
      ),
    );
  }
}
