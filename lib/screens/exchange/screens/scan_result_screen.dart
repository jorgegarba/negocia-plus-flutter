import 'package:flutter/material.dart';
import 'package:negocia/components/layout.dart';
import 'package:negocia/constants.dart';
import 'package:negocia/screens/exchange/view_models/scan_result_view_model.dart';
import 'package:negocia/screens/exchange/widgets/method_bar_status.dart';
import 'package:negocia/theme/colors.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/qr_flutter.dart';

class ScanResultScreen extends StatelessWidget {
  ScanResultScreen({@required this.response, @required this.sedeId});

  final bool response;
  final int sedeId;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ScanResultViewModel>(
          create: (context) => ScanResultViewModel(),
          lazy: false,
        )
      ],
      child: Scaffold(
        appBar: AppBar(
          title: Text('Canjea la Promoción'),
          backgroundColor: primaryColorPurple,
        ),
        body: Layout(
          child: Column(
            children: [
              MethodBarStatus(),
              SizedBox(
                height: 50,
              ),
              Text(
                response
                    ? "¡ El código QR es válido !"
                    : "Oferta no valida en esta sede",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 30,
              ),
              QrImage(
                data: "12345679",
                version: QrVersions.auto,
                size: 200,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "¡ Recuerda que el canje \n de la promoción solo tiene 1 consumo!",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              response
                  ? Padding(
                      padding: EdgeInsets.all(30),
                      child: SizedBox(
                        width: double.infinity,
                        height: 80,
                        child: Consumer<ScanResultViewModel>(
                            builder: (context, provider, child) {
                          if (provider.state == NotifierState.loading) {
                            return Center(
                                child: CircularProgressIndicator(
                              backgroundColor: kprimaryColorYellow,
                            ));
                          } else if (provider.state == NotifierState.initial) {
                            return FlatButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              color: primaryColorYellow,
                              onPressed: () => provider.canjear(
                                  context: context, sedeId: sedeId),
                              child: Text(
                                "Canjea tu promoción",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            );
                          } else {
                            if (provider.failure != null) {
                              return Center(
                                  child: Text(provider.failure.toString(),
                                      style: TextStyle(fontSize: 20)));
                            } else {
                              return Container();
                            }
                          }
                        }),
                      ),
                    )
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }
}
