import 'package:appetit_app/tools/theme/colors_app.dart';
import 'package:flutter/material.dart';

class TelaFinalizado extends StatefulWidget {
  @override
  _TelaFinalizadoState createState() => _TelaFinalizadoState();
}

class _TelaFinalizadoState extends State<TelaFinalizado> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(child: Image.asset('assets/cozinha.png')),
            SizedBox(
              height: 16,
            ),
            Text(
              "Pedido realizado!",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 84,
            ),
            ButtonTheme(
              minWidth: MediaQuery.of(context).size.width,
              height: 48,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(64),
              ),
              child: RaisedButton(
                  color: Theme.of(context).primaryColor,
                  onPressed: () => Navigator.pushNamedAndRemoveUntil(context,
                      '/informaItensDoPedido', (Route<dynamic> route) => false),
                  child: Text(
                    "FAZER UM NOVO PEDIDO",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  )),
            ),
            SizedBox(
              height: 16,
            ),
            ButtonTheme(
              minWidth: MediaQuery.of(context).size.width,
              height: 48,
              shape: RoundedRectangleBorder(
                side: BorderSide(color: ColorsApp.customGreen),
                borderRadius: BorderRadius.circular(64),
              ),
              child: RaisedButton(
                  color: Colors.white,
                  onPressed: () {
                    return Navigator.pushNamedAndRemoveUntil(context,
                        '/historicoDePedidos', (Route<dynamic> route) => false);
                  },
                  child: Text(
                    "VOLTAR PARA A PÁGINA INICIAL",
                    style: TextStyle(
                      color: ColorsApp.customGreen,
                      fontSize: 14,
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
