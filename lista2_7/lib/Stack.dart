import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Exemplo de Stack'), // Título da barra de aplicativo
        ),
        body: Center(
          child: Stack( // Widget Stack para sobreposição
            children: [
              // Widget contêiner azul
              Container(
                width: 200,
                height: 200,
                color: Colors.blue, // Cor azul
              ),
              // Widget texto branco sobreposto
              Positioned( // Posiciona o widget
                top: 50, // Distância do topo
                left: 50, // Distância da esquerda
                child: Text(
                  'Sobreposto', // Texto exibido
                  style: TextStyle(
                    color: Colors.white, // Cor do texto branca
                    fontSize: 20, // Tamanho da fonte
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
