import 'package:appetit_app/controllers/detalhes_pedido_controller.dart';
import 'package:appetit_app/models/produto.dart';
import 'package:appetit_app/tools/theme/tema.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CardProduto extends StatelessWidget {
  final Produto produto;

  const CardProduto({Key key, this.produto}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
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
          onTap: () {
            Navigator.pushNamed(context, '/detalhesItem');

            Provider.of<DetalhesPedidoController>(context, listen: false)
                .selecionarProduto(produto);
          },
        ));
  }
}
