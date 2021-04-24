import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:negocia/constants.dart';
import 'package:negocia/models/failure_model.dart';
import 'package:negocia/models/plan_model.dart';
import 'package:negocia/models/validation_item_model.dart';
import 'package:negocia/routing/router.dart';
import 'package:negocia/services/payment_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum NotifierState { initial, loading, loaded }

class PlanPaymentProvider extends ChangeNotifier {
  PlanPaymentProvider({@required this.plan});
  final Plan plan;

  String _any = 'Otra Tarjeta';
  String _visa = "Visa";
  String _masterCard = "Master Card";
  String _dinersClub = "Diners Club";
  String _americanExpress = "American Express";
  String _brand = "";

  //Getters
  String get any => _any;
  String get visa => _visa;
  String get masterCard => _masterCard;
  String get dinersClub => _dinersClub;
  String get americanExpress => _americanExpress;
  String get brand => _brand;

  //Setter
  void _setBrand(String brand) {
    print('brand: $brand');
    this._brand = brand;
    notifyListeners();
  }

  ValidationItem _card = ValidationItem(null, null);
  ValidationItem _mmyy = ValidationItem(null, null);
  ValidationItem _cvv = ValidationItem(null, null);

  //Getters
  ValidationItem get card => _card;
  ValidationItem get mmyy => _mmyy;
  ValidationItem get cvv => _cvv;
  bool get isValid {
    if (_card.value != null && _mmyy.value != null && _cvv.value != null) {
      return true;
    } else {
      return false;
    }
  }

  //Setters
  void changeCard({String card}) {
    _getBrand(card: card);
    int size = card.length;
    //invertimos el numero de tarjeta
    String cardNumberReverse =
        String.fromCharCodes(card.runes.toList().reversed);
    try {
      int.parse(card);
    } catch (_) {
      print('card: $card');
      _card = ValidationItem(null, "Ingrese Número de tarjeta");
    }
    // Sin necesidad de aplicar algoritmo
    if (size < 8) {
      _card = ValidationItem(null, "Ingrese Número de tarjeta");
    }
    int sum = 0;
    //recorremos digito por digito
    for (int i = 0; i < size; i++) {
      int digit = int.parse(cardNumberReverse[i]);
      //si la posicion es impar contando desde 0 duplicamos el valor
      if (i % 2 == 1) {
        digit *= 2;
      }
      //si el numero tiene dos digitos le restamos 9 para que vuelva a tener un digito
      sum += digit > 9 ? (digit - 9) : digit;
    }
    if (sum % 10 == 0) {
      _card = ValidationItem(card, null);
    } else {
      _card = ValidationItem(null, "Ingrese Número de tarjeta");
    }
    notifyListeners();
  }

  void changeMmYy({String mmyy}) {
    int mm = int.parse(mmyy.substring(0, 2));
    int yy = int.parse(mmyy.substring(3, 5));
    //validando el mes
    if (mm <= 12 && mm >= 1) {
      //validando el anio
      if (yy > 99) {
        _mmyy = ValidationItem(null, "Ingrese MM/YY");
      } else if ((yy + 2000) >= DateTime.now().year) {
        _mmyy = ValidationItem(mmyy, null);
      }
      _mmyy = ValidationItem(mmyy, null);
    } else {
      print('mmyy: $mmyy');
      _mmyy = ValidationItem(null, "Ingrese MM/YY");
    }
    notifyListeners();
  }

  void changeCvv({String cvv}) {
    if (cvv.length == 3 || cvv.length == 4) {
      _cvv = ValidationItem(cvv, null);
    } else {
      _cvv = ValidationItem(null, "Ingrese CVV");
    }
    notifyListeners();
  }

  void _getBrand({String card}) {
    if (card.length >= 3) {
      int n = int.parse(card.substring(0, 3));
      if ((n >= 300 && n <= 305) || n == 309) {
        _setBrand(_dinersClub);
      }
    }

    if (card.length >= 2) {
      int n = int.parse(card.substring(0, 2));
      if (n == 36 || n == 38 || n == 39) {
        _setBrand(_dinersClub);
      } else if (n == 34 || n == 37) {
        _setBrand(_americanExpress);
      } else if (n >= 51 && n <= 55) {
        _setBrand(_masterCard);
      }
    }

    if (card.length >= 1) {
      int n = int.parse(card[0]);
      if (n == 4) {
        _setBrand(_visa);
      }
    }
    if (card == '') {
      _setBrand(_any);
    }
  }

  NotifierState _state = NotifierState.initial;
  NotifierState get state => _state;
  void _setState(NotifierState state) {
    _state = state;
    notifyListeners();
  }

  Future<void> makeThePayment({BuildContext context}) async {
    _setState(NotifierState.loading);
    try {
      if (isValid) {
        final String message = await PaymentService().makeThePaymentSecure(
            card: card.value,
            mmyy: mmyy.value,
            cvv: cvv.value,
            email: null,
            amount: plan.planPrecio);
        if (message != null) {
          _setState(NotifierState.loaded);
          Navigator.of(context).pushNamedAndRemoveUntil(
              Routes.scanResultRoute, (Route<dynamic> route) => false);
        } else {
          SharedPreferences preferences = await SharedPreferences.getInstance();
          final String culqiErrorMessage =
              preferences.getString(preff_culqi_response_message);
          _setState(NotifierState.initial);
          _responseDialog(context: context, message: culqiErrorMessage);
        }
      } else {
        _setState(NotifierState.initial);
        _buildSnackBar(
            context: context,
            message: "Ingrese todos los campos correctamente");
      }
    } on Failure catch (f) {
      _setState(NotifierState.initial);
      _buildSnackBar(context: context, message: f.message);
    }
  }

  _buildSnackBar({BuildContext context, String message}) {
    Scaffold.of(context).showSnackBar(
      SnackBar(
        duration: Duration(milliseconds: 5000),
        backgroundColor: Colors.red,
        content: Row(
          children: [
            Icon(
              Icons.error_outline,
              color: Colors.white,
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: Text(
                message,
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                overflow: TextOverflow.visible,
              ),
            ),
          ],
        ),
      ),
    );
  }

  _responseDialog({BuildContext context, String message}) async {
    await showDialog(
        barrierDismissible: false,
        context: context,
        child: AlertDialog(
          title: Text("No se realizó el pago"),
          content: Text("$message"),
          actions: [
            FlatButton(
              child: Text("Cerrar"),
              onPressed: () => Navigator.of(context).pop(),
            )
          ],
        ));
  }
}
