import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart';
import 'dart:convert';

class SinglePage extends StatefulWidget {
  final Map propertyData;
  SinglePage({Key key, @required this.propertyData}) : super(key: key);

  @override
  _SinglePageState createState() => _SinglePageState();
}

class _SinglePageState extends State<SinglePage> {
  String username;
  String userphone;
  String useremail;
  String usermsg;
  bool isMessageSent = false;
  Future<bool> handleComment() async {
    Response response = await post(
        'https://www.myturkeyproperty.com/wp-json/contact-form-7/v1/contact-forms/516/feedback',
        body: {
          'testrestname': username,
          'testrestphone': userphone,
          'testrestemail': useremail,
          'testrestmsg': usermsg,
          'propertytitle': widget.propertyData['title']['rendered']
        });
    setState(() {
      isMessageSent = json.decode(response.body)['status'] == 'mail_sent';
    });
    return json.decode(response.body)['status'] == 'mail_sent';
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
        child: ListView(
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
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.0)),
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
            Card(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          widget.propertyData['title']['rendered'],
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: const Color(0xff6C54FF),
                          ),
                        ),
                        Text(
                          "${widget.propertyData['acf']['base_currency']} ${widget.propertyData['acf']['price']}",
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
                          ' ${widget.propertyData['acf']['location']}',
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
                                '${widget.propertyData['acf']['size']} ft/sq',
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
                                widget.propertyData['acf']['bedrooms'],
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
                                widget.propertyData['acf']['bathrooms'],
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
                                widget.propertyData['acf']['type'],
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
            ),
            Container(
              margin: EdgeInsets.only(top: 20.0),
              decoration: BoxDecoration(
                color: const Color(0xff6C54FF),
                borderRadius: BorderRadius.only(topLeft: Radius.circular(150)),
              ),
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.all(10),
                    child: Text(
                      'Intrested in this?',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.all(10),
                        height: 40,
                        width: 250,
                        child: TextField(
                          onChanged: (text) {
                            setState(() {
                              username = text;
                            });
                          },
                          maxLines: 1,
                          decoration: InputDecoration(
                            labelText: username != null && username?.length > 0
                                ? ''
                                : 'Name',
                            filled: true,
                            fillColor: Colors.white,
                            prefixIcon: Icon(
                              FontAwesomeIcons.userAlt,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(10),
                        height: 40,
                        width: 250,
                        child: TextField(
                          onChanged: (text) {
                            setState(() {
                              useremail = text;
                            });
                          },
                          maxLines: 1,
                          decoration: InputDecoration(
                            labelText:
                                useremail != null && useremail?.length > 0
                                    ? ''
                                    : 'Email',
                            filled: true,
                            fillColor: Colors.white,
                            prefixIcon: Icon(
                              FontAwesomeIcons.solidEnvelope,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(10),
                        height: 40,
                        width: 250,
                        child: TextField(
                          onChanged: (text) {
                            setState(() {
                              userphone = text;
                            });
                          },
                          maxLines: 1,
                          decoration: InputDecoration(
                            labelText:
                                userphone != null && userphone?.length > 0
                                    ? ''
                                    : 'Phone No.',
                            filled: true,
                            fillColor: Colors.white,
                            prefixIcon: Icon(
                              FontAwesomeIcons.phoneAlt,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(10),
                        height: 40,
                        width: 250,
                        child: TextField(
                          onChanged: (text) {
                            setState(() {
                              usermsg = text;
                            });
                          },
                          maxLines: 1,
                          decoration: InputDecoration(
                            labelText: usermsg != null && usermsg?.length > 0
                                ? ''
                                : 'Message',
                            filled: true,
                            fillColor: Colors.white,
                            prefixIcon: Icon(
                              FontAwesomeIcons.envelopeOpenText,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        child: FlatButton(
                          onPressed: () async {
                            await handleComment();
                          },
                          child: Text(
                            isMessageSent ? 'Message Sent' : 'Send',
                            style: TextStyle(
                                color: isMessageSent
                                    ? Colors.white
                                    : Colors.white),
                          ),
                          color: isMessageSent
                              ? Colors.green[300]
                              : const Color(0xff2A3143),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
