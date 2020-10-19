import 'package:flutter/cupertino.dart';

enum Opcao { sim, nao }

class FinalizaPedidoController extends ChangeNotifier {
  Opcao opcaoGroup = Opcao.sim;
  Opcao _opcao = Opcao.sim;

  Opcao get opcao => _opcao;

  void selecionarOpcao(Opcao opcao) {
    this.opcaoGroup = opcao;
    notifyListeners();
  }
}
