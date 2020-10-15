import 'package:appetit_app/models/produto.dart';
import 'package:flutter/material.dart';

enum Opcao { milho, arroz }

class DetalhesPedidoController extends ChangeNotifier {
  Produto produtoEscolhido;
  Opcao _opcao = Opcao.arroz;
  Opcao get opcao => _opcao;

  selecionarProduto(Produto produtoEscolhido) {
    this.produtoEscolhido = produtoEscolhido;
    print(
        "[DetalhesPedidoController] produto escolhido : ${produtoEscolhido.toString()}");
    notifyListeners();
  }

  selecionarOpcao(Opcao opcao) {
    this._opcao = opcao;
    notifyListeners();
  }
}
