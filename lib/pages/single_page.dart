import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class SinglePage extends StatefulWidget {
  final Map propertyData;
  SinglePage({Key key, @required this.propertyData}) : super(key: key);

  @override
  _SinglePageState createState() => _SinglePageState();
}

class _SinglePageState extends State<SinglePage> {
  bool expandImage;
  @override
  void initState() {
    super.initState();
    expandImage = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(widget.propertyData['title']['rendered']),
            Image.asset(
              'assets/logo.png',
              fit: BoxFit.contain,
              height: 45,
            ),
          ],
        ),
      ),
      body: Container(
          child: Column(
        children: <Widget>[
          CarouselSlider(
            options: CarouselOptions(
              autoPlay: true,
              enlargeCenterPage: true,
              height: 300,
            ),
            items: [
              widget.propertyData['acf']['image_one'],
              widget.propertyData['acf']['image_two'],
              widget.propertyData['acf']['image_three']
            ]
                .map(
                  (item) => Container(
                    child: Container(
                      margin: EdgeInsets.all(5.0),
                      child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                          child: Stack(
                            children: <Widget>[
                              Image.network(
                                item,
                                fit: BoxFit.cover,
                                width: 1000.0,
                                height: 500,
                              ),
                            ],
                          )),
                    ),
                  ),
                )
                .toList(),
          ),
        ],
      )),
    );
  }
}
