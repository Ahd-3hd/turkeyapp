import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      height: MediaQuery.of(context).size.height / 2,
      width: MediaQuery.of(context).size.width,
      top: 0,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(150)),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage("assets/header.jpg"),
          ),
        ),
      ),
    );
  }
}
