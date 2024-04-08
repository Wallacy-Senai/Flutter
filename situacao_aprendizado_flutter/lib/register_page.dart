import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'settings_page.dart'; // Importe a página de configurações

class RegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Register Page',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: RegisterScreen(),
    );
  }
}

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  late Database _database;
  String _registerMessage = '';

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

  Future<void> _registerUser(BuildContext context) async {
    final name = _nameController.text;
    final email = _emailController.text;
    final password = _passwordController.text;

    // Insert user into the database
    await _database.transaction((txn) async {
      await txn.rawInsert(
        'INSERT INTO Users(name, email, password) VALUES("$name", "$email", "$password")',
      );
    });

    // Clear text fields after registration
    _nameController.clear();
    _emailController.clear();
    _passwordController.clear();

    // Navigate to the settings page after successful registration
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SettingsPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Name',
              ),
            ),
            SizedBox(height: 20.0),
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
                _registerUser(context);
              },
              child: Text('Register'),
            ),
            SizedBox(height: 20.0),
            Text(
              _registerMessage,
              style: TextStyle(color: Colors.green),
            ),
          ],
        ),
      ),
    );
  }
}
