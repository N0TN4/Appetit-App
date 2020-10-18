import 'package:flutter/material.dart';

import 'package:appetit_app/models/produto.dart';

enum Opcao { milho, arroz }

class DetalhesPedidoController extends ChangeNotifier {
  Produto produtoEscolhido;
  Opcao opcaoGroup = Opcao.milho;
  Opcao _opcao = Opcao.arroz;

  Opcao get opcao => _opcao;

  void selecionarProduto(Produto produtoEscolhido) {
    this.produtoEscolhido = produtoEscolhido;
    print(
        "[DetalhesPedidoController] produto escolhido : ${produtoEscolhido.toString()}");
    notifyListeners();
  }

  void selecionarOpcao(Opcao opcao) {
    this.opcaoGroup = opcao;
    notifyListeners();
  }

  void adicionarQuantidadeProduto() {
    this.produtoEscolhido.quantidade++;
    calcularQuantidadeValorUnitario(this.produtoEscolhido);
  }

  void dimininuirQuantidadeProduto() {
    this.produtoEscolhido.quantidade--;
    calcularQuantidadeValorUnitario(this.produtoEscolhido);
  }

  Produto calcularQuantidadeValorUnitario(Produto produto) {
    produto.valorTotal = produto.valorUnitario * produto.quantidade;
    this.produtoEscolhido = produto;
    notifyListeners();
    return produto;
  }
}
