import 'package:flutter/material.dart';

class QrScannerScreen extends StatefulWidget {
  static String routename = "/qrscanner";

  @override
  _QrScannerScreenState createState() => _QrScannerScreenState();
}

class _QrScannerScreenState extends State<QrScannerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [Text("data")],
      ),
    );
  }
}
