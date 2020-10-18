import 'package:appetit_app/models/cliente.dart';
import 'package:flutter/cupertino.dart';

class ClienteController extends ChangeNotifier {
  List<Cliente> clientes = new List<Cliente>();
  int totalClientesSelecionados = 0;

  getClientes() {
    this.clientes.add(new Cliente(
        id: 1, imagem: 'assets/cliente1.png', nome: 'Justine Marshall'));
    this.clientes.add(new Cliente(
        id: 2, imagem: 'assets/cliente2.png', nome: 'Bairam Frootan'));
    this.clientes.add(new Cliente(
        id: 3, imagem: 'assets/cliente3.png', nome: 'Bairam Frootan'));
  }

  selecionarCliente(Cliente cliente) {
    clientes.forEach((element) {
      if (element.id == cliente.id) {
        element.selecionado = !element.selecionado;
        element.selecionado
            ? totalClientesSelecionados++
            : totalClientesSelecionados--;

        notifyListeners();
      }
    });
  }
}
