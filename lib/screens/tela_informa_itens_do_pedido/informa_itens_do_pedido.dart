import 'package:appetit_app/components/progress_indicator.dart';
import 'package:appetit_app/models/produto.dart';
import 'package:appetit_app/screens/tela_informa_itens_do_pedido/produto_itens_dao.dart';
import 'package:appetit_app/tools/theme/colors_app.dart';
import 'package:appetit_app/tools/theme/tema.dart';
import 'package:flutter/material.dart';

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
              Text(
                "Informações para o pedido",
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
              Text(
                "Preencha as informações abaixo para concluir o pedido.",
                style: Tema.texto.subtitle1,
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
                          return _buildCardProduto(dao
                              .categorias[indexCategoria].produtos[indexItem]);
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

  Widget _buildCardProduto(Produto produto) {
    return Container(
      padding: EdgeInsets.only(bottom: 8),
      child: Card(
          elevation: 2,
          child: ListTile(
            leading: ClipOval(child: Image.asset(produto.avatar)),
            title: Text(
              produto.nome ?? "",
              style: Tema.texto.headline3,
            ),
            subtitle: Text(produto.descricao ?? ""),
            trailing: Text(
              "R\$ 2,25",
              style: Tema.texto.headline3,
            ),
            onTap: (){
              
            },
          )),
    );
  }
}
