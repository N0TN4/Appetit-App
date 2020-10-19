import 'package:appetit_app/components/data_mes.dart';
import 'package:appetit_app/components/main_cabecalho.dart';
import 'package:appetit_app/components/progress_indicator.dart';
import 'package:appetit_app/controllers/finaliza_pedido_controller.dart';
import 'package:appetit_app/tools/theme/colors_app.dart';
import 'package:appetit_app/tools/theme/tema.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TelaFinalizaPedido extends StatefulWidget {
  @override
  _TelaFinalizaPedidoState createState() => _TelaFinalizaPedidoState();
}

class _TelaFinalizaPedidoState extends State<TelaFinalizaPedido> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              MainCabecalho(
                titulo: "Informações para o pedido",
                subtitulo:
                    "Preencha as informações abaixo para concluir o pedido.",
              ),
              Padding(
                padding: const EdgeInsets.only(top: 24, bottom: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "Finalizar pedido",
                      style: Tema.texto.headline3,
                    ),
                    Text(
                      "3 de 3",
                      style: Tema.texto.subtitle1,
                    ),
                  ],
                ),
              ),
              ProgressIndicatorCustom(
                begin: 0,
                end: 1.0,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 24, bottom: 16),
                child: Text(
                  "O cliente já pagou?",
                  style: Tema.texto.headline3,
                ),
              ),
              Consumer<FinalizaPedidoController>(
                  builder: (context, controller, widget) {
                return Container(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    _buildListTileOpcoes(
                        titulo: "Sim",
                        value: Opcao.sim,
                        controller: controller),
                    _buildListTileOpcoes(
                        titulo: "Não",
                        value: Opcao.nao,
                        controller: controller),
                    Padding(
                      padding: const EdgeInsets.only(top: 24, bottom: 16),
                      child: Text(
                        "Em que data o pedido foi realizado?",
                        style: Tema.texto.headline3,
                      ),
                    ),
                    DataMes(),
                    Padding(
                      padding: const EdgeInsets.only(top: 78, bottom: 40),
                      child: ButtonTheme(
                        minWidth: MediaQuery.of(context).size.width,
                        height: 48,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(64),
                        ),
                        child: RaisedButton(
                            color: Theme.of(context).primaryColor,
                            onPressed: () =>
                                Navigator.pushNamed(context, '/final'),
                            child: Text(
                              "FINALIZAR PEDIDO",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            )),
                      ),
                    ),
                  ],
                ));
              }),
            ],
          ),
        ),
      ),
    );
  }

  _buildListTileOpcoes(
      {String titulo, value, FinalizaPedidoController controller}) {
    return Card(
      elevation: 2,
      child: RadioListTile(
        value: value,
        groupValue: controller.opcaoGroup,
        title: Text(titulo),
        selected: false,
        onChanged: (opcaoSelecionada) {
          controller.selecionarOpcao(opcaoSelecionada);
        },
      ),
    );
  }
}
