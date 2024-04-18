// Importações necessárias
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Importação da classe Usuario do arquivo Usuario.dart
import '../Model/Usuario.dart';

// Importação da biblioteca dart:convert
import 'dart:convert';

// Classe StatefulWidget PaginaHome
// ignore: must_be_immutable
class PaginaHome extends StatefulWidget {
  String email;

  // Construtor da classe PaginaHome
  PaginaHome({required this.email});

  // Método obrigatório para criar o estado da página
  @override
  State<PaginaHome> createState() => _PaginaHomeState(email: email);
}

// Classe State _PaginaHomeState
class _PaginaHomeState extends State<PaginaHome> {
  // Declaração de variáveis
  late SharedPreferences _prefs;
  bool _darkMode = false;
  String email;
  String? _idioma;
  List<Tarefa> _tarefas = []; // Lista de tarefas

  // Construtor da classe _PaginaHomeState
  _PaginaHomeState({required this.email});

  // Método initState
  @override
  void initState() {
    super.initState();
    _loadPreferences();
  }

  // Método para carregar as preferências
  Future<void> _loadPreferences() async {
    _prefs = await SharedPreferences.getInstance();
    setState(() {
      _darkMode = _prefs.getBool('${email}_darkMode') ?? false;
      _idioma = _prefs.getString('${email}_idioma') ?? 'pt-br';
      _carregarTarefas(); // Carregar as tarefas salvas ao iniciar a tela
    });
  }

  // Método para alternar o modo escuro
  Future<void> _mudarDarkMode() async {
    setState(() {
      _darkMode = !_darkMode;
    });
    await _prefs.setBool('${email}_darkMode', _darkMode);
  }

  // Método para mudar o idioma
  Future<void> _mudarIdioma(String novoIdioma) async {
    setState(() {
      _idioma = novoIdioma;
    });
    await _prefs.setString('${email}_idioma', _idioma!);
  }

  // Método para adicionar uma nova tarefa
  void _adicionarTarefa(String titulo, String descricao) {
    setState(() {
      _tarefas.add(Tarefa(titulo: titulo, descricao: descricao, id: _tarefas.length));
      _salvarTarefas(); // Salvar as tarefas após adicionar uma nova
    });
  }

  // Método para editar uma tarefa
  void _editarTarefa(int index, String novoTitulo, String novaDescricao) {
    setState(() {
      _tarefas[index].titulo = novoTitulo;
      _tarefas[index].descricao = novaDescricao;
      _salvarTarefas(); // Salvar as tarefas após editar
    });
  }

  // Método para marcar uma tarefa como concluída
  void _marcarComoConcluida(int index, bool concluida) {
    setState(() {
      _tarefas[index].concluida = concluida;
      _salvarTarefas(); // Salvar as tarefas após marcar como concluída
    });
  }

  // Método para remover uma tarefa
  void _removerTarefa(int index) {
    setState(() {
      _tarefas.removeAt(index);
      _salvarTarefas(); // Salvar as tarefas após remover
    });
  }

  // Método para salvar as tarefas no SharedPreferences
  void _salvarTarefas() {
    List<Map<String, dynamic>> tarefasMap = _tarefas.map((tarefa) => tarefa.toMap()).toList();
    _prefs.setStringList('${email}_tarefas', tarefasMap.map((map) => jsonEncode(map)).toList());
  }

  // Método para carregar as tarefas do SharedPreferences
  void _carregarTarefas() {
    List<String>? tarefasString = _prefs.getStringList('${email}_tarefas');
    if (tarefasString != null) {
      _tarefas = tarefasString.map((string) => Tarefa.fromMap(jsonDecode(string))).toList();
    }
  }

