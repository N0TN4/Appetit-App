import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'produto.dart';

class Categoria {
  String nome;
  List<Produto> produtos;
  Categoria({
    this.nome,
    this.produtos,
  });

  Categoria copyWith({
    String nome,
    List<Produto> produtos,
  }) {
    return Categoria(
      nome: nome ?? this.nome,
      produtos: produtos ?? this.produtos,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'nome': nome,
      'produtos': produtos?.map((x) => x?.toMap())?.toList(),
    };
  }

  factory Categoria.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Categoria(
      nome: map['nome'],
      produtos:
          List<Produto>.from(map['produtos']?.map((x) => Produto.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory Categoria.fromJson(String source) =>
      Categoria.fromMap(json.decode(source));

  @override
  String toString() => 'Categoria(nome: $nome, produtos: $produtos)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Categoria && o.nome == nome && listEquals(o.produtos, produtos);
  }

  @override
  int get hashCode => nome.hashCode ^ produtos.hashCode;
}
