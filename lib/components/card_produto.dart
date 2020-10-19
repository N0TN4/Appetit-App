import 'package:appetit_app/tools/formata_numero.dart';
import 'package:appetit_app/tools/theme/colors_app.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:appetit_app/controllers/detalhes_pedido_controller.dart';
import 'package:appetit_app/models/produto.dart';
import 'package:appetit_app/tools/theme/tema.dart';

class CardProduto extends StatelessWidget {
  final Produto produto;
  final bool selecionado;

  const CardProduto({
    Key key,
    this.produto,
    this.selecionado = false,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
        color: selecionado ? ColorsApp.corPrimaria : Colors.white,
        elevation: 2,
        child: ListTile(
          leading: ClipOval(child: Image.asset(produto.avatar)),
          title: Text(
            produto.nome ?? "",
            style: produto.selecionado && selecionado
                ? Tema.texto.headline3.copyWith(color: Colors.white)
                : Tema.texto.headline3,
          ),
          subtitle: Text(
            produto.descricao ?? "",
            style: produto.selecionado && selecionado
                ? Tema.texto.subtitle1.copyWith(color: Colors.white)
                : Tema.texto.subtitle1,
          ),
          trailing: Text(
            "${FormataNumero.formatar(produto.valorUnitario.toString())}",
            style: produto.selecionado && selecionado
                ? Tema.texto.headline3.copyWith(color: Colors.white)
                : Tema.texto.headline3,
          ),
          onTap: () {
            Navigator.pushNamed(context, '/detalhesItem');

            Provider.of<DetalhesPedidoController>(context, listen: false)
                .selecionarProduto(produto);
          },
        ));
  }
}
