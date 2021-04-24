import 'package:flutter/cupertino.dart';
import 'package:negocia/models/espacios_model.dart';
import 'package:url_launcher/url_launcher.dart';

class BannerProvider with ChangeNotifier {
  int selected;

  EspaciosOferta _offerSelected = EspaciosOferta();
  EspaciosOferta get offerSelected => _offerSelected;

  List<EspaciosOferta> _oferts = [];
  List<EspaciosOferta> get offerts => _oferts;

  int _indexSelected = 0;
  int get indexSelected => _indexSelected;

  String _fono = '';
  String get fono => _fono;

  BannerProvider(EspaciosModel espaciosModel) {
    if (espaciosModel.espaciosOferta.isNotEmpty) {
      this._fono = espaciosModel.empresa.empresa.empresaFono;
      this._oferts = espaciosModel.espaciosOferta;
      this._offerSelected = offerts[0];
      this._indexSelected = 0;
      notifyListeners();
    }
  }

  ofertActual(int index) {
    this._offerSelected = offerts[index];
    this._indexSelected = index;
    notifyListeners();
  }

  getSedes() {}

  openMap(latitude, longitude) async {
    String googleUrl =
        'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude';
    if (await canLaunch(googleUrl)) {
      await launch(googleUrl);
    } else {
      throw 'Could not open the map.';
    }
  }
}
