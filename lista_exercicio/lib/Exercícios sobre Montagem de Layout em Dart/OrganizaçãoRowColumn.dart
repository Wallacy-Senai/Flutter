import 'package:flutter/material.dart'; // Importa o pacote de widgets do Flutter

void main() {
  runApp(MyApp()); // Inicia o aplicativo Flutter
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Row & Column Example', // Título do aplicativo
      home: Scaffold(
        appBar: AppBar(
          title: Text('Row & Column Example'), // Título da barra de navegação
        ),
        body: Padding(
          padding: EdgeInsets.all(20.0), // Adiciona um preenchimento de 20 pixels em todos os lados do corpo
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center, // Alinha os elementos verticalmente no centro
              crossAxisAlignment: CrossAxisAlignment.center, // Alinha os elementos horizontalmente no centro
              children: [
                Text('Exemplo de Row e Column'), // Texto de exemplo
                SizedBox(height: 20.0), // Espaçamento vertical de 20 pixels
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Espaça os elementos uniformemente na linha
                  children: [
                    Icon(Icons.home), // Ícone de casa
                    Icon(Icons.favorite), // Ícone de coração
                    Icon(Icons.settings), // Ícone de configurações
                  ],
                ),
                SizedBox(height: 20.0), // Espaçamento vertical de 20 pixels
                Column(
                  mainAxisAlignment: MainAxisAlignment.center, // Alinha os elementos verticalmente no centro
                  children: [
                    Image.network(
                        'https://via.placeholder.com/150'), // Imagem de exemplo obtida de uma URL
                    SizedBox(height: 10.0), // Espaçamento vertical de 10 pixels
                    Text('Imagem de Exemplo'), // Texto de exemplo
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
