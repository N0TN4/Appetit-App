import 'package:appetit_app/controllers/cliente_controller.dart';
import 'package:appetit_app/tools/theme/tema.dart';
import 'package:flutter/material.dart';

import 'package:appetit_app/models/cliente.dart';
import 'package:appetit_app/tools/theme/colors_app.dart';
import 'package:provider/provider.dart';

class ClienteCard extends StatelessWidget {
  final Cliente cliente;
  const ClienteCard({
    Key key,
    this.cliente,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 72,
      child: Card(
        elevation: 2,
        color: cliente.selecionado ? ColorsApp.corPrimaria : Colors.white,
        child: ListTile(
            onTap: () {
              Provider.of<ClienteController>(context, listen: false)
                  .selecionarCliente(cliente);
            },
            leading: ClipOval(child: Image.asset(cliente.imagem)),
            title: Text(
              cliente.nome ?? "",
              style: cliente.selecionado
                  ? Tema.texto.headline3.copyWith(color: Colors.white)
                  : Tema.texto.headline3,
            )),
      ),
    );
  }
}
