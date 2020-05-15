import 'package:flutter/material.dart';
import 'package:turkey/components/property_card.dart';

class PropertiesPage extends StatefulWidget {
  final List<String> data;
  PropertiesPage({
    Key key,
    @required this.data,
  }) : super(key: key);
  @override
  _PropertiesPageState createState() => _PropertiesPageState();
}

class _PropertiesPageState extends State<PropertiesPage> {
  List<String> searchValues;
  bool isEligible;
  @override
  void initState() {
    super.initState();
    searchValues = this.widget.data;
    isEligible = false;
  }

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
      body: ListView(children: [
        PropertyCard(isEligible: isEligible),
      ]),
    );
  }
}
