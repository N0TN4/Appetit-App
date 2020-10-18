import 'dart:convert';

class Cliente {
  int id;
  String nome;
  String imagem;
  bool selecionado;
  Cliente({
    this.id,
    this.nome,
    this.imagem,
    this.selecionado = false,
  });

  Cliente copyWith({
    String nome,
    String imagem,
    bool selecionado,
  }) {
    return Cliente(
      nome: nome ?? this.nome,
      imagem: imagem ?? this.imagem,
      selecionado: selecionado ?? this.selecionado,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'nome': nome,
      'imagem': imagem,
      'selecionado': selecionado,
    };
  }

  factory Cliente.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Cliente(
      nome: map['nome'],
      imagem: map['imagem'],
      selecionado: map['selecionado'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Cliente.fromJson(String source) =>
      Cliente.fromMap(json.decode(source));

  @override
  String toString() =>
      'Cliente(nome: $nome, imagem: $imagem, selecionado: $selecionado)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Cliente &&
        o.nome == nome &&
        o.imagem == imagem &&
        o.selecionado == selecionado;
  }

  @override
  int get hashCode => nome.hashCode ^ imagem.hashCode ^ selecionado.hashCode;
}
