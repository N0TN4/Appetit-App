import 'package:appetit_app/components/card_produto.dart';
import 'package:appetit_app/components/main_cabecalho.dart';
import 'package:appetit_app/controllers/detalhes_pedido_controller.dart';
import 'package:appetit_app/controllers/informa_itens_controller.dart';
import 'package:appetit_app/tools/theme/colors_app.dart';
import 'package:appetit_app/tools/theme/tema.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TelaDetalhesItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<DetalhesPedidoController>(
        builder: (context, controller, widget) {
      return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
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
          ),
        ),
        bottomSheet: Container(
          height: 68,
          color: Colors.white,
          child: Row(
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: FlatButton(
                          onPressed: controller.produtoEscolhido.quantidade > 1
                              ? controller.dimininuirQuantidadeProduto
                              : null,
                          child: Text(
                            '-',
                            style: TextStyle(
                              fontSize: 18,
                              color: controller.produtoEscolhido.quantidade > 1
                                  ? ColorsApp.corPrimaria
                                  : Colors.grey,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                          child: Text(
                        controller.produtoEscolhido.quantidade.toString(),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w600),
                      )),
                      Expanded(
                        child: FlatButton(
                          onPressed: () =>
                              controller.adicionarQuantidadeProduto(),
                          child: Text(
                            '+',
                            style: TextStyle(
                                fontSize: 18, color: ColorsApp.corPrimaria),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: ColorsApp.corPrimaria,
                  ),
                  child: FlatButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      Provider.of<InformaItensController>(context,
                              listen: false)
                          .putItemSelecionadoNaLista(
                              controller.produtoEscolhido);

                      // controller.selecionarItem();
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Adicionar",
                          style: TextStyle(color: Colors.white, fontSize: 14),
                        ),
                        Text(
                          controller.produtoEscolhido.valorTotal.toString(),
                          style: TextStyle(color: Colors.white, fontSize: 14),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }

  _buildListTileOpcoes(
      {String titulo, value, DetalhesPedidoController controller}) {
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
