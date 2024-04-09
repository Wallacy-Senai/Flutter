// import 'package:flutter/material.dart';
// import 'package:sqflite/sqflite.dart';
// import 'package:path/path.dart';
// import 'settings_page.dart'; // Importe a página de configurações

// class RegisterPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Register Page', // Define o título da aplicação
//       theme: ThemeData(
//         primarySwatch: Colors.blue, // Define a cor primária da aplicação
//       ),
//       home: RegisterScreen(), // Define a página inicial como RegisterScreen
//     );
//   }
// }

// class RegisterScreen extends StatefulWidget {
//   @override
//   _RegisterScreenState createState() => _RegisterScreenState(); // Cria o estado da tela de registro
// }

// class _RegisterScreenState extends State<RegisterScreen> {
//   final TextEditingController _nameController = TextEditingController(); // Controlador para o campo de nome
//   final TextEditingController _emailController = TextEditingController(); // Controlador para o campo de e-mail
//   final TextEditingController _passwordController = TextEditingController(); // Controlador para o campo de senha

//   late Database _database; // Variável para armazenar o banco de dados
//   String _registerMessage = ''; // Mensagem para exibir o status do registro

//   @override
//   void initState() {
//     super.initState();
//     _initDatabase(); // Inicializa o banco de dados quando a tela é criada
//   }

//   Future<void> _initDatabase() async {
//     final databasesPath = await getDatabasesPath(); // Obtém o diretório onde o banco de dados será armazenado
//     final path = join(databasesPath, 'users.db'); // Define o caminho do banco de dados

//     // Abre o banco de dados ou cria um novo se não existir
//     _database = await openDatabase(
//       path,
//       version: 1,
//       onCreate: (Database db, int version) async {
//         // Cria a tabela de usuários se não existir
//         await db.execute(
//           'CREATE TABLE IF NOT EXISTS Users (id INTEGER PRIMARY KEY, name TEXT, email TEXT, password TEXT)',
//         );
//       },
//     );
//   }

//   Future<void> _registerUser(BuildContext context) async {
//     final name = _nameController.text; // Obtém o nome inserido pelo usuário
//     final email = _emailController.text; // Obtém o e-mail inserido pelo usuário
//     final password = _passwordController.text; // Obtém a senha inserida pelo usuário

//     // Insere o usuário no banco de dados
//     await _database.transaction((txn) async {
//       await txn.rawInsert(
//         'INSERT INTO Users(name, email, password) VALUES("$name", "$email", "$password")',
//       );
//     });

//     // Limpa os campos de texto após o registro
//     _nameController.clear();
//     _emailController.clear();
//     _passwordController.clear();

//     // Navega para a página de configurações após o registro bem-sucedido
//     Navigator.push(
//       context,
//       MaterialPageRoute(builder: (context) => SettingsPage()),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Register'), // Define o título da barra de navegação como "Register"
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(20.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             TextField(
//               controller: _nameController,
//               decoration: InputDecoration(
//                 labelText: 'Name', // Define o rótulo do campo como "Name"
//               ),
//             ),
//             SizedBox(height: 20.0),
//             TextField(
//               controller: _emailController,
//               decoration: InputDecoration(
//                 labelText: 'Email', // Define o rótulo do campo como "Email"
//               ),
//             ),
//             SizedBox(height: 20.0),
//             TextField(
//               controller: _passwordController,
//               decoration: InputDecoration(
//                 labelText: 'Password', // Define o rótulo do campo como "Password"
//               ),
//               obscureText: true, // Esconde o texto digitado no campo de senha
//             ),
//             SizedBox(height: 20.0),
//             ElevatedButton(
//               onPressed: () {
//                 _registerUser(context); // Chama o método para registrar o usuário
//               },
//               child: Text('Register'), // Define o texto do botão como "Register"
//             ),
//             SizedBox(height: 20.0),
//             Text(
//               _registerMessage,
//               style: TextStyle(color: Colors.green), // Define a cor do texto da mensagem de registro
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
