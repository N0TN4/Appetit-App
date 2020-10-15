import 'package:appetit_app/models/categoria.dart';
import 'package:appetit_app/models/produto.dart';

class ProdutoItensDao {
  List<Categoria> _categorias = new List<Categoria>();

  List<Categoria> get categorias => _categorias;

  set categorias(List<Categoria> categorias) {
    _categorias = categorias;
  }

  fetch() {
    Categoria categoria1 =
        Categoria(nome: "Cuscuz", produtos: new List<Produto>());
    Categoria categoria2 =
        Categoria(nome: "Pães", produtos: new List<Produto>());
    categorias.add(categoria1);
    categorias.add(categoria2);
    Produto produto = Produto(
      nome: "Cuscuz Simples",
      descricao: "milho ou arroz",
      avatar: 'assets/cuscuz.png',
      valorUnitario: 2.25,
    );
    categoria1.produtos.add(produto);
    produto = Produto(
      nome: "Cuscuz completo",
      descricao: "milho ou arroz",
      avatar: 'assets/cuscuz_completo.png',
      valorUnitario: 3.25,
    );
    categoria1.produtos.add(produto);

    produto = Produto(
      nome: "Pão caseiro",
      avatar: 'assets/pao_caseiro.png',
      valorUnitario: 2.25,
    );
    categoria2.produtos.add(produto);
    produto = Produto(
      nome: "Pão caseiro completo",
      avatar: 'assets/pao_caseiro_completo.png',
      valorUnitario: 3.25,
    );
    categoria2.produtos.add(produto);
    produto = Produto(
      nome: "Misto quente",
      avatar: 'assets/misto_quente.png',
      valorUnitario: 3.25,
    );
    categoria2.produtos.add(produto);
    produto = Produto(
      nome: "Lingua de sogra (pq.)",
      avatar: 'assets/lingua.png',
      valorUnitario: 3.25,
    );
    categoria2.produtos.add(produto);
    produto = Produto(
      nome: "lingua de sogra (gr.)",
      avatar: 'assets/lingua.png',
      valorUnitario: 3.25,
    );
    categoria2.produtos.add(produto);
  }
}
