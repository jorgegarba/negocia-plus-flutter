import 'package:flutter/material.dart';
import 'package:negocia/components/slider_button_custom.dart';
import 'package:negocia/routing/router.dart';
import 'package:negocia/screens/banner/providers/banner_providers.dart';
import 'package:provider/provider.dart';

class BannerButtonExchange extends StatefulWidget {
  @override
  _BannerButtonExchangeState createState() => _BannerButtonExchangeState();
}

class _BannerButtonExchangeState extends State<BannerButtonExchange> {
  updateState({BannerProvider banner, BuildContext context}) {
    var ofertaDelevery = banner.offerSelected.ofertaDelivery;
    var idOferta = banner.offerSelected.ofertaDelivery;
    var idEmpresa = 1;
    var fono = banner.fono;
    Navigator.pushNamed(context, Routes.methodRoute, arguments: {
      'fono': fono,
      'ofertaDelivery': ofertaDelevery,
      'idOferta': idOferta,
      'idEmpresa': idEmpresa,
    });
  }

  @override
  Widget build(BuildContext context) {
    final banner = Provider.of<BannerProvider>(context);

    return SliderButtonCustom(
      action: () => updateState(banner: banner, context: context),
      label: Text(
        "Canjear Oferta !!",
        style: TextStyle(
            color: Colors.white, fontWeight: FontWeight.w500, fontSize: 17),
      ),
      icon: Icon(
        Icons.keyboard_arrow_right,
        color: Color.fromRGBO(253, 201, 19, 1),
        size: 28,
      ),
      buttonColor: Colors.white,
      backgroundColor: Color.fromRGBO(121, 46, 159, 1),
      highlightedColor: Color.fromRGBO(253, 201, 19, 1),
      baseColor: Colors.white,
      shimmer: true,
      radius: 30,
      dismissible: false,
    );
  }
}
