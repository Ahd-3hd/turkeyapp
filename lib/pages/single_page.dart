import 'package:flutter/material.dart';

class SinglePage extends StatelessWidget {
  final Map propertyData;
  SinglePage({Key key, @required this.propertyData}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    print(propertyData);
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
    );
  }
}

// class SinglePage extends StatefulWidget {
//   final Map propertyData;
//   SinglePage({Key key, @required this.propertyData}) : super(key: key);

//   @override
//   _SinglePageState createState() => _SinglePageState();
// }

// class _SinglePageState extends State<SinglePage> {
//   final Map propertyDataa = this.widget.propertyData;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Row(
//           mainAxisAlignment: MainAxisAlignment.end,
//           children: [
//             Text(propertyDataa['title']['rendered']),
//             Image.asset(
//               'assets/logo.png',
//               fit: BoxFit.contain,
//               height: 45,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
