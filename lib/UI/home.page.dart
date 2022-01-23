import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'my_encryption.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController tec = TextEditingController();
  var encryptedText, plainText;
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          title: Text("Encryption/Decryption"),
          backgroundColor: Color.fromRGBO(4, 41, 58, 0.8),
        ),
        body: SingleChildScrollView(
          child: Container(
              child: Container(
            height: _height,
            width: _width,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.0, 2.0],
                colors: [
                  Color.fromRGBO(26, 55, 77, 8),
                  Color.fromRGBO(143, 193, 212, 0.9),
                ],
              ),
            ),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(45.0),
                  child: TextField(
                    controller: tec,
                  ),
                ),
                Column(
                  children: [
                    Text(
                      "PLAIN TEXT",
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(plainText == null ? "" : plainText),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      "ENCRYPTED TEXT",
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(encryptedText == null
                          ? ""
                          : encryptedText is encrypt.Encrypted
                              ? encryptedText.base64
                              : encryptedText),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(30.0))),
                      elevation: 10,
                      onPressed: () {
                        plainText = tec.text;
                        setState(() {
                          encryptedText =
                              MyEncryptionDecryption.encryptFernet(plainText);
                        });
                        tec.clear();
                      },
                      child: Text("Encrypt"),
                      padding: EdgeInsets.fromLTRB(60.0, 20.0, 60.0, 20.0),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(30.0))),
                      onPressed: () {
                        setState(() {
                          encryptedText = MyEncryptionDecryption.decryptFernet(
                              encryptedText);
                          print(
                              "Type: " + encryptedText.runtimeType.toString());
                        });
                      },
                      child: Text("Decrypt"),
                      padding: EdgeInsets.fromLTRB(60.0, 20.0, 60.0, 20.0),
                    )
                  ],
                ),
              ],
            ),
          )),
        ));
  }
}
