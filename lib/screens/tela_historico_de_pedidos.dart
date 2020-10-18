import 'package:appetit_app/components/main_cabecalho.dart';
import 'package:appetit_app/tools/theme/colors_app.dart';
import 'package:appetit_app/tools/theme/tema.dart';
import 'package:flutter/material.dart';

class TelaHistoricoDePedidos extends StatefulWidget {
  @override
  _TelaHistoricoDePedidosState createState() => _TelaHistoricoDePedidosState();
}

class _TelaHistoricoDePedidosState extends State<TelaHistoricoDePedidos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 56,
                ),
                MainCabecalho(
                  titulo: "Olá, Alessandra!",
                ),
                Card(
                  child: ListTile(
                    leading: Icon(
                      Icons.add,
                      color: ColorsApp.corPrimaria,
                    ),
                    title: Text(
                      "FAZER NOVO PEDIDO",
                      style: TextStyle(
                        color: Colors.black.withOpacity(0.56),
                      ),
                    ),
                    onTap: () =>
                        Navigator.pushNamed(context, '/informaItensDoPedido'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 32),
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      hintText: "Digite a sua busca aqui",
                    ),
                  ),
                ),
                Text(
                  "Em 23/10 você vendeu R\$ 16,50",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                ListView.separated(
                  padding: const EdgeInsets.only(bottom: 32),
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 3,
                  separatorBuilder: (context, index) => Divider(),
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: Image.asset('assets/avatar.png'),
                      title: Text(
                        "Hanna Montana",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                            fontSize: 16),
                      ),
                      subtitle: Text(
                        "1x Cuscuz com calabresa, 1x s...",
                        overflow: TextOverflow
                            .ellipsis, // força reticências  "..." no texto ao ser muito extenso
                      ),
                      trailing: Text(
                        "R\$ 5,50",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                            fontSize: 16),
                      ),
                    );
                  },
                ),
                Text(
                  "Em 22/10 você vendeu R\$ 5,50",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                ListView.separated(
                  padding: const EdgeInsets.only(bottom: 32),
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 3,
                  separatorBuilder: (context, index) => Divider(),
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: Image.asset('assets/avatar.png'),
                      title: Text(
                        "Hanna Montana",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                            fontSize: 16),
                      ),
                      subtitle: Text(
                        "1x Cuscuz com calabresa, 1x s...",
                        overflow: TextOverflow
                            .ellipsis, // força reticências  "..." no texto ao ser muito extenso
                      ),
                      trailing: Text(
                        "R\$ 5,50",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                            fontSize: 16),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
