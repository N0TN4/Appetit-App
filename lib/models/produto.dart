import 'dart:convert';

class Produto {
  String avatar;
  String nome;
  String descricao;
  double valorUnitario;
  Produto({
    this.avatar,
    this.nome,
    this.descricao,
    this.valorUnitario,
  });

  Produto copyWith({
    String avatar,
    String nome,
    String descricao,
    double valorUnitario,
  }) {
    return Produto(
      avatar: avatar ?? this.avatar,
      nome: nome ?? this.nome,
      descricao: descricao ?? this.descricao,
      valorUnitario: valorUnitario ?? this.valorUnitario,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'avatar': avatar,
      'nome': nome,
      'descricao': descricao,
      'valorUnitario': valorUnitario,
    };
  }

  factory Produto.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Produto(
      avatar: map['avatar'],
      nome: map['nome'],
      descricao: map['descricao'],
      valorUnitario: map['valorUnitario'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Produto.fromJson(String source) =>
      Produto.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Produto(avatar: $avatar, nome: $nome, descricao: $descricao, valorUnitario: $valorUnitario)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Produto &&
        o.avatar == avatar &&
        o.nome == nome &&
        o.descricao == descricao &&
        o.valorUnitario == valorUnitario;
  }

  @override
  int get hashCode {
    return avatar.hashCode ^
        nome.hashCode ^
        descricao.hashCode ^
        valorUnitario.hashCode;
  }
}
