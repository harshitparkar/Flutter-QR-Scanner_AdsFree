import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AboutUs extends StatefulWidget {
  @override
  _AboutUsState createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          child: Center(
              child: Column(
                children: [
                  Expanded(
                    flex: 10,
                    child: Stack(
                      children: [
                        Center(
                          child: Container(
                            padding: EdgeInsets.only(top: 30),
                            alignment: Alignment.topCenter,
                            child: Image.asset("assets/dev.gif",scale: 2.4,),
                          ),
                        ),
                        Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(height: 150,),
                              Text("Designed & Developed:\n", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
                              Image.asset(
                                "assets/Signature.png",
                                color: Colors.black,
                                scale: 7,
                              ),
                              Text("\nVersion 2.0", style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),),
                              Text("\n\nContact Us: test@test.com", style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),),
                            ],
                          ),
                        ),


                      ],
                    ),
                  ),
                  Expanded(
                      flex: 1,
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("© 2020 - 2021", style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Made with ", style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),),
                                Image.asset(
                                  "assets/heart.png",
                                  scale: 20,
                                  color: Colors.red,
                                ),
                                Text(" in INDIA.", style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),)
                              ],
                            ),
                          ],
                        ),
                      )
                  )
                ],
              )),
        ),
      ),
    );
  }
}

