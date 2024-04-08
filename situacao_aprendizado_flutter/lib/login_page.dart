import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'register_page.dart'; // Importe a RegisterPage

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Page',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginScreen(),
    );
  }
}

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  late Database _database;

  @override
  void initState() {
    super.initState();
    _initDatabase();
  }

  Future<void> _initDatabase() async {
    final databasesPath = await getDatabasesPath();
    final path = join(databasesPath, 'users.db');

    // Open the database
    _database = await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        // Create the user table
        await db.execute(
          'CREATE TABLE IF NOT EXISTS Users (id INTEGER PRIMARY KEY, name TEXT, email TEXT, password TEXT)',
        );
      },
    );
  }

  Future<void> _loginUser() async {
    final email = _emailController.text;
    final password = _passwordController.text;

    // Query the database for the user with provided email and password
    final List<Map<String, dynamic>> user = await _database.rawQuery(
      'SELECT * FROM Users WHERE email = ? AND password = ?',
      [email, password],
    );

    if (user.isNotEmpty) {
      // Se um usuário com as credenciais fornecidas for encontrado, faça algo, como navegar para outra página
      print('Usuário autenticado: $user');
    } else {
      // Se não houver usuário encontrado com as credenciais fornecidas, exiba uma mensagem de erro
      print('Credenciais inválidas');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email',
              ),
            ),
            SizedBox(height: 20.0),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
              ),
              obscureText: true,
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                _loginUser();
              },
              child: Text('Login'),
            ),
            SizedBox(height: 10.0),
            TextButton(
              onPressed: () {
                // Navegue para a página de registro ao pressionar o botão "Não tem uma conta? Cadastre-se aqui"
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RegisterPage()),
                );
              },
              child: Text('Não tem uma conta? Cadastre-se aqui'),
            ),
          ],
        ),
      ),
    );
  }
}
