import 'package:appetit_app/screens/tela_login/tela_login_controller.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  // os testes desse método de login verifica se o usuário pode tocar no botão
  // de entrar e seguir para a próxima tela.
  test('Deve retornar verdadeiro com email e senha válidos.', () {
    TelaLoginController controller = new TelaLoginController();
    final bool valorAtual =
        controller.validarForm("a.a.a.j@hotmail.com.br", '123456789');
    expect(valorAtual, true);
  });
  test(
      'Deve retornar falso com email válido e senha com menos de 8 caracteres.',
      () {
    TelaLoginController controller = new TelaLoginController();
    final bool valorAtual =
        controller.validarForm("a.a.a.j@hotmail.com.br", '123456');
    expect(valorAtual, false);
  });

  test(
      'Deve retornar falso com email sem o @  e senha com mais de 8 caracteres.',
      () {
    TelaLoginController controller = new TelaLoginController();
    final bool valorAtual =
        controller.validarForm("a.a.a.jhotmail.com.br", '123456789');
    expect(valorAtual, false);
  });
  test(
      'Deve retornar falso com email sem o .com, .bol, .br, etc  e senha com mais de 8 caracteres.',
      () {
    TelaLoginController controller = new TelaLoginController();
    final bool valorAtual =
        controller.validarForm("a.a.a.j@hotmail", '123456789');
    expect(valorAtual, false);
  });
  test(
      'Deve retornar falso com email maiúsculo e senha com mais de 8 caracteres.',
      () {
    TelaLoginController controller = new TelaLoginController();
    final bool valorAtual =
        controller.validarForm("A.A.A.J@HOTMAIL.COM.BR", '123456789');
    expect(valorAtual, false);
  });

  test(
      'Deve retornar falso com um email válido e senha com exatos 8 caracteres.',
      () {
    TelaLoginController controller = new TelaLoginController();
    final bool valorAtual =
        controller.validarForm("a.a.a.j@hotmail.com.br", '12345678');
    expect(valorAtual, false);
  });

  test('Deve retornar falso com um email válido e senha vazia', () {
    TelaLoginController controller = new TelaLoginController();
    final bool valorAtual =
        controller.validarForm("a.a.a.j@hotmail.com.br", '');
    expect(valorAtual, false);
  });

  test('Deve retornar falso com um email vazio e senha vazia', () {
    TelaLoginController controller = new TelaLoginController();
    final bool valorAtual = controller.validarForm('', '');
    expect(valorAtual, false);
  });
  test(
      'Deve retornar falso com um email vazio e senha preenchida de acordo com a regra de mais de 8 caracteres',
      () {
    TelaLoginController controller = new TelaLoginController();
    final bool valorAtual = controller.validarForm('', '123456789');
    expect(valorAtual, false);
  });
}
