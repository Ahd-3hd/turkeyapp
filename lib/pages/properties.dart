import 'package:flutter/material.dart';
import 'package:turkey/components/property_card.dart';
import 'package:turkey/services/get_properties.dart';

class PropertiesPage extends StatefulWidget {
  final List<String> searchValues;
  PropertiesPage({
    Key key,
    @required this.searchValues,
  }) : super(key: key);
  @override
  _PropertiesPageState createState() => _PropertiesPageState();
}

class _PropertiesPageState extends State<PropertiesPage> {
  List<String> searchValues;
  List properties;
  List extractedData;
  bool isLoading;
  bool isContainingResult;
  void getProperties() async {
    GetProperties instance = GetProperties();
    await instance.getData();
    setState(() {
      properties = instance.myData;
      extractedData = properties;
      isLoading = false;
      print(properties);
      extractedData.length > 0
          ? isContainingResult = true
          : isContainingResult = false;
    });
  }

  @override
  void initState() {
    super.initState();
    isLoading = true;
    searchValues = this.widget.searchValues;
    getProperties();
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
      body: isLoading
          ? Center(
              child: Text(
                'Loading ...',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.pink[900],
                ),
              ),
            )
          : ListView(
              children: properties
                  .map((single) => PropertyCard(propertyData: single))
                  .toList(),
            ),
    );
  }
}
