import 'package:appetit_app/components/card_produto.dart';
import 'package:appetit_app/components/main_cabecalho.dart';
import 'package:appetit_app/components/progress_indicator.dart';
import 'package:appetit_app/controllers/detalhes_pedido_controller.dart';
import 'package:appetit_app/models/produto.dart';
import 'package:appetit_app/screens/tela_informa_itens_do_pedido/produto_itens_dao.dart';
import 'package:appetit_app/tools/theme/colors_app.dart';
import 'package:appetit_app/tools/theme/tema.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class InformaItensDoPedido extends StatefulWidget {
  @override
  _InformaItensDoPedidoState createState() => _InformaItensDoPedidoState();
}

class _InformaItensDoPedidoState extends State<InformaItensDoPedido> {
  ProdutoItensDao dao;
  @override
  void initState() {
    super.initState();
    dao = ProdutoItensDao();
    dao.fetch(); // simula uma requisição no primeiro estado
  }

  @override
  Widget build(BuildContext context) {
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
                itemCount: dao.categorias.length,
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
                          dao.categorias[indexCategoria].nome ?? "",
                          style: Tema.texto.headline3,
                        ),
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount:
                            dao.categorias[indexCategoria].produtos.length,
                        itemBuilder: (context, indexItem) {
                          return CardProduto(
                              produto: dao.categorias[indexCategoria]
                                  .produtos[indexItem]);
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
    );
  }
}
