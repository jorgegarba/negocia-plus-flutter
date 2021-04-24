import 'package:flutter/widgets.dart';

class ValidationItem {
  final String value;
  final String error;

  ValidationItem(this.value, this.error);
}

final String errorMessage = "está vacio, porfavor completar";

class AdversitingSpaceProvider with ChangeNotifier {
  ValidationItem _title = ValidationItem(null, null);
  ValidationItem _description = ValidationItem(null, null);
  ValidationItem _typeOfOffer = ValidationItem(null, null);
  ValidationItem _discount = ValidationItem(null, null);
  ValidationItem _additionalInformation = ValidationItem(null, null);
  List<String> _additionalInformationList = [];
  List<String> _applicableDays = [];
  bool _lunes = false,
      _martes = false,
      _miercoles = false,
      _jueves = false,
      _viernes = false,
      _sabado = false,
      _domingo = false;
  bool _applicableToHolidays = false;
  bool _schedule = false;
  double _numberOfExchanges = 0.0;
  ValidationItem _priceBefore = ValidationItem(null, null);
  ValidationItem _priceNow = ValidationItem(null, null);
  int _offerModality = 0;

  //Getters
  ValidationItem get title => _title;
  ValidationItem get description => _description;
  ValidationItem get typeOfOffer => _typeOfOffer;
  ValidationItem get discount => _discount;
  ValidationItem get additionalInformation => _additionalInformation;
  List<String> get additionalInformationList => _additionalInformationList;
  List<String> get applicableDays => _applicableDays;
  bool get lunes => _lunes;
  bool get martes => _martes;
  bool get miercoles => _miercoles;
  bool get jueves => _jueves;
  bool get viernes => _viernes;
  bool get sabado => _sabado;
  bool get domingo => _domingo;
  bool get applicableToHolidays => _applicableToHolidays;
  bool get schedule => _schedule;
  double get numberOfExchanges => _numberOfExchanges;
  ValidationItem get priceBefore => _priceBefore;
  ValidationItem get priceNow => _priceNow;
  int get offerModality => _offerModality;

  bool get isValid {
    if (_title.value != null &&
            _description.value != null &&
            _typeOfOffer.value != null &&
            _discount.value != null &&
            _additionalInformation != null &&
            // _additionalInformationList.isNotEmpty &&
            _applicableDays.isNotEmpty &&
            // _applicableToHolidays != false &&
            // _schedule != false &&
            // _numberOfExchanges != 0 &&
            _priceBefore.value != null &&
            _priceNow.value != null
        // _offerModality.isNotEmpty
        ) {
      return true;
    } else {
      return false;
    }
  }

  //Setters
  validateTitle({String title}) {
    title.isNotEmpty
        ? _title = ValidationItem(title, null)
        : _title = ValidationItem(null, "Campo Título $errorMessage");
    notifyListeners();
  }

  validateDescription({String description}) {
    description.isNotEmpty
        ? _description = ValidationItem(description, null)
        : _description =
            ValidationItem(null, "Campo Descripción $errorMessage");
    notifyListeners();
  }

  validateTypeOfOffer({String typeOfOffer}) {
    typeOfOffer.isNotEmpty
        ? _typeOfOffer = ValidationItem(typeOfOffer, null)
        : _typeOfOffer =
            ValidationItem(null, "Campo Tipo Oferta $errorMessage");
    notifyListeners();
  }

  validateDiscount({String discount}) {
    discount.isNotEmpty
        ? _discount = ValidationItem(discount, null)
        : _discount =
            ValidationItem(null, "Campo Cantidad de descuento $errorMessage");
    notifyListeners();
  }

  validateAdditionalInformation({String additionalInformation}) {
    additionalInformation.isNotEmpty
        ? _additionalInformation = ValidationItem(additionalInformation, null)
        : _additionalInformation =
            ValidationItem(null, "Campo Información Adicional $errorMessage");
    notifyListeners();
  }

  addAdditionalInformation({String additionalInformation}) {
    if (additionalInformation != null)
      _additionalInformationList.add(additionalInformation);
    _additionalInformation = ValidationItem(null, null);
    notifyListeners();
  }

  tapLunes({bool value}) {
    _lunes = value;
    notifyListeners();
  }

  tapMartes({bool value}) {
    _martes = value;
    notifyListeners();
  }

  tapMiercoles({bool value}) {
    _miercoles = value;
    notifyListeners();
  }

  tapJueves({bool value}) {
    _jueves = value;
    notifyListeners();
  }

  tapViernes({bool value}) {
    _viernes = value;
    notifyListeners();
  }

  tapSabado({bool value}) {
    _sabado = value;
    notifyListeners();
  }

  tapDomingo({bool value}) {
    _domingo = value;
    notifyListeners();
  }

  isApplicableToHolidays({bool value}) {
    _applicableToHolidays = value;
    notifyListeners();
  }

  isSchedule({bool value}) {
    _schedule = value;
    notifyListeners();
  }

  sliderNumberOfExchanges({double value}) {
    _numberOfExchanges = value;
    notifyListeners();
  }

  validatePriceBefore({String priceBefore}) {
    priceBefore.isNotEmpty
        ? _priceBefore = ValidationItem(priceBefore, null)
        : _priceBefore =
            ValidationItem(null, "Campo Precio Antes $errorMessage");
    notifyListeners();
  }

  validatePriceNow({String priceNow}) {
    priceNow.isNotEmpty
        ? _priceNow = ValidationItem(priceNow, null)
        : _priceNow = ValidationItem(null, "Campo Precio Ahora $errorMessage");
    notifyListeners();
  }

  selectOfferModality({int modality}) {
    _offerModality = modality;
    notifyListeners();
  }
}
