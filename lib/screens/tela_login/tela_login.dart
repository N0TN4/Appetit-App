import 'package:appetit_app/tools/theme/colors_app.dart';
import 'package:appetit_app/tools/theme/tema.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'tela_login_controller.dart';

class TelaLogin extends StatefulWidget {
  @override
  _TelaLoginState createState() => _TelaLoginState();
}

class _TelaLoginState extends State<TelaLogin> {
  bool senhaOculta;
  TextEditingController emailController;
  TextEditingController senhaController;
  TelaLoginController controller;

  @override
  initState() {
    senhaOculta = true;
    emailController = new TextEditingController();
    senhaController = new TextEditingController();
    controller = new TelaLoginController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(vertical: 72),
                      child: Image.asset('assets/appetit_logo.png'),
                    ),
                  ],
                ),
                Text(
                  "Seja bem-vindo!",
                  style: Tema.texto.headline1,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16, bottom: 32),
                  child: Text(
                      "Nós sabemos a importância de estar sempre de barriga cheia e o quanto isso pode ajudar no seu dia.",
                      style: Tema.texto.subtitle1),
                ),
                TextFormField(
                  onChanged: (text) =>
                      setState(() => emailController.text = text),
                  style: TextStyle(color: Colors.black.withOpacity(0.88)),
                  decoration: InputDecoration(
                    hintText: "Insira o seu e-mail aqui",
                    labelText: "Email",
                    hintStyle: TextStyle(height: 0, color: Colors.grey),
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                    isDense: false,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                      borderSide:
                          BorderSide(color: ColorsApp.corPrimaria, width: 2),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                      borderSide:
                          BorderSide(color: ColorsApp.corPrimaria, width: 1),
                    ),
                  ),
                ),
                SizedBox(
                  height: 24,
                ),
                TextFormField(
                  onChanged: (text) =>
                      setState(() => senhaController.text = text),
                  obscureText: senhaOculta,
                  style: TextStyle(color: Colors.black.withOpacity(0.88)),
                  decoration: InputDecoration(
                    hintText: "Insira a sua senha aqui",
                    labelText: "Senha",
                    hintStyle: TextStyle(height: 0, color: Colors.grey),
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                    isDense: false,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                      borderSide:
                          BorderSide(color: ColorsApp.corPrimaria, width: 2),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                      borderSide:
                          BorderSide(color: ColorsApp.corPrimaria, width: 1),
                    ),
                    suffixIcon: IconButton(
                      iconSize: 18,
                      icon: Icon(senhaOculta
                          ? FontAwesomeIcons.eyeSlash
                          : FontAwesomeIcons.eye),
                      onPressed: () =>
                          setState(() => senhaOculta = !senhaOculta),
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                ButtonTheme(
                  minWidth: MediaQuery.of(context).size.width,
                  height: 48,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(64),
                  ),
                  child: RaisedButton(
                      color: Theme.of(context).primaryColor,
                      onPressed: controller.validarForm(
                        emailController.text,
                        senhaController.text,
                      )
                          ? proximaTela
                          : null,
                      child: Text(
                        "ENTRAR",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  proximaTela() {
    return Navigator.pushNamed(context, '/historicoDePedidos');
  }
}
