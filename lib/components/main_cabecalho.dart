import 'package:appetit_app/tools/theme/colors_app.dart';
import 'package:appetit_app/tools/theme/tema.dart';
import 'package:flutter/material.dart';

class MainCabecalho extends StatelessWidget {
  final String titulo;
  final String subtitulo;
  const MainCabecalho({Key key, this.titulo, this.subtitulo}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "$titulo",
          style: Tema.texto.headline1,
        ),
        Padding(
          padding: EdgeInsets.only(top: 8, bottom: 16),
          child: Container(
            width: 240,
            height: 2,
            color: ColorsApp.customGreen,
          ),
        ),
        subtitulo != null
            ? Padding(
                padding: const EdgeInsets.only(top: 16, bottom: 32),
                child: Text(subtitulo, style: Tema.texto.subtitle1),
              )
            : Container(),
      ],
    );
  }
}
