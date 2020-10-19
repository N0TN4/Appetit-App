import 'package:appetit_app/tools/theme/colors_app.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DataMes extends StatelessWidget {
  final format = DateFormat("yyyy-MM-dd");
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      DateTimeField(
        format: format,
        decoration: InputDecoration(
          labelText: "Data",
          hintStyle: TextStyle(height: 0, color: Colors.black),
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          isDense: false,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(4)),
            borderSide: BorderSide(color: ColorsApp.corPrimaria, width: 2),
          ),
          filled: true,
          fillColor: Colors.white,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(4)),
            borderSide: BorderSide(color: ColorsApp.corPrimaria, width: 1),
          ),
        ),
        onShowPicker: (context, currentValue) {
          return showDatePicker(
              context: context,
              firstDate: DateTime(1900),
              initialDate: currentValue ?? DateTime.now(),
              lastDate: DateTime(2100),
              builder: (BuildContext context, Widget child) {
                return Theme(
                  data: ThemeData.light().copyWith(
                    primaryColor: ColorsApp.corPrimaria,
                    buttonColor: ColorsApp.corPrimaria,
                    buttonTheme:
                        ButtonThemeData(buttonColor: ColorsApp.corPrimaria),
                    buttonBarTheme: ButtonBarThemeData(
                        buttonTextTheme: ButtonTextTheme.primary),
                    colorScheme: ColorScheme(
                      secondaryVariant: Colors.black,
                      secondary: Colors.black,
                      error: Colors.black,
                      brightness: Brightness.light,
                      surface: Colors.black,
                      onPrimary: Colors.white,
                      primary: ColorsApp.corPrimaria,
                      onSurface: Colors.black,
                      onSecondary: Colors.black,
                      primaryVariant: ColorsApp.corPrimaria,
                      onError: Colors.black,
                      background: Colors.black,
                      onBackground: Colors.black,
                    ),
                  ),
                  child: child,
                );
              });
        },
      ),
    ]);
  }
}
