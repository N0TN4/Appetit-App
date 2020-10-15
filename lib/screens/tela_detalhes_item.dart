import 'package:appetit_app/components/card_produto.dart';
import 'package:appetit_app/components/main_cabecalho.dart';
import 'package:appetit_app/controllers/detalhes_pedido_controller.dart';
import 'package:appetit_app/tools/theme/tema.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class TelaDetalhesItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            MainCabecalho(
              titulo: "Informações para o pedido",
              subtitulo:
                  "caso queira, aproveite para adicionar alguma observação para este pedido.",
            ),
            Consumer<DetalhesPedidoController>(
                builder: (context, controller, widget) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  CardProduto(produto: controller.produtoEscolhido),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 24),
                    child: Divider(),
                  ),
                  Text(
                    "Opções",
                    style: Tema.texto.headline3,
                  ),
                  Text(
                    "Escolha uma das opções de massas disponíveis abaixo.",
                    style: Tema.texto.subtitle1,
                  ),
                  _buildListTileOpcoes(
                      titulo: "Cuscuz de milho",
                      value: Opcao.milho,
                      controller: controller),
                  _buildListTileOpcoes(
                      titulo: "Cuscuz de arroz",
                      value: Opcao.arroz,
                      controller: controller),
                ],
              );
            }),
          ],
        ),
      ),
      bottomSheet: Container(
        color: Colors.white,
        child: Row(
          children: <Widget>[
            IconButton(
              icon: Icon(FontAwesomeIcons.less),
              onPressed: () {},
            ),
            Text("1xx2"),
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }

  _buildListTileOpcoes(
      {String titulo, value, DetalhesPedidoController controller}) {
    return Card(
      elevation: 2,
      child: ListTile(
        leading: Radio(
            value: value,
            groupValue: controller.opcao,
            onChanged: (opcaoSelecionada) =>
                controller.selecionarOpcao(opcaoSelecionada)),
        title: Text(titulo),
      ),
    );
  }
}
