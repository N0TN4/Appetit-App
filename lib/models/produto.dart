import 'dart:convert';

class Produto {
  int id;
  String avatar;
  String nome;
  String descricao;
  double valorUnitario;
  double valorTotal;
  int quantidade;
  bool selecionado;
  Produto({
    this.id,
    this.avatar,
    this.nome,
    this.descricao,
    this.valorUnitario,
    this.valorTotal = 0,
    this.quantidade = 1,
    this.selecionado = false,
  });

  Produto copyWith({
    String avatar,
    String nome,
    String descricao,
    double valorUnitario,
    int quantidade,
    bool selecionado,
  }) {
    return Produto(
      avatar: avatar ?? this.avatar,
      nome: nome ?? this.nome,
      descricao: descricao ?? this.descricao,
      valorUnitario: valorUnitario ?? this.valorUnitario,
      quantidade: quantidade ?? this.quantidade,
      selecionado: selecionado ?? this.selecionado,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'avatar': avatar,
      'nome': nome,
      'descricao': descricao,
      'valorUnitario': valorUnitario,
      'quantidade': quantidade,
      'selecionado': selecionado,
    };
  }

  factory Produto.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Produto(
      avatar: map['avatar'],
      nome: map['nome'],
      descricao: map['descricao'],
      valorUnitario: map['valorUnitario'],
      quantidade: map['quantidade'],
      selecionado: map['selecionado'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Produto.fromJson(String source) =>
      Produto.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Produto(avatar: $avatar, nome: $nome, descricao: $descricao, valorUnitario: $valorUnitario, quantidade: $quantidade, selecionado: $selecionado)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Produto &&
        o.avatar == avatar &&
        o.nome == nome &&
        o.descricao == descricao &&
        o.valorUnitario == valorUnitario &&
        o.quantidade == quantidade &&
        o.selecionado == selecionado;
  }

  @override
  int get hashCode {
    return avatar.hashCode ^
        nome.hashCode ^
        descricao.hashCode ^
        valorUnitario.hashCode ^
        quantidade.hashCode ^
        selecionado.hashCode;
  }
}
