import 'package:flutter/material.dart';

class Home extends StatelessWidget {
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
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.fromLTRB(50.0, 60.0, 0, 0),
                        child: Text(
                          "I'm looking for : ",
                          style: TextStyle(color: Colors.white, fontSize: 25),
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
