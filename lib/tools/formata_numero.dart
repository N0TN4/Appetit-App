import 'package:intl/intl.dart';

class FormataNumero {
  // função que formata qualquer tipo de valor para o padrão brasileiro
  static formatar(numero) {
    return NumberFormat.currency(
            decimalDigits: 2, locale: "pt_BR", symbol: "R\$")
        .format(num.parse(numero));
  }
}
