import 'dart:convert';
import 'dart:io';

import 'package:culqi_flutter/culqi_flutter.dart';
import 'package:flutter/widgets.dart';
import 'package:negocia/constants.dart';
import 'package:negocia/models/failure_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart' as idOrder;
import 'package:http/http.dart' as http;

class PaymentService {
  SharedPreferences preferences;

  Future<String> makeThePaymentSecure(
      {@required String card,
      @required String mmyy,
      @required String cvv,
      @required String email,
      @required String amount}) async {
    try {
      preferences = await SharedPreferences.getInstance();

      final dataUser = preferences.getString(preff_user_object) == null
          ? null
          : json.decode(preferences.getString(preff_user_object));
      if (dataUser != null) {
        int mm = int.parse(mmyy.substring(0, 2));
        int yy = int.parse(mmyy.substring(3, 5));
        var _token = await _generateToken(
            ccard: card, mm: mm, yy: yy, cvv: cvv, email: dataUser['usuMail']);
        print('----------- TOKEN ---------');
        print('_token: $_token');
        print('----------- TOKEN ---------');

        double _amount = double.tryParse(amount) * 100;
        int _amountQulqiFormat = _amount.round();
        final _orderID = idOrder.Uuid().v1();

        final String responseCulqi = await _culquiPay(
            amount: _amountQulqiFormat,
            address: 'Sin Dirección',
            firstName: dataUser['perId']['perNom'],
            lastName: dataUser['perId']['perApe'],
            phoneNumber: int.parse(dataUser['usuFono']),
            email: dataUser['usuMail'],
            orderID: _orderID,
            token: _token);
        final response = jsonDecode(responseCulqi);

        print('--------- All Culqi response ----------');
        print(response);
        print('response id: ${response['charge_id'] ?? response['id']}');
        print(
            'response message: ${response['user_message'] ?? response['outcome']['user_message']}');
        print('--------- All Culqi response ----------');
        await preferences.setString(
            preff_culqi_charger_id, response['charge_id'] ?? response['id']);
        await preferences.setString(preff_culqi_response_message,
            response['user_message'] ?? response['outcome']['user_message']);
        if (response['user_message'] == null) {
          return response['outcome']['user_message'];
        } else {
          return null;
        }
      } else {
        throw Failure(
            'Su cuenta no cuenta con datos suficientes para realizar el pago.');
      }
    } on SocketException {
      // No Internet connection 😑
      throw Failure('Verifique su conexión a Internet 😑');
    } on HttpException {
      // Couldn't find the post
      throw Failure("Vuelve a intenterlo");
    } on FormatException {
      // Bad response format 👎
      throw Failure("Verifique su información por favor");
    }
  }

  Future<String> _generateToken(
      {@required String ccard,
      @required int mm,
      @required int yy,
      @required String cvv,
      @required String email}) async {
    CCard card = CCard(
      cardNumber: ccard,
      expirationMonth: mm,
      expirationYear: yy,
      cvv: cvv,
      email: email,
    );

    CToken token;
    try {
      token = await createToken(card: card, apiKey: "pk_test_4648ed95d95c6f83");
    } on CulqiBadRequestException catch (ex) {
      throw Failure(ex.cause);
    } on CulqiUnknownException catch (ex) {
      //codigo de error del servidor
      throw Failure(ex.cause);
    }
    return token.id;
  }

  Future<String> _culquiPay(
      {@required int amount,
      @required String address,
      @required String firstName,
      @required String lastName,
      @required int phoneNumber,
      @required String email,
      @required String orderID,
      @required String token}) async {
    final response = await http.post(
      "https://api.culqi.com/v2/charges",
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.acceptHeader: 'application/json',
        HttpHeaders.authorizationHeader: 'Bearer sk_test_10cf3967461769fe',
      },
      body: jsonEncode({
        "amount": amount,
        "antifraud_details": {
          "address": address,
          "address_city": "LIMA",
          "country_code": "PE",
          "first_name": firstName,
          "last_name": lastName,
          "phone_number": phoneNumber
        },
        "capture": true,
        "currency_code": "PEN",
        "description": "Pago por Canje",
        "email": email,
        "installments": 1,
        "metadata": {"ORDER_ID": "$orderID"},
        "source_id": token
      }),
    );

    return response.body;
  }
}
