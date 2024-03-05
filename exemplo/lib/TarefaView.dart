import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:exemplo/TarefaController.dart';

class ListaTarefasScreen extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();
  final TextEditingController _quantidadeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Tarefas'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      labelText: 'Nova Tarefa',
                    ),
                  ),
                ),
                SizedBox(width: 10),
                SizedBox(
                  width: 100,
                  child: TextField(
                    controller: _quantidadeController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Quantidade',
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    String descricao = _controller.text.trim();
                    String quantidadeStr = _quantidadeController.text.trim();
                    int quantidade =
                        quantidadeStr.isNotEmpty ? int.parse(quantidadeStr) : 1;
                    if (descricao.isNotEmpty) {
                      Provider.of<ListaTarefasController>(context,
                              listen: false)
                          .adicionarTarefa(descricao, quantidade);
                      _controller.clear();
                      _quantidadeController.clear();
                    } else {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text('Campo Vazio'),
                            content: Text(
                              'Por favor, insira uma descrição para a nova tarefa.',
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text('OK'),
                              ),
                            ],
                          );
                        },
                      );
                    }
                  },
                  icon: Icon(Icons.add),
                ),
              ],
            ),
          ),
          Expanded(
            child: Consumer<ListaTarefasController>(
              builder: (context, model, child) {
                return ListView.builder(
                  itemCount: model.tarefas.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(model.tarefas[index].descricao),
                          Text(
                              'Data de Criação: ${model.tarefas[index].dataCriacao}'),
                          if (model.tarefas[index].concluida)
                            Text(
                                'Data de Conclusão: ${model.tarefas[index].dataConclusao}'),
                        ],
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: Icon(Icons.edit),
                            onPressed: () {
                              _mostrarDialogoEdicao(context, model, index);
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () {
                              _mostrarDialogoExclusao(context, model, index);
                            },
                          ),
                          if (!model.tarefas[index].concluida)
                            IconButton(
                              icon: Icon(Icons.check),
                              onPressed: () {
                                _mostrarDialogoConfirmacaoConclusao(
                                    context, model, index);
                              },
                            ),
                        ],
                      ),
                      onLongPress: () {
                        _mostrarDialogoExclusao(context, model, index);
                      },
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void _mostrarDialogoEdicao(
      BuildContext context, ListaTarefasController model, int index) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Editar Tarefa'),
          content: TextField(
            controller:
                TextEditingController(text: model.tarefas[index].descricao),
            onChanged: (value) {
              model.atualizarTarefa(index, value);
            },
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancelar'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Salvar'),
            ),
          ],
        );
      },
    );
  }

  void _mostrarDialogoExclusao(
      BuildContext context, ListaTarefasController model, int index) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Excluir Tarefa'),
          content: Text('Tem certeza de que deseja excluir esta tarefa?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancelar'),
            ),
            ElevatedButton(
              onPressed: () {
                model.excluirTarefa(index);
                Navigator.of(context).pop();
              },
              child: Text('Excluir'),
            ),
          ],
        );
      },
    );
  }

  void _mostrarDialogoConfirmacaoConclusao(
      BuildContext context, ListaTarefasController model, int index) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Confirmar Conclusão'),
          content: Text(
              'Tem certeza de que deseja marcar esta tarefa como concluída?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancelar'),
            ),
            ElevatedButton(
              onPressed: () {
                model.marcarComoConcluida(index);
                Navigator.of(context).pop();
              },
              child: Text('Confirmar'),
            ),
          ],
        );
      },
    );
  }
}

void _mostrarDialogoExclusao(
    BuildContext context, ListaTarefasController model, int index) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text('Excluir Tarefa'),
        content: Text('Tem certeza de que deseja excluir esta tarefa?'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Fecha o diálogo
            },
            child: Text('Cancelar'),
          ),
          ElevatedButton(
            onPressed: () {
              model.excluirTarefa(index);
              Navigator.of(context).pop(); // Fecha o diálogo
            },
            child: Text('Excluir'),
          ),
        ],
      );
    },
  );
}

void _mostrarDialogoConfirmacaoConclusao(
    BuildContext context, ListaTarefasController model, int index) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text('Confirmar Conclusão'),
        content: Text(
            'Tem certeza de que deseja marcar esta tarefa como concluída?'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Fecha o diálogo
            },
            child: Text('Cancelar'),
          ),
          ElevatedButton(
            onPressed: () {
              model.marcarComoConcluida(index);
              Navigator.of(context).pop(); // Fecha o diálogo
            },
            child: Text('Confirmar'),
          ),
        ],
      );
    },
  );
}
