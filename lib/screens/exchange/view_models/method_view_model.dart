import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_open_whatsapp/flutter_open_whatsapp.dart';
import 'package:negocia/constants.dart';
import 'package:negocia/models/failure_model.dart';
import 'package:negocia/routing/router.dart';
import 'package:negocia/services/advertising_space_service.dart';
import 'package:url_launcher/url_launcher.dart';

enum NotifierState { initial, loading, loaded }

class MethodViewModel with ChangeNotifier {
  BuildContext context;
  MethodViewModel({this.context});

  void phoneCall(String cellphone) async {
    String url = 'tel:+51' + cellphone;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  openWhatsapp({String cellphone, BuildContext context}) {
    List<String> fonoList = cellphone.split('');
    if (fonoList[0] == '9') {
      String phone = '51$cellphone';
      FlutterOpenWhatsapp.sendSingleMessage("$phone",
          "Hola vengo a aplicar mi promocion de parte de Negocia+ #1234568wweA78");
    } else {
      Scaffold.of(context).showSnackBar(
        SnackBar(
          duration: animationDuration,
          backgroundColor: Colors.amber,
          content: Row(
            children: [
              Icon(
                Icons.error_outline,
                color: Colors.white,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                "Whatsapp no registrado 😁",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      );
    }
  }

  NotifierState _state = NotifierState.initial;
  NotifierState get state => _state;
  void _setState(NotifierState state) {
    _state = state;
    notifyListeners();
  }

  Failure _failure;
  Failure get failure => _failure;
  void _setFailure(Failure failure) {
    _failure = failure;
    notifyListeners();
  }

  scanQR({BuildContext context}) async {
    _setState(NotifierState.loading);
    try {
      String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          "#ff6666", "Cancel", true, ScanMode.QR);
      final int sedeId = int.parse(barcodeScanRes);
      final bool response =
          await AdvertisingSpaceService().validCajeSecure(sedeId: sedeId);
      Navigator.pushNamed(context, Routes.scanResultRoute, arguments: {
        'response': response,
        'sedeId': sedeId,
      });
    } on Failure catch (f) {
      _setFailure(f);
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: Text("Código QR"),
                content: Text(f.message),
                actions: [],
              ));
    }
    _setState(NotifierState.loaded);
  }
}
