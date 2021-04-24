import 'package:flutter/widgets.dart';

class ValidationItem {
  final String value;
  final String error;

  ValidationItem(this.value, this.error);
}

final String errorMessage = "está vacio, porfavor completar";

class PlanSpaceProvider with ChangeNotifier {
  ValidationItem _title = ValidationItem(null, null);
  ValidationItem _description = ValidationItem(null, null);

  //Getters
  ValidationItem get title => _title;
  ValidationItem get description => _description;

  bool get isValid {
    if (_title.value != null && _description.value != null) {
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
}
