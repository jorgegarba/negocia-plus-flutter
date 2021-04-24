import 'package:flutter/material.dart';
import 'package:negocia/theme/colors.dart';

ThemeData theme() {
  return ThemeData(
    scaffoldBackgroundColor: Colors.white,
    fontFamily: "Raleway",
    appBarTheme: appBarTheme(),
    textTheme: textTheme(),
    inputDecorationTheme: inputDecorationTheme(),
    buttonTheme: buttonTheme(),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    bottomSheetTheme:
        BottomSheetThemeData(backgroundColor: Colors.black.withOpacity(0)),
    //cursorColor: kPrimaryDarkColor,
    //textSelectionHandleColor: kPrimaryDarkColor,
  );
}

InputDecorationTheme inputDecorationTheme() {
  OutlineInputBorder enabledBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: BorderSide(color: Color.fromRGBO(249, 249, 249, 1)),
    gapPadding: 10,
  );
  OutlineInputBorder focusedBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: BorderSide(color: Colors.deepPurple),
    gapPadding: 10,
  );
  OutlineInputBorder errorBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(20),
    borderSide: BorderSide(color: Colors.red, width: 1),
  );

  return InputDecorationTheme(
    fillColor: Color.fromRGBO(249, 249, 249, 1),
    filled: true,
    labelStyle: TextStyle(color: Colors.deepPurple),
    floatingLabelBehavior: FloatingLabelBehavior.always,
    contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
    enabledBorder: enabledBorder,
    focusedBorder: focusedBorder,
    focusedErrorBorder: errorBorder,
    errorBorder: errorBorder,
  );
}

TextTheme textTheme() {
  return TextTheme(
      bodyText1: TextStyle(color: ktextColor),
      bodyText2: TextStyle(color: ktextColor));
}

ButtonThemeData buttonTheme() {
  return ButtonThemeData(
    buttonColor: kprimaryColorPurple,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20.0),
    ),
  );
}

AppBarTheme appBarTheme() {
  return AppBarTheme(
    color: Colors.white,
    elevation: 0,
    iconTheme: IconThemeData(color: kprimaryColorYellow),
    textTheme: TextTheme(
      headline1: TextStyle(color: Color(0XFF888888), fontSize: 18),
    ),
  );
}
