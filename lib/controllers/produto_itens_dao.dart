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
        id: 1,
        nome: "Cuscuz Simples",
        descricao: "milho ou arroz",
        avatar: 'assets/cuscuz.png',
        valorUnitario: 2.25,
        valorTotal: 1 * 2.25);
    categoria1.produtos.add(produto);
    produto = Produto(
        id: 2,
        nome: "Cuscuz completo",
        descricao: "milho ou arroz",
        avatar: 'assets/cuscuz_completo.png',
        valorUnitario: 3.25,
        valorTotal: 1 * 3.25);
    categoria1.produtos.add(produto);

    produto = Produto(
        id: 3,
        nome: "Pão caseiro",
        avatar: 'assets/pao_caseiro.png',
        valorUnitario: 2.25,
        valorTotal: 1 * 2.25);
    categoria2.produtos.add(produto);
    produto = Produto(
        id: 4,
        nome: "Pão caseiro completo",
        avatar: 'assets/pao_caseiro_completo.png',
        valorUnitario: 3.25,
        valorTotal: 1 * 3.25);
    categoria2.produtos.add(produto);
    produto = Produto(
        id: 5,
        nome: "Misto quente",
        avatar: 'assets/misto_quente.png',
        valorUnitario: 3.25,
        valorTotal: 1 * 3.25);
    categoria2.produtos.add(produto);
    produto = Produto(
        id: 6,
        nome: "Lingua de sogra (pq.)",
        avatar: 'assets/lingua.png',
        valorUnitario: 3.25,
        valorTotal: 1 * 3.25);
    categoria2.produtos.add(produto);
    produto = Produto(
        id: 7,
        nome: "lingua de sogra (gr.)",
        avatar: 'assets/lingua.png',
        valorUnitario: 3.25,
        valorTotal: 1 * 3.25);
    categoria2.produtos.add(produto);
  }
}
