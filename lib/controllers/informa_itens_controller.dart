import 'package:appetit_app/models/produto.dart';
import 'package:appetit_app/controllers/produto_itens_dao.dart';
import 'package:flutter/material.dart';

class InformaItensController extends ChangeNotifier {
  ProdutoItensDao dao = ProdutoItensDao();
  double valorTotalCarrinho = 0;

  InformaItensController() {
    fetch();
  }
  fetch() {
    dao.fetch();
    notifyListeners();
  }

  putItemSelecionadoNaLista(Produto produtoEditado) {
    this.dao.categorias.forEach((categoria) {
      categoria.produtos.forEach((produto) {
        if (produto.id == produtoEditado.id) {
          produto.selecionado = true;
          valorTotalCarrinho += produto.valorTotal;

          return notifyListeners();
        }
      });
    });
  }
}
