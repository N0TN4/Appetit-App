import 'package:appetit_app/components/cliente_card.dart';
import 'package:appetit_app/components/main_cabecalho.dart';
import 'package:appetit_app/components/progress_indicator.dart';
import 'package:appetit_app/controllers/cliente_controller.dart';
import 'package:appetit_app/tools/theme/colors_app.dart';
import 'package:appetit_app/tools/theme/tema.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TelaCliente extends StatefulWidget {
  @override
  _TelaClienteState createState() => _TelaClienteState();
}

class _TelaClienteState extends State<TelaCliente> {
  @override
  initState() {
    super.initState();
    final provider = Provider.of<ClienteController>(context, listen: false);
    if (provider.clientes.length == 0) provider.getClientes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              MainCabecalho(
                titulo: "Informações para o pedido",
                subtitulo:
                    "Preencha as informações abaixo para concluir o pedido.",
              ),
              Padding(
                padding: const EdgeInsets.only(top: 24, bottom: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "Para quem você está vendendo?",
                      style: Tema.texto.headline3,
                    ),
                    Text(
                      "2 de 3",
                      style: Tema.texto.subtitle1,
                    ),
                  ],
                ),
              ),
              ProgressIndicatorCustom(
                begin: 0,
                end: 0.6,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 24),
                child: TextField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    hintText: "Digite a sua busca aqui",
                  ),
                ),
              ),
              Text(
                "Meus clientes",
                style: Tema.texto.headline3,
              ),
              SizedBox(
                height: 16,
              ),
              Consumer<ClienteController>(
                  builder: (context, controller, widget) {
                if (controller.clientes != null &&
                    controller.clientes.length >= 0) {
                  return Container(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: controller.clientes.length,
                      itemBuilder: (context, index) {
                        return ClienteCard(
                          cliente: controller.clientes[index],
                        );
                      },
                    ),
                  );
                } else {
                  return Container();
                }
              }),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: ColorsApp.corPrimaria,
        onPressed: () {},
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      bottomNavigationBar: Container(
        color: ColorsApp.corPrimaria,
        height: 56,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Text(
                "${Provider.of<ClienteController>(context, listen: true).totalClientesSelecionados} clientes selecionados",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
            GestureDetector(
              onTap: () => Navigator.pushNamed(context, '/finalizaPedido'),
              child: Container(
                padding: const EdgeInsets.only(right: 16),
                child: Row(
                  children: <Widget>[
                    Text(
                      "Avançar",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    SizedBox(
                      width: 24,
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.white,
                      size: 14,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
