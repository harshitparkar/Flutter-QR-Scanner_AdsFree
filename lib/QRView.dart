import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QrCamera extends StatefulWidget {
  @override
  _QrCameraState createState() => _QrCameraState();
}

class _QrCameraState extends State<QrCamera> {
  bool torch = false;
  GlobalKey qrKey = GlobalKey();
  var qrText = "";
  QRViewController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Column(
      children: [
        Expanded(
            flex: 5,
            child: Stack(
              children: [
                Container(
                  child: QRView(
                    overlay: QrScannerOverlayShape(
                      borderRadius: 15,
                      borderColor: Colors.black26,
                      borderLength: 40,
                      borderWidth: -1,
                      cutOutSize: 251,
                    ),
                    key: qrKey,
                    onQRViewCreated: _onQrCreateView,
                  ),
                ),
                Align(
                  child: Image.asset(
                    "assets/borde.png",
                    width: 280,
                  ),
                ),
                Align(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "Designed & Developed\n",
                      style: TextStyle(color: Colors.white),textAlign: TextAlign.center,
                    ),
                    Image.asset(
                      "assets/Signature.png",
                      scale: 9,
                    ),
                    SizedBox(
                      height: 10,
                    )
                  ],
                )),
                Container(
                  alignment: Alignment.topCenter,
                  padding: EdgeInsets.only(top: 20),
                  child: Column(
                    children: [
                      IconButton(
                          splashColor: Colors.transparent,
                          iconSize: 50,
                          color: Colors.white,
                          icon: torch
                              ? Container(
                                  //color: Colors.red,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(100)),
                                  child: Column(
                                    children: [
                                      Image.asset(
                                        "assets/torchlogo.png",
                                        color: Colors.black,
                                      ),
                                                                          ],
                                  ))
                              : Column(
                            children: [
                              Image.asset(
                                "assets/torchlogo.png",
                                color: Colors.white,
                              ),
                            ],
                          ),
                          onPressed: toggle),
                    ],
                  ),
                ),
              ],
            )),
        Expanded(
            flex: 1,
            child: ListView(
              children: [
                Container(
                    margin: EdgeInsets.all(15),
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(20),),
                    child: Column(
                      children: [
                        Text("Scanned Text",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15)),
                        SelectableText("$qrText", style: TextStyle(fontSize: 20),),
                      ],
                    )),
              ],
            ),
        ),
      ],
    )));
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  Future _onQrCreateView(QRViewController controller) async{
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        qrText = scanData;
      });
    });
  }

  void toggle() {
    setState(() {
      if (torch) {
        torch = false;
        controller.toggleFlash();
      } else {
        torch = true;
        controller.toggleFlash();
      }
    });
  }
}
