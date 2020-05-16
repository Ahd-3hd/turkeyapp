import 'package:flutter/material.dart';
import 'package:turkey/components/property_card.dart';
import 'package:turkey/services/get_properties.dart';

class PropertiesPage extends StatefulWidget {
  final List searchValues;
  PropertiesPage({
    Key key,
    @required this.searchValues,
  }) : super(key: key);
  @override
  _PropertiesPageState createState() => _PropertiesPageState();
}

class _PropertiesPageState extends State<PropertiesPage> {
  List searchValues;
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
    });
    filterProperties();
  }

  void filterProperties() async {
    List newData = properties.where((entry) {
      List results = [];

      searchValues.forEach((test) {
        if (test[0] == 'price') {
          results.add(int.parse(entry['acf'][test[0]]) <= int.parse(test[1]));
        } else {
          results.add(entry['acf'][test[0]] == test[1]);
        }
      });

      return !results.contains(false);
    }).toList();
    setState(() {
      extractedData = newData;
      extractedData.length > 0
          ? isContainingResult = true
          : isContainingResult = false;
    });
  }

  @override
  void initState() {
    super.initState();
    isLoading = true;
    searchValues = widget.searchValues;
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
          : isContainingResult
              ? ListView(
                  children: extractedData
                      .map((single) => PropertyCard(propertyData: single))
                      .toList(),
                )
              : Center(
                  child: Text('No Results Match..'),
                ),
    );
  }
}
