class Tarefa {
  String descricao;
  bool concluida;
  DateTime dataCriacao;
  DateTime dataConclusao;

  Tarefa(this.descricao, this.concluida, {required this.dataCriacao, required this.dataConclusao, required int quantidade});
}
