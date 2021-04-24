import 'package:flutter/material.dart';

//colors
const primaryColorYellow = Color.fromRGBO(238, 179, 4, 1);
const secondaryColorYellow = Color.fromRGBO(249, 211, 28, 1);

const primaryColorPurple = Color.fromRGBO(121, 46, 159, 1);

const transparent = Color.fromRGBO(242, 242, 242, 1.0);

//text-colors

const textColor = Color(0xFF757575);

const animationDuration = Duration(milliseconds: 500);

//forms

// Form Error
final RegExp emailValidatorRegExp =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
const String emailNullError = "Por favor ingrese su email";
const String invalidEmailError = "Por favor ingrese un email válido";
const String passNullError = "Por favor ingresa tu contraseña";
const String shortPassError = "Contraseña muy corta";
const String matchPassError = "Las contraseñas no coinciden";

const String nameError = "Por favor ingresa su nombre completo";
const String lastNameError = "Por favor ingresa tus Apellidos";
const String dniError = "Por favor ingresa tu DNI";
const String cellphoneError = "Porfavor ingresa tu Número";

const String preff_category_list = "preff_category_list";
const String preff_category_selected = "preff_category_selected";
const String preff_category_item_list = "preff_category_item_list";
const String preff_category_item_selected = "preff_category_item_selected";
const String preff_department_list = "preff_department_list";
const String preff_department_selected = "preff_department_selected";
const String preff_province_list = "preff_province_list";
const String preff_province_selected = "preff_province_selected";
const String preff_district_list = "preff_district_list";
const String preff_district_selected = "preff_district_selected";
const String preff_offer_type_list = "preff_offer_type_list";
const String preff_offer_type_selected = "preff_offer_type_selected";
const String preff_token = "preff_token";
const String preff_user_id = "preff_user_id";
const String preff_user_object = "preff_user_object";
const String preff_user_rol = "preff_user_rol";

const String preff_culqi_charger_id = "preff_culqi_charger_id";
const String preff_culqi_response_message = "preff_culqi_response_message";
