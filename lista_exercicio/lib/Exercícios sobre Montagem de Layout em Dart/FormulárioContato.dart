import 'package:flutter/material.dart'; // Importa o pacote de material do Flutter

void main() {
  runApp(ContactFormApp()); // Inicia o aplicativo Flutter
}

class ContactFormApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contact Form', // Define o título do aplicativo
      home: ContactForm(), // Define a página inicial como o formulário de contato
    );
  }
}

class ContactForm extends StatefulWidget {
  @override
  _ContactFormState createState() => _ContactFormState(); // Cria o estado do widget para o formulário de contato
}

class _ContactFormState extends State<ContactForm> {
  final _formKey = GlobalKey<FormState>(); // Chave global para identificar o formulário
  TextEditingController _nameController = TextEditingController(); // Controlador para o campo de nome
  TextEditingController _emailController = TextEditingController(); // Controlador para o campo de e-mail
  TextEditingController _messageController = TextEditingController(); // Controlador para o campo de mensagem

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact Form'), // Título da barra de aplicativos
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0), // Preenchimento ao redor do formulário
        child: Form(
          key: _formKey, // Atribui a chave global ao formulário
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextFormField(
                controller: _nameController, // Atribui o controlador ao campo de texto de nome
                decoration: InputDecoration(
                  labelText: 'Name', // Rótulo do campo de texto
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter your name'; // Validação do campo de nome
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _emailController, // Atribui o controlador ao campo de texto de e-mail
                decoration: InputDecoration(
                  labelText: 'Email', // Rótulo do campo de texto
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter your email'; // Validação do campo de e-mail
                  }
                  // Você pode adicionar uma validação de e-mail mais sofisticada, se necessário
                  return null;
                },
              ),
              TextFormField(
                controller: _messageController, // Atribui o controlador ao campo de texto da mensagem
                decoration: InputDecoration(
                  labelText: 'Message', // Rótulo do campo de texto
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter a message'; // Validação do campo de mensagem
                  }
                  return null;
                },
                maxLines: 5, // Define o número máximo de linhas permitidas para o campo de texto
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0), // Preenchimento entre o botão e o último campo de texto
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      // Envie os dados do formulário aqui
                      String name = _nameController.text; // Obtém o valor do campo de nome
                      String email = _emailController.text; // Obtém o valor do campo de e-mail
                      String message = _messageController.text; // Obtém o valor do campo de mensagem

                      // Para demonstração, apenas imprime os valores
                      print('Name: $name');
                      print('Email: $email');
                      print('Message: $message');

                      // Você pode implementar o envio dos dados do formulário para um servidor backend ou qualquer outra ação apropriada
                    }
                  },
                  child: Text('Submit'), // Texto do botão
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