  // Método build
  @override
  Widget build(BuildContext context) {
    return AnimatedTheme(
      data: _darkMode ? ThemeData.dark() : ThemeData.light(),
      duration: Duration(milliseconds: 500),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Armazenamento Interno'),
        ),
        body: Center(
          child: Column(
            children: [
              // Widget para selecionar o modo claro ou escuro
              Text("Selecione o Modo(Claro  ou Escuro)"),
              Switch(
                value: _darkMode,
                onChanged: (value) {
                  _mudarDarkMode();
                },
              ),
              // Widget para selecionar o idioma
              Text("Selecione o Idioma"),
              DropdownButton<String>(
                value: _idioma,
                onChanged: (value) {
                  _mudarIdioma(value!);
                },
                items: <DropdownMenuItem<String>>[
                  DropdownMenuItem(
                    value: 'pt-br',
                    child: Text('Português (Brasil)'),
                  ),
                  DropdownMenuItem(
                    value: 'en-us',
                    child: Text('Inglês (EUA)'),
                  ),
                  DropdownMenuItem(
                    value: 'es-ar',
                    child: Text('Espanhol (Argentina)'),
                  ),
                ],
              ),
              SizedBox(height: 20),
              _buildAdicionarTarefa(), // Adiciona o campo de adicionar tarefa
              SizedBox(height: 20),
              _buildListaTarefas(), // Adiciona a lista de tarefas
            ],
          ),
        ),
      ),
    );
  }

  // Widget para construir o campo de adicionar tarefa
  Widget _buildAdicionarTarefa() {
    String titulo = '';
    String descricao = '';
    return Column(
      children: [
        TextField(
          onChanged: (value) => titulo = value,
          decoration: InputDecoration(
            labelText: 'Título da Tarefa',
          ),
        ),
        TextField(
          onChanged: (value) => descricao = value,
          decoration: InputDecoration(
            labelText: 'Descrição da Tarefa',
          ),
        ),
        ElevatedButton(
          onPressed: () {
            _adicionarTarefa(titulo, descricao);
          },
          child: Text('Adicionar Tarefa'),
        ),
      ],
    );
  }

  // Widget para construir a lista de tarefas
  Widget _buildListaTarefas() {
    return Expanded(
      child: ListView.builder(
        itemCount: _tarefas.length,
        itemBuilder: (context, index) {
          final tarefa = _tarefas[index];
          return ListTile(
            title: Text(tarefa.titulo),
            subtitle: Text(tarefa.descricao),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Botão para editar a tarefa
                IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {
                    // Adicionar diálogo de edição
                    showDialog(
                      context: context,
                      builder: (context) => _buildEditarTarefaDialog(index),
                    );
                  },
                ),
                // Checkbox para marcar a tarefa como concluída
                Checkbox(
                  value: tarefa.concluida,
                  onChanged: (value) {
                    _marcarComoConcluida(index, value!);
                  },
                ),
                // Botão para remover a tarefa
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    _removerTarefa(index);
                  },
                ),
              ],
            ),
            onLongPress: () {
              // Adicionar qualquer outra ação que desejar para quando pressionar longamente a tarefa
            },
          );
        },
      ),
    );
  }

  // Widget para construir o diálogo de edição de tarefa
  Widget _buildEditarTarefaDialog(int index) {
    String novoTitulo = _tarefas[index].titulo;
    String novaDescricao = _tarefas[index].descricao;

    return AlertDialog(
      title: Text('Editar Tarefa'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Campo para editar o título da tarefa
          TextField(
            onChanged: (value) {
              novoTitulo = value;
            },
            decoration: InputDecoration(
              labelText: 'Novo Título',
            ),
          ),
          // Campo para editar a descrição da tarefa
          TextField(
            onChanged: (value) {
              novaDescricao = value;
            },
            decoration: InputDecoration(
              labelText: 'Nova Descrição',
            ),
          ),
        ],
      ),
      actions: [
        // Botão para salvar as alterações
        TextButton(
          onPressed: () {
            _editarTarefa(index, novoTitulo, novaDescricao);
            Navigator.of(context).pop();
          },
          child: Text('Salvar'),
        ),
        // Botão para cancelar a edição
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Cancelar'),
        ),
      ],
    );
  }
}
