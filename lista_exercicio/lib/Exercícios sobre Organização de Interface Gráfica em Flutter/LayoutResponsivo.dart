import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Layout Responsivo'), // Título da barra de navegação
        ),
        body: ResponsiveLayout(), // Corpo do aplicativo usando o layout responsivo
      ),
    );
  }
}

class ResponsiveLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center( // Centraliza o conteúdo vertical e horizontalmente
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center, // Centraliza os elementos verticalmente
        children: [
          Text(
            'Seja bem-vindo ao meu aplicativo!', // Texto de boas-vindas
            style: TextStyle(fontSize: 20.0), // Estilo do texto
          ),
          SizedBox(height: 20.0), // Espaço vertical entre os elementos
          Container(
            width: MediaQuery.of(context).size.width * 0.8, // Define a largura do contêiner como 80% da largura da tela
            padding: EdgeInsets.all(20.0), // Preenchimento interno do contêiner
            color: Colors.blue, // Cor de fundo do contêiner
            child: Text(
              'Este é um conteúdo responsivo.', // Texto dentro do contêiner
              style: TextStyle(fontSize: 18.0, color: Colors.white), // Estilo do texto
              textAlign: TextAlign.center, // Alinhamento do texto
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MyApp());
}
