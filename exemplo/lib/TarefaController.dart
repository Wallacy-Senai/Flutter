import 'package:flutter/material.dart';
import 'TarefaModel.dart';

class ListaTarefasController extends ChangeNotifier {
  List<Tarefa> _tarefas = [];
  List<Tarefa> get tarefas => _tarefas;

  void adicionarTarefa(BuildContext context, String descricao, int quantidade) {
    // Verifica se já existe uma tarefa com o mesmo nome
    if (_tarefas.any((tarefa) => tarefa.descricao == descricao)) {
      // Exibe um SnackBar informando ao usuário que a tarefa já existe
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Uma tarefa com o mesmo nome já existe.'),
        ),
      );
      return; // Retorna sem adicionar a tarefa
    }

    // Se não houver tarefa com o mesmo nome, adiciona a nova tarefa
    _tarefas.add(Tarefa(
      descricao,
      false,
      dataCriacao: DateTime.now(),
      dataConclusao: DateTime.now(),
      quantidade: quantidade,
    ));
    notifyListeners();
  }

  void marcarComoConcluida(int indice) {
    if (indice >= 0 && indice < _tarefas.length) {
      _tarefas[indice].concluida = true;
      notifyListeners();
    }
  }

  // Método para excluir uma tarefa com base no índice
  void excluirTarefa(int indice) {
    if (indice < 0 || indice >= _tarefas.length) {
      throw Exception('Índice de tarefa inválido.');
    }

    _tarefas.removeAt(indice);
    // Notifica os ouvintes sobre a mudança no estado
    notifyListeners();
  }

  // Método para atualizar uma tarefa com base no índice e na nova descrição
  void atualizarTarefa(int indice, String novaDescricao) {
    if (indice < 0 || indice >= _tarefas.length) {
      throw Exception('Índice de tarefa inválido.');
    }

    // Verifica se a nova descrição já existe na lista
    if (_tarefas.any((tarefa) => tarefa.descricao == novaDescricao)) {
      throw Exception('Esta descrição já está sendo usada por outra tarefa.');
    }
    
    _tarefas[indice].descricao = novaDescricao;
    // Notifica os ouvintes sobre a mudança no estado
    notifyListeners();
  }
}
