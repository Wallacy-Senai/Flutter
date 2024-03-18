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
          title: Text('Layout Responsivo'),
        ),
        body: ResponsiveLayout(), // Usa o widget ResponsiveLayout como corpo da tela
      ),
    );
  }
}

class ResponsiveLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: LayoutBuilder( // Widget que permite acessar as restrições do layout atual
        builder: (context, constraints) {
          if (constraints.maxWidth > 600) { // Se a largura da tela for maior que 600
            return LargeContent(); // Retorna o conteúdo grande
          } else {
            return SmallContent(); // Caso contrário, retorna o conteúdo pequeno
          }
        },
      ),
    );
  }
}

class LargeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300, // Largura do container
      height: 200, // Altura do container
      color: Colors.blue, // Cor de fundo do container
      child: Center( // Widget para centralizar o conteúdo
        child: Text(
          'Conteúdo Grande', // Texto exibido
          style: TextStyle(color: Colors.white, fontSize: 24), // Estilo do texto
        ),
      ),
    );
  }
}

class SmallContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200, // Largura do container
      height: 100, // Altura do container
      color: Colors.green, // Cor de fundo do container
      child: Center( // Widget para centralizar o conteúdo
        child: Text(
          'Conteúdo Pequeno', // Texto exibido
          style: TextStyle(color: Colors.white, fontSize: 16), // Estilo do texto
        ),
      ),
    );
  }
}
