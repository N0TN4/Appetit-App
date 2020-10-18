class TelaLoginController {
  bool validarForm(String email, senha) {
    // Este método valida se o email está de acordo com a regra abaixo
    // e se a senha tem mais de 8 caracteres.
    if (email.isNotEmpty &&
        RegExp(r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
            .hasMatch(email) &&
        senha.length > 8) {
      return true;
    }
    return false;
  }
}
