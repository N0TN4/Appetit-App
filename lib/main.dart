import 'package:appetit_app/screens/tela_login.dart';
import 'package:flutter/material.dart';

import 'screens/tela_historico_de_pedidos.dart';
import 'tools/theme/colors_app.dart';
import 'tools/theme/tema.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Appetit App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Poppins',
        primaryColor: ColorsApp.corPrimaria,
        iconTheme: Tema.iconesTema,
        textTheme: Tema.texto,
        accentIconTheme: Tema.iconesTema,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => TelaLogin(),
        '/historicoDePedidos': (context) => TelaHistoricoDePedidos(),
      },
    );
  }
}
