import 'package:flutter/material.dart';
import 'package:negocia/models/espacios_model.dart';
import 'package:negocia/screens/banner/components/banner_none_offerts.dart';
import 'package:negocia/screens/banner/providers/banner_providers.dart';
import 'package:negocia/screens/banner/screens/banner_body_screen.dart';
import 'package:negocia/screens/banner/widgets/banner_button_exchange.dart';
import 'package:provider/provider.dart';

class BannerScreen extends StatelessWidget {
  const BannerScreen({Key key, this.espaciosModel}) : super(key: key);

  final EspaciosModel espaciosModel;
  @override
  Widget build(BuildContext context) {
    List<EspaciosOferta> espaciosOferta = espaciosModel.espaciosOferta ?? [];
    print(espaciosOferta.isNotEmpty);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<BannerProvider>(
          create: (_) => BannerProvider(espaciosModel),
          lazy: false,
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: Image.asset(
            'assets/icons/logo-1.png',
            width: 90,
          ),
          backgroundColor: Colors.white,
        ),
        body: espaciosOferta.isNotEmpty ? BannerBodyScreen() : NoneOffert(),
        bottomSheet: espaciosOferta.isNotEmpty
            ? Container(
                color: Colors.transparent,
                margin: EdgeInsets.symmetric(vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    BannerButtonExchange(),
                  ],
                ),
              )
            : Container(),
      ),
    );
  }
}
