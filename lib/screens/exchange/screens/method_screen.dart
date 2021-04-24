import 'package:flutter/material.dart';
import 'package:negocia/components/layout.dart';
import 'package:negocia/constants.dart';
import 'package:negocia/screens/exchange/view_models/method_view_model.dart';
import 'package:negocia/screens/exchange/widgets/method_bar_status.dart';
import 'package:negocia/screens/exchange/widgets/method_button.dart';
import 'package:negocia/screens/exchange/widgets/method_title.dart';
import 'package:negocia/theme/colors.dart';
import 'package:provider/provider.dart';

class MethodScreen extends StatelessWidget {
  static var routeName;

  final String fono;
  final bool ofertaDelivery;
  final idOferta;
  final idEmpresa;

  MethodScreen({this.ofertaDelivery, this.idOferta, this.idEmpresa, this.fono});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<MethodViewModel>(
          create: (context) => MethodViewModel(context: context),
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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              MethodBarStatus(),
              if (ofertaDelivery)
                Builder(builder: (context) => _buildDelivery(context)),
              SizedBox(
                height: 20,
              ),
              // _buildPresential(context),
              if (!ofertaDelivery)
                Container(
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      MethodTitle(
                        title: "Presencial",
                        icon: Icons.access_alarm,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Consumer<MethodViewModel>(
                              builder: (context, provider, child) {
                            if (provider.state == NotifierState.loading) {
                              return Center(
                                  child: CircularProgressIndicator(
                                backgroundColor: kprimaryColorYellow,
                              ));
                            } else if (provider.state ==
                                NotifierState.initial) {
                              return MethodButton(
                                onPressed: () =>
                                    provider.scanQR(context: context),
                                title: "Escanear QR",
                                icon: Icons.qr_code_scanner,
                              );
                            } else {
                              if (provider.failure != null) {
                                return Center(
                                    child: Text(provider.failure.toString(),
                                        style: TextStyle(fontSize: 20)));
                              } else {
                                return MethodButton(
                                  onPressed: null,
                                  title: "QR Escaneado",
                                  icon: Icons.qr_code_scanner,
                                );
                              }
                            }
                          }),
                        ],
                      )
                    ],
                  ),
                ),
              SizedBox(
                height: 50,
              ),
              Container(
                width: 250,
                child: Text(
                  "* Usa cualquier método de contacto con la empresa para acceder a la promoción.",
                  textAlign: TextAlign.center,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Container _buildDelivery(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 40,
          ),
          MethodTitle(
            title: "Delivery",
            icon: Icons.access_alarm,
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MethodButton(
                onPressed: () => MethodViewModel()
                    .openWhatsapp(cellphone: fono, context: context),
                title: "Whatsapp",
                icon: Icons.access_alarm,
              ),
              SizedBox(
                width: 20,
              ),
              MethodButton(
                onPressed: () => MethodViewModel().phoneCall(fono),
                title: "Llamar",
                icon: Icons.access_alarm,
              ),
            ],
          )
        ],
      ),
    );
  }

  Container _buildPresential(context) {
    return Container(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 20,
          ),
          MethodTitle(
            title: "Presencial",
            icon: Icons.access_alarm,
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Consumer<MethodViewModel>(builder: (context, provider, child) {
                if (provider.state == NotifierState.initial) {
                  return MethodButton(
                    onPressed: () => MethodViewModel().scanQR(context: context),
                    title: "Escanear QR",
                    icon: Icons.qr_code_scanner,
                  );
                } else if (provider.state == NotifierState.loading) {
                  return Center(
                      child: CircularProgressIndicator(
                    backgroundColor: kprimaryColorYellow,
                  ));
                } else {
                  if (provider.failure != null) {
                    return Center(
                        child: Text(provider.failure.toString(),
                            style: TextStyle(fontSize: 20)));
                  } else {
                    return MethodButton(
                      onPressed: () {},
                      title: "QR Escaneado",
                      icon: Icons.qr_code_scanner,
                    );
                  }
                }
              }),
            ],
          )
        ],
      ),
    );
  }
}
