import 'package:appetit_app/components/card_produto.dart';
import 'package:appetit_app/components/main_cabecalho.dart';
import 'package:appetit_app/components/progress_indicator.dart';
import 'package:appetit_app/controllers/informa_itens_controller.dart';
import 'package:appetit_app/tools/formata_numero.dart';
import 'package:appetit_app/tools/theme/colors_app.dart';
import 'package:appetit_app/tools/theme/tema.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class InformaItensDoPedido extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<InformaItensController>(
        builder: (context, controller, widget) {
      return Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
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
                        "O que você está vendendo?",
                        style: Tema.texto.headline3,
                      ),
                      Text(
                        "1 de 3",
                        style: Tema.texto.subtitle1,
                      ),
                    ],
                  ),
                ),
                ProgressIndicatorCustom(
                  begin: 0,
                  end: 0.3,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 24),
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      hintText: "Digite a sua busca aqui",
                    ),
                  ),
                ),
                ListView.separated(
                  itemCount: controller.dao.categorias.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  separatorBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.only(top: 16, bottom: 24),
                    child: Divider(),
                  ),
                  itemBuilder: (context, indexCategoria) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(bottom: 16),
                          child: Text(
                            controller.dao.categorias[indexCategoria].nome ??
                                "",
                            style: Tema.texto.headline3,
                          ),
                        ),
                        ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: controller
                              .dao.categorias[indexCategoria].produtos.length,
                          itemBuilder: (context, indexItem) {
                            return CardProduto(
                              produto: controller.dao.categorias[indexCategoria]
                                  .produtos[indexItem],
                              selecionado: controller
                                  .dao
                                  .categorias[indexCategoria]
                                  .produtos[indexItem]
                                  .selecionado,
                            );
                          },
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Container(
          color: ColorsApp.corPrimaria,
          height: 56,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Text(
                  "Total: ${FormataNumero.formatar(controller.valorTotalCarrinho.toString())}",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
              GestureDetector(
                onTap: () => Navigator.pushNamed(context, '/clientes'),
                child: Container(
                  padding: const EdgeInsets.only(right: 16),
                  child: Row(
                    children: <Widget>[
                      Text(
                        "Avançar",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      SizedBox(
                        width: 24,
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white,
                        size: 14,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}
