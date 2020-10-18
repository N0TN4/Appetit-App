import 'package:appetit_app/controllers/cliente_controller.dart';
import 'package:appetit_app/screens/tela_cliente.dart';
import 'package:appetit_app/screens/tela_detalhes_item.dart';
import 'package:appetit_app/screens/tela_login.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'controllers/detalhes_pedido_controller.dart';
import 'controllers/informa_itens_controller.dart';
import 'screens/tela_historico_de_pedidos.dart';
import 'screens/informa_itens_do_pedido.dart';
import 'tools/theme/colors_app.dart';
import 'tools/theme/tema.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<DetalhesPedidoController>(
            create: (context) => DetalhesPedidoController()),
        ChangeNotifierProvider<InformaItensController>(
            create: (context) => InformaItensController()),
        ChangeNotifierProvider<ClienteController>(
            create: (context) => ClienteController())
      ],
      child: MaterialApp(
        title: 'Appetit App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          bottomSheetTheme:
              BottomSheetThemeData(backgroundColor: ColorsApp.corPrimaria),
          appBarTheme: AppBarTheme(
            elevation: 0,
            iconTheme: IconThemeData(color: ColorsApp.corPrimaria),
            color: ColorsApp.backgroundColor,
          ),
          fontFamily: 'Poppins',
          primaryColor: ColorsApp.corPrimaria,
          accentColor: ColorsApp.corPrimaria,
          iconTheme: Tema.iconesTema,
          textTheme: Tema.texto,
          accentIconTheme: Tema.iconesTema,
        ),
        initialRoute: '/clientes',
        routes: {
          '/': (context) => TelaLogin(),
          '/historicoDePedidos': (context) => TelaHistoricoDePedidos(),
          '/informaItensDoPedido': (context) => InformaItensDoPedido(),
          '/detalhesItem': (context) => TelaDetalhesItem(),
          '/clientes': (context) => TelaCliente(),
        },
      ),
    );
  }
}
