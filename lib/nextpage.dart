import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'AboutUs.dart';

class newpage extends StatefulWidget {
  String scantext;

  @override
  newpage(String _scantext) {
    this.scantext = _scantext;
  }

  _newpageState createState() => _newpageState(scantext);
}

class _newpageState extends State<newpage> {
  String scantext;

  @override
  _newpageState(String _scantext) {
    this.scantext = _scantext;
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.lightBlue,
          title: Text("QR Scanned Results"),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
              iconSize: 35,
                icon: Icon(Icons.account_circle_rounded), onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => AboutUs()));
            }),
          ],
        ),
        body: ListView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 20,
                ),
                SelectableText("$scantext")
              ],
            ),
          ],
        ),
      ),
    );
  }
}
