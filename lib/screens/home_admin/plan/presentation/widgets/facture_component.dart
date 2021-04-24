import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:negocia/models/plan_model.dart';
import 'package:negocia/screens/home_admin/plan/presentation/provider/plan_payment_provider.dart';
import 'package:negocia/theme/colors.dart';
import 'package:provider/provider.dart';

class FactureComponent extends StatelessWidget {
  FactureComponent({Key key, @required this.plan}) : super(key: key);
  final Plan plan;
  final controllerMmYy = MaskedTextController(mask: '00/00');

  @override
  Widget build(BuildContext context) {
    final planPaymentProvider =
        Provider.of<PlanPaymentProvider>(context, listen: false);

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Form(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(15.0),
                child: Text(
                  'Realizar pago',
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Flexible(
                    flex: 4,
                    child: Image.asset(
                      'assets/icons/icon-negocia-plus.png',
                      height: 40,
                    ),
                  ),
                  SizedBox(width: 10),
                  Container(
                    height: 30,
                    width: 2,
                    color: kprimaryColorPurple,
                  ),
                  SizedBox(width: 10),
                  Flexible(
                    flex: 3,
                    child: SvgPicture.asset(
                      'assets/images/cards/visa.svg',
                      semanticsLabel: 'Visa',
                      height: 40,
                    ),
                  ),
                  SizedBox(width: 5),
                  Flexible(
                    flex: 3,
                    child: Image.asset(
                      'assets/images/cards/masterCard.png',
                      width: 40,
                    ),
                  ),
                  SizedBox(width: 5),
                  Flexible(
                    flex: 3,
                    child: Image.asset(
                      'assets/images/cards/dinnersClub.png',
                      width: 40,
                    ),
                  ),
                  SizedBox(width: 5),
                  Flexible(
                    flex: 3,
                    child: Image.asset(
                      'assets/images/cards/americanExpress.png',
                      width: 40,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8),
              Container(color: kprimaryColorPurple, height: 2),
              SizedBox(height: 8),
              Selector<PlanPaymentProvider, String>(
                  selector: (context, provider) => provider.card.error,
                  builder: (context, error, child) {
                    return _cardText(
                        provider: planPaymentProvider, error: error);
                  }),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Flexible(
                      flex: 3,
                      child: Selector<PlanPaymentProvider, String>(
                          selector: (context, provider) => provider.mmyy.error,
                          builder: (context, error, child) {
                            return _mmyyText(
                                provider: planPaymentProvider, error: error);
                          })),
                  SizedBox(width: 5),
                  Flexible(
                      flex: 3,
                      child: Selector<PlanPaymentProvider, String>(
                          selector: (context, provider) => provider.cvv.error,
                          builder: (context, error, child) {
                            return _cvvText(
                                provider: planPaymentProvider, error: error);
                          })),
                ],
              ),
              Selector<PlanPaymentProvider, String>(
                selector: (context, provider) => provider.brand,
                builder: (context, brand, widget) {
                  return Center(child: Text('$brand'));
                },
              ),
              SizedBox(height: 20),
              // ignore: missing_return
              Consumer<PlanPaymentProvider>(builder: (_, notifier, __) {
                if (notifier.state == NotifierState.initial) {
                  return ButtonTheme(
                      minWidth: MediaQuery.of(context).size.width / 1.5,
                      height: 50,
                      child: RaisedButton(
                        child: Text("Pagar S/ ${plan.planPrecio}"),
                        onPressed: () => planPaymentProvider.makeThePayment(
                            context: context),
                        color: Colors.green,
                        textColor: Colors.white,
                        padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                        splashColor: Colors.grey,
                      ));
                } else if (notifier.state == NotifierState.loading) {
                  return ButtonTheme(
                      minWidth: MediaQuery.of(context).size.width / 1.5,
                      height: 50,
                      child: RaisedButton(
                        child: CircularProgressIndicator(),
                        onPressed: () {},
                        color: Colors.green,
                        textColor: Colors.white,
                        padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                        splashColor: Colors.grey,
                      ));
                } else if (notifier.state == NotifierState.loaded) {
                  return ButtonTheme(
                      minWidth: MediaQuery.of(context).size.width / 1.5,
                      height: 50,
                      child: RaisedButton(
                        child: Text("Pagar S/ ${plan.planPrecio}"),
                        onPressed: null,
                        color: Colors.green,
                        textColor: Colors.white,
                        padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                        splashColor: Colors.grey,
                      ));
                }
              }),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  TextFormField _cardText({PlanPaymentProvider provider, String error}) {
    print('error: $error');
    return TextFormField(
      maxLength: 19,
      keyboardType: TextInputType.number,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        labelText: 'Número de tarjeta',
        prefixIcon: Icon(Icons.credit_card),
        errorText: error,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          borderSide: BorderSide(
            color: Colors.blue,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          borderSide: BorderSide(
            color: Colors.black12,
            width: 2.0,
          ),
        ),
      ),
      onChanged: (String card) => provider.changeCard(card: card),
    );
  }

  Widget _mmyyText({PlanPaymentProvider provider, String error}) {
    print('error: $error');
    return TextFormField(
      controller: controllerMmYy,
      maxLength: 5,
      keyboardType: TextInputType.number,
      textCapitalization: TextCapitalization.none,
      decoration: InputDecoration(
        counterText: '',
        counterStyle: TextStyle(fontSize: 0),
        labelText: 'MM/YY',
        prefixIcon: Icon(Icons.calendar_today),
        errorText: error,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          borderSide: BorderSide(
            color: Colors.blue,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          borderSide: BorderSide(
            color: Colors.black12,
            width: 2.0,
          ),
        ),
      ),
      onChanged: (String mmyy) => provider.changeMmYy(mmyy: mmyy),
    );
  }

  Widget _cvvText({PlanPaymentProvider provider, String error}) {
    return TextFormField(
      maxLength: 4,
      keyboardType: TextInputType.number,
      textCapitalization: TextCapitalization.none,
      decoration: InputDecoration(
        labelText: 'CVV',
        prefixIcon: Icon(Icons.lock),
        errorText: error,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          borderSide: BorderSide(
            color: Colors.blue,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          borderSide: BorderSide(
            color: Colors.black12,
            width: 2.0,
          ),
        ),
      ),
      onChanged: (String cvv) => provider.changeCvv(cvv: cvv),
    );
  }
}
