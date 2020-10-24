import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:qrcodescanner/nextpage.dart';

class QrCamera extends StatefulWidget {
  @override
  _QrCameraState createState() => _QrCameraState();
}

class _QrCameraState extends State<QrCamera> {
  bool torch = false;
  GlobalKey qrKey = GlobalKey();
  var qrText = "";
  QRViewController controller;
  bool onnextpage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: GestureDetector(
              onTap: (){
                controller.resumeCamera();
              },
              child: Stack(
                children: [
                  Container(
                    child: QRView(
                      key: qrKey,
                      onQRViewCreated: _onQrCreateView,
                      overlay: QrScannerOverlayShape(
                        borderRadius: 15,
                        borderColor: Colors.black26,
                        borderLength: 40,
                        borderWidth: -1,
                        cutOutSize: 251,
                      ),
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
                            style: TextStyle(color: Colors.white),
                            textAlign: TextAlign.center,
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
              ),
            )));
  }

  @override
  void dispose() {
    controller?.dispose();
    controller.resumeCamera();
    super.dispose();
  }

  _onQrCreateView(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        qrText = scanData;
        controller.pauseCamera();
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => newpage(scanData)));
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
