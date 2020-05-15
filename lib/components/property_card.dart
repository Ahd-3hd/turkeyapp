import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PropertyCard extends StatelessWidget {
  final bool isEligible = false;
  final Map propertyData;
  PropertyCard({Key key, @required this.propertyData}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: InkWell(
        onTap: () {
          Navigator.of(context).pushNamed(
            '/properties/single',
          );
        },
        child: Card(
          child: Column(
            children: <Widget>[
              Stack(children: <Widget>[
                Image.network(
                  propertyData['acf']['image_one'],
                  fit: BoxFit.cover,
                ),
                if (isEligible)
                  Positioned(
                    width: 70,
                    child: Image.asset(
                      'assets/passport.png',
                    ),
                    right: 0,
                  )
              ]),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          propertyData['title']['rendered'],
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: const Color(0xff6C54FF),
                          ),
                        ),
                        Text(
                          "${propertyData['acf']['base_currency']} ${propertyData['acf']['price']}",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: const Color(0xff6C54FF),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          FontAwesomeIcons.mapMarkerAlt,
                          size: 15,
                          color: Colors.blueGrey[600],
                        ),
                        Text(
                          ' Istanbul',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.blueGrey[600],
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              FontAwesomeIcons.ruler,
                              size: 17,
                              color: Colors.blueGrey[600],
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                              child: Text(
                                '120 ft/sq',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blueGrey[600],
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              FontAwesomeIcons.bed,
                              size: 17,
                              color: Colors.blueGrey[600],
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                              child: Text(
                                '2',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blueGrey[600],
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              FontAwesomeIcons.bath,
                              size: 17,
                              color: Colors.blueGrey[600],
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                              child: Text(
                                '2',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blueGrey[600],
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              FontAwesomeIcons.home,
                              size: 17,
                              color: Colors.blueGrey[600],
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                              child: Text(
                                'Villa',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blueGrey[600],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
