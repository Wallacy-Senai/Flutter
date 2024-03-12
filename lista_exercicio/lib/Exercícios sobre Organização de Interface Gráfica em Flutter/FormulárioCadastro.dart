import 'package:flutter/material.dart'; // Importa o pacote/material.dart que contém widgets e ferramentas para criar aplicativos Flutter.

void main() {
  runApp(MyApp()); // Função principal que inicia o aplicativo Flutter.
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) { // Método build() que retorna o widget principal do aplicativo.
    return MaterialApp(
      title: 'Formulário de Cadastro', // Define o título do aplicativo.
      theme: ThemeData(
        primarySwatch: Colors.blue, // Define a cor primária do tema do aplicativo.
      ),
      home: RegistrationForm(), // Define a tela inicial como o formulário de cadastro.
    );
  }
}

class RegistrationForm extends StatefulWidget {
  @override
  _RegistrationFormState createState() => _RegistrationFormState(); // Cria o estado do formulário de cadastro.
}

class _RegistrationFormState extends State<RegistrationForm> {
  final _formKey = GlobalKey<FormState>(); // Chave global para identificar o formulário.
  String _name = ''; // Variável para armazenar o nome digitado no formulário.
  String _email = ''; // Variável para armazenar o e-mail digitado no formulário.
  String _password = ''; // Variável para armazenar a senha digitada no formulário.

  @override
  Widget build(BuildContext context) { // Método build() que retorna a estrutura do formulário de cadastro.
    return Scaffold(
      appBar: AppBar(
        title: Text('Formulário de Cadastro'), // Define o título da barra superior.
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0), // Define o preenchimento ao redor do corpo do formulário.
        child: Form(
          key: _formKey, // Associa a chave global ao formulário.
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch, // Alinha os elementos ao longo do eixo horizontal.
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(labelText: 'Nome'), // Define a decoração do campo de texto.
                validator: (value) { // Função de validação para o campo de texto.
                  if (value!.isEmpty) { // Verifica se o valor é vazio.
                    return 'Por favor, insira seu nome'; // Retorna uma mensagem de erro se o campo estiver vazio.
                  }
                  return null; // Retorna nulo se a validação for bem-sucedida.
                },
                onSaved: (value) { // Função chamada quando o formulário é salvo.
                  _name = value!; // Atribui o valor do campo de texto à variável _name.
                },
              ),
              SizedBox(height: 16.0), // Espaçamento entre os campos de texto.
              TextFormField(
                decoration: InputDecoration(labelText: 'E-mail'), // Define a decoração do campo de texto.
                validator: (value) { // Função de validação para o campo de texto.
                  if (value!.isEmpty) { // Verifica se o valor é vazio.
                    return 'Por favor, insira seu e-mail'; // Retorna uma mensagem de erro se o campo estiver vazio.
                  }
                  return null; // Retorna nulo se a validação for bem-sucedida.
                },
                onSaved: (value) { // Função chamada quando o formulário é salvo.
                  _email = value!; // Atribui o valor do campo de texto à variável _email.
                },
              ),
              SizedBox(height: 16.0), // Espaçamento entre os campos de texto.
              TextFormField(
                decoration: InputDecoration(labelText: 'Senha'), // Define a decoração do campo de texto.
                obscureText: true, // Oculta o texto digitado.
                validator: (value) { // Função de validação para o campo de texto.
                  if (value!.isEmpty) { // Verifica se o valor é vazio.
                    return 'Por favor, insira sua senha'; // Retorna uma mensagem de erro se o campo estiver vazio.
                  }
                  return null; // Retorna nulo se a validação for bem-sucedida.
                },
                onSaved: (value) { // Função chamada quando o formulário é salvo.
                  _password = value!; // Atribui o valor do campo de texto à variável _password.
                },
              ),
              SizedBox(height: 16.0), // Espaçamento entre os campos de texto.
              ElevatedButton(
                onPressed: () { // Função chamada quando o botão é pressionado.
                  if (_formKey.currentState!.validate()) { // Verifica se o formulário é válido.
                    _formKey.currentState!.save(); // Salva os valores dos campos de texto.
                    print('Nome: $_name'); // Imprime o nome digitado.
                    print('E-mail: $_email'); // Imprime o e-mail digitado.
                    print('Senha: $_password'); // Imprime a senha digitada.
                  }
                },
                child: Text('Cadastrar'), // Define o texto exibido no botão.
              ),
            ],
          ),
        ),
      ),
    );
  }
}
