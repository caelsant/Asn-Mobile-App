class Produto {
  int id;
  String nome;
  double preco;
  Produto({required this.id, required this.nome, required this.preco});
}

var quantidade = 1;

List<Produto> produtosResult = [];

List<Produto> produtos = [
  Produto(id: 1, nome: 'Capa Iphone 13 pro max', preco: 1.00),
  Produto(id: 2, nome: 'Capa A20s', preco: 0.81),
  Produto(id: 3, nome: 'Adaptador Bluetooth', preco: 0.99),
  Produto(id: 4, nome: 'Adaptador de som pra carro', preco: 0.81),
  Produto(id: 5, nome: 'Molden de som', preco: 0.81),
  Produto(id: 6, nome: 'Fone de ouvido saco', preco: 0.81),
  Produto(id: 7, nome: 'Fone de ouvido sem fio', preco: 0.81),
  Produto(id: 8, nome: 'Roteador Intel Bras', preco: 0.81),
  Produto(id: 9, nome: 'Repetidor Wifi', preco: 0.81),
  Produto(id: 10, nome: 'Teclado sem fio', preco: 0.81),
  Produto(id: 11, nome: 'Mouse sem fio', preco: 0.81),
  Produto(id: 12, nome: 'Wireless pra pc', preco: 0.81),
  Produto(id: 13, nome: 'Cpu Gamer', preco: 0.81),
  Produto(id: 14, nome: 'Monitor 169ghz', preco: 0.81),
  Produto(id: 15, nome: 'Cartao de Memoria', preco: 0.81),
  Produto(id: 16, nome: 'Pendrive', preco: 0.81),
  Produto(id: 17, nome: 'LEAC', preco: 0.81),
  Produto(id: 18, nome: 'SIAHT', preco: 0.81),
  Produto(id: 19, nome: 'Carregador Portatil', preco: 0.81),
  Produto(id: 20, nome: 'Cabo de Iphone', preco: 10.00),
  Produto(id: 21, nome: 'Cabo', preco: 12.00),
];
