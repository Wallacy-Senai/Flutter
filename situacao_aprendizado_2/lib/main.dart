import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

void main() => runApp(MeuApp());

class MeuApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Login',
      home: TelaLogin(),
    );
  }
}

class TelaLogin extends StatelessWidget {
  // Função para validar as credenciais do usuário
  Future<bool> verificarUsuario(String usuario, String senha) async {
    final caminhoDb = await getDatabasesPath();
    final localDb = join(caminhoDb, 'meu_banco.db');

    final db = await openDatabase(localDb);
    final List<Map<String, dynamic>> maps = await db.query('usuarios',
        where: "nome = ? AND senha = ?", whereArgs: [usuario, senha]);

    return maps.isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    String usuario;
    String senha;

    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Column(
        children: <Widget>[
          TextField(
            onChanged: (value) {
              usuario = value;
            },
            decoration: InputDecoration(
              labelText: 'Usuário',
            ),
          ),
          TextField(
            onChanged: (value) {
              senha = value;
            },
            obscureText: true,
            decoration: InputDecoration(
              labelText: 'Senha',
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              bool podeEntrar = await verificarUsuario(usuario, senha);
              if (podeEntrar) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TelaCadastro()),
                );
              } else {
                // Mostrar erro
              }
            },
            child: Text('Entrar'),
          ),
        ],
      ),
    );
  }
}

class TelaCadastro extends StatelessWidget {
  // Função para inserir um novo usuário
  Future<void> inserirUsuario(String usuario, String senha) async {
    final caminhoDb = await getDatabasesPath();
    final localDb = join(caminhoDb, 'meu_banco.db');

    final db = await openDatabase(localDb, version: 1,
        onCreate: (db, version) {
      return db.execute(
        "CREATE TABLE usuarios(id INTEGER PRIMARY KEY, nome TEXT, senha TEXT)",
      );
    });

    await db.insert(
      'usuarios',
      {'nome': usuario, 'senha': senha},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  @override
  Widget build(BuildContext context) {
    String usuario;
    String senha;

    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro'),
      ),
      body: Column(
        children: <Widget>[
          TextField(
            onChanged: (value) {
              usuario = value;
            },
            decoration: InputDecoration(
              labelText: 'Novo Usuário',
            ),
          ),
          TextField(
            onChanged: (value) {
              senha = value;
            },
            obscureText: true,
            decoration: InputDecoration(
              labelText: 'Nova Senha',
            ),
          ),
          ElevatedButton(
            onPressed: () {
              inserirUsuario(usuario, senha);
              // Mostrar confirmação
            },
            child: Text('Cadastrar'),
          ),
        ],
      ),
    );
  }
}
