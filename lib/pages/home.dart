import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  String locationValue = 'Location';
  String typeValue = 'Type';
  String priceValue = 'Max Price';

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
            Positioned(
              height: MediaQuery.of(context).size.height / 2,
              width: MediaQuery.of(context).size.width,
              top: 0,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.only(bottomLeft: Radius.circular(150)),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("assets/header.jpg"),
                  ),
                ),
              ),
            ),
            Positioned(
              height: MediaQuery.of(context).size.height / 2,
              width: MediaQuery.of(context).size.width,
              bottom: 0,
              child: Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                    borderRadius:
                        BorderRadius.only(topLeft: Radius.circular(150)),
                    color: const Color(0xff2980b9),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.fromLTRB(50.0, 60.0, 0, 0),
                        child: Text(
                          "I'm looking for : ",
                          style: TextStyle(color: Colors.white, fontSize: 25),
                        ),
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              child: DropdownButton<String>(
                                value: locationValue,
                                icon: Icon(Icons.arrow_downward,
                                    color: Colors.white),
                                iconSize: 24,
                                elevation: 16,
                                style: TextStyle(color: Colors.white),
                                underline: Container(
                                  height: 2,
                                  color: Colors.white,
                                ),
                                onChanged: (String newValue) {
                                  setState(() {
                                    locationValue = newValue;
                                  });
                                },
                                items: <String>[
                                  'Location',
                                  'Antalia',
                                  'Bursa',
                                  'Fethiye',
                                  'Istanbul',
                                ].map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              ),
                            ),
                            Container(
                              child: DropdownButton<String>(
                                value: typeValue,
                                icon: Icon(Icons.arrow_downward,
                                    color: Colors.white),
                                iconSize: 24,
                                elevation: 16,
                                style: TextStyle(color: Colors.white),
                                underline: Container(
                                  height: 2,
                                  color: Colors.white,
                                ),
                                onChanged: (String newValue) {
                                  setState(() {
                                    typeValue = newValue;
                                  });
                                },
                                items: <String>[
                                  'Type',
                                  'Apartment',
                                  'Penthouse',
                                  'Villa',
                                ].map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              ),
                            ),
                            Container(
                              child: DropdownButton<String>(
                                value: priceValue,
                                icon: Icon(
                                  Icons.arrow_downward,
                                  color: Colors.white,
                                ),
                                iconSize: 24,
                                elevation: 16,
                                style: TextStyle(color: Colors.white),
                                underline: Container(
                                  height: 2,
                                  color: Colors.white,
                                ),
                                onChanged: (String newValue) {
                                  setState(() {
                                    priceValue = newValue;
                                  });
                                },
                                items: <String>[
                                  'Max Price',
                                  '50000',
                                  '100000',
                                  '150000',
                                  '200000',
                                  '300000',
                                  '400000',
                                  '500000',
                                ].map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
