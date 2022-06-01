// ignore_for_file: avoid_print, avoid_function_literals_in_foreach_calls

import 'package:app/models/fakeApi.dart';

class Adicionados {
  int id;
  int quantidade;
  int valor;
  Adicionados(
      {required this.id, required this.quantidade, required this.valor});
}

List<Adicionados> adicionados = [];

void main() {
  Iterable<Produto> idProduto =
      produtos.where((element) => element.id.toString() == "15");
  idProduto.forEach((element) {});
}
