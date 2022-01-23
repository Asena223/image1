import 'package:flutter/material.dart';
import 'package:ymgkproje/UI/home.page.dart';

import '../foto.dart';
import 'inputWidget.dart';

class Login123Page extends StatefulWidget {
  @override
  _Login123PageState createState() => _Login123PageState();
}

class _Login123PageState extends State<Login123Page> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding:
              EdgeInsets.only(top: MediaQuery.of(context).size.height / 2.3),
        ),
        Column(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Stack(
                  alignment: Alignment.bottomRight,
                  children: <Widget>[
                    InputWidget(30.0, 0.0),
                  ],
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 0),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => FotoEkle()));
              },
              style: ElevatedButton.styleFrom(
                fixedSize: const Size(200, 60),
                elevation: 10,
                shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(30.0),
                ),
              ),
              child: Text('Image Encryption'),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 30),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomePage()));
              },
              style: ElevatedButton.styleFrom(
                fixedSize: const Size(200, 60),
                elevation: 10,
                shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(30.0),
                ),
              ),
              child: Text('Text Encryption'),
            )

            // roundedRectButton("Let's get Started", signInGradients, true),
            // roundedRectButton("Create an Account", signUpGradients, false),
          ],
        )
      ],
    );
  }
}

// Widget roundedRectButton(
//     String title, List<Color> gradient, bool isEndIconVisible) {
//   return Builder(builder: (BuildContext mContext) {
//     return Padding(
//       padding: EdgeInsets.only(bottom: 10),
//       child: Stack(
//         alignment: Alignment(1.0, 0.0),
//         children: <Widget>[
//           Container(
//             alignment: Alignment.center,
//             width: MediaQuery.of(mContext).size.width / 1.7,
//             decoration: ShapeDecoration(
//               shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(30.0)),
//               gradient: LinearGradient(
//                   colors: gradient,
//                   begin: Alignment.topLeft,
//                   end: Alignment.bottomRight),
//             ),
//             child: Text(title,
//                 style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 18,
//                     fontWeight: FontWeight.w500)),
//             padding: EdgeInsets.only(top: 16, bottom: 16),
//           ),
//           Visibility(
//             visible: isEndIconVisible,
//             child: Padding(
//               padding: EdgeInsets.only(right: 10),
//             ),
//           ),
//
//         ],
//       ),
//     );
//   });
// }
//ilk eklediğimde farklı renkler vermek için eklemiştim
// const List<Color> imageGradients = [
//   Color(0xFF0EDED2),
//   Color(0xFF03A0FE),
// ];
//
// const List<Color> textGradients = [
//   Color(0xFFFF9945),
//   Color(0xFFFc6076),
// ];
